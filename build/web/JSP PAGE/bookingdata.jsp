<%@page import="java.sql.*"%>
<%
    String name1 = request.getParameter("name");
    String email1 = request.getParameter("email");
    String mobile1 = request.getParameter("mobile");
    String date1 = request.getParameter("date");
    String people1 = request.getParameter("people");
    String submit = request.getParameter("btn"); 

    if(submit != null && submit.equals("Book")) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/strawberryfarm","root","");
            Statement st = con.createStatement();
            st.executeUpdate("INSERT INTO book VALUES ('" + name1 + "','" + email1 + "','" + mobile1 + "','" + date1 + "','" + people1 + "')");

           
            out.println("<script type='text/javascript'>");
            out.println("alert('Farm visit booked successfully!');");
            out.println("window.location='..//booking.html';");  
            out.println("</script>");

            con.close();
        } catch(Exception e) {
            out.println("error=" + e);
        }
    }
%>
