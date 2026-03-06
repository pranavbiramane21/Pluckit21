<%@ page import="java.sql.*" %>
<%
    String url = "jdbc:mysql://localhost:3306/strawberryfarm";
    String user = "root";   
    String pass = "";        

    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String message = request.getParameter("message");
    String button = request.getParameter("submit");

    Connection con = null;
    Statement st = null;
    ResultSet rs = null;
    String successMsg = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection(url, user, pass);
        st = con.createStatement();

        
        if ("Submit".equals(button) && name != null && email != null && message != null) {
            String query = "INSERT INTO contact(name, email, feedback) VALUES ('" 
                            + name + "','" + email + "','" + message + "')";
            st.executeUpdate(query);
            successMsg = "Your feedback has been submitted successfully!";
        }

        
        rs = st.executeQuery("SELECT name, email, feedback FROM contact");
%>
<!DOCTYPE html>
<html>
<head>
    <link href="../CSS/conntact.css" rel="stylesheet" type="text/css"/>
    <title>Contact Us</title>
</head>
<body>
   <div id="header">
       
       <img   src="../images/14.jpg" id="starwberry" height="50px" width="70px"  alt=""/>
       <nav id="n1">
    <a id="a0" href="../adminlogin.html">Admin login</a> |
    <a id="a1" href="../index.html">Home</a> |
    <a id="a2" href="../about.html">About Us</a> |
    <a id="a3" href="../gallery.html">Gallery</a> |
    <a id="a4" href="../activities.html">Activities</a> |
    <a id="a5" href="../booking.html">Booking</a> |
    <a id="a6" href="contact.jsp">Contact</a> |
    <a id="a7" href="../location.html">Location</a>
</nav>

       
       
       
   </div>
     
   <br><br>
     
   <div id="image-container">
       <img id="immgs" src="../images/220.jpg" height="420px" width="1340px" alt=""/>
       <div id="text-overlay">
           <h1> Contact us & convey your message!</h1>
       </div>
   </div>
    
   <div id="left">
       <h1 id="get"> Get In Touch </h1>
       <p id="pp"> Pranav Sunil Biramane</p>
       <p id="pp"> Prasad Umesh Bhise</p>
       <p id="pp"> Harsh Pramod Malekar</p>
       <p id="pp"> House No.45, Near Jila Parishad Prathmik School, Avakali,<br> Mahabaleshwar, Maharashtra. 412806</p>
       <br>
       <p id="pp">Phone: 123-456-7890</p>
       <p id="pp">Email: info@strawberryfarm.com</p>
       <p id="pp">Address: Fresh Strawberry Farm, Mahabaleshwar </p>
   </div>

   <div id="right">
       <h1 id="feed">Feedback</h1>
       <p id="ppp">
           Your valuable feedback will be too helpful in our journey, so please convey how you<br> 
           feel by visiting our strawberry farm...  
       </p>

       <% if (successMsg != null) { %>
           <div style="color: lightgreen; font-weight: bold; margin-left:20px;">
               <%= successMsg %>
           </div><br>
       <% } %>
      
       <form method="post" action="contact.jsp">
           <label id="ll">Your Name (required):</label><br>
           <input id="l2" type="text" name="name" required><br><br>

           <label id="ll">Your Email (required):</label><br>
           <input id="l2" type="email" name="email" required><br><br>

           <label id="ll">Your Message:</label><br>
           <textarea id="l2" name="message" rows="5" cols="40" required></textarea><br><br>

           <input id="submit" type="submit" name="submit" value="Submit">
       </form>


   </div>

   <br><br>
   <div id="feedback">
       <h1 id="heading">Reviews of our happy customers</h1>
       <%
           while (rs.next()) {
       %>
           <div style="margin:15px; padding:10px; border-bottom:1px solid #ccc; font-family:cursive;">
               <b><%= rs.getString("name") %></b> (<%= rs.getString("email") %>)<br>
               <%= rs.getString("feedback") %>
           </div>
           
       <%
           }
       %>
   </div>
</body>
</html>
<%
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    } finally {
        if (rs != null) rs.close();
        if (st != null) st.close();
        if (con != null) con.close();
    }
%>
