<%@page import="java.sql.*"%>
<html>
<head>
    <link href="../CSS/adminDashbord.css" rel="stylesheet" type="text/css"/>
    <title>Admin Dashboard - Strawberry Farm</title>
</head>
<body>

    <div id="header"> 
        
        <img id="starwberry" src="../images/14.jpg" height="50px" width="70px" alt=""/>
        
        <nav id="n1">
                        <a href="../index.html">Home</a> |
                        <a href="../about.html">About</a> |
                        <a href="../gallery.html">Gallery</a> |
                        <a href="../activities.html">Activities</a> |
                        <a href="../booking.html">Booking</a> |
                        <a href="../contact.html">Contact</a> |
                        <a href="../location.html">Location</a> |
            <a href="../index.html">logout</a>
            
        </nav>
    </div>

    <h1 id="main-heading">Welcome, Admin</h1>

    <div class="dashboard-container">

        <div class="card">
            <h2>Customer Bookings</h2>
            <table>
                <tr>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Date</th>
                    <th>People</th>
                </tr>
                <%
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/strawberryfarm","root","");
                        Statement st = con.createStatement();
                        ResultSet rs = st.executeQuery("SELECT * FROM book");
                        while(rs.next()){
                %>
                <tr>
                    <td><%= rs.getString("name1") %></td>
                    <td><%= rs.getString("email1") %></td>
                    <td><%= rs.getString("date1") %></td>
                    <td><%= rs.getString("people1") %></td>
                </tr>
                <%
                        }
                        con.close();
                    } catch(Exception e){
                        out.println("<tr><td colspan='4'>Error: "+e.getMessage()+"</td></tr>");
                    }
                %>
            </table>
        </div>

        <div class="card">
            <h2>Customer Feedback</h2>
            <table>
                <tr>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Feedback</th>
                </tr>
                <%
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/strawberryfarm","root","");
                        Statement st2 = con2.createStatement();
                        ResultSet rs2 = st2.executeQuery("SELECT * FROM contact");
                        while(rs2.next()){
                %>
                <tr>
                    <td><%= rs2.getString("name") %></td>
                    <td><%= rs2.getString("email") %></td>
                    <td><%= rs2.getString("feedback") %></td>
                </tr>
                <%
                        }
                        con2.close();
                    } catch(Exception e){
                        out.println("<tr><td colspan='3'>Error: "+e.getMessage()+"</td></tr>");
                    }
                %>
            </table>
        </div>
    </div>

</body>
</html>
