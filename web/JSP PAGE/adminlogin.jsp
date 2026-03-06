<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    if("farmadmin".equals(username) && "farm1111".equals(password)) {
        session.setAttribute("adminUser", username);
        response.sendRedirect("adminDashboard.jsp");  
    } else {
%>
        <script>
            alert("Invalid Username or Password!");
            window.location.href = "adminlogin.html";
        </script>
<%
    }
%>
