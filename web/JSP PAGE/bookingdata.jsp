<%@ page import="java.util.Properties" %>
<%@ page import="javax.mail.*" %>
<%@ page import="javax.mail.internet.*" %>
<%@page import="java.sql.*"%>
<%@page import="javax.mail.*"%>
<%@page import="javax.mail.internet.*"%>
<%@page import="java.util.Properties"%>

<%

String name1 = request.getParameter("name");
String email1 = request.getParameter("email");
String mobile1 = request.getParameter("mobile");
String date1 = request.getParameter("date");
String people1 = request.getParameter("people");

String adults1 = request.getParameter("adults");
String children1 = request.getParameter("children");
String timeslot1 = request.getParameter("timeslot");

String submit = request.getParameter("btn");

if(submit != null && submit.equals("Book"))
{
try
{
// DATABASE CONNECTION
   Class.forName("com.mysql.cj.jdbc.Driver");

Connection con = DriverManager.getConnection(
"jdbc:mysql://sql12.freesqldatabase.com:3306/sql12819535?useSSL=false&allowPublicKeyRetrieval=true",
"sql12819535",
"pZ4mgQ6Z11");

Statement st = con.createStatement();
    
    
    
    
    
    
    //old database 
   /* Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/strawberryfarm","root","");
    Statement st = con.createStatement(); */

    String query = "INSERT INTO book(name1,email1,mobile1,date1,people1,adults,children,timeslot) VALUES('"
    + name1 + "','"
    + email1 + "','"
    + mobile1 + "','"
    + date1 + "','"
    + people1 + "','"
    + adults1 + "','"
    + children1 + "','"
    + timeslot1 + "')";

    st.executeUpdate(query);


    
    // TICKET LINK
    //new ticket link with render
    String ticketLink = "https://pluckit21-13.onrender.com/ticket.jsp?name=" + name1
+ "&date=" + date1
+ "&time=" + timeslot1
+ "&adults=" + adults1
+ "&children=" + children1;
    
    
    
    //old link
    
  /*  String ticketLink = "http://localhost:8080/pluckIt/ticket.jsp?name=" + name1
+ "&date=" + date1
+ "&time=" + timeslot1
+ "&adults=" + adults1
+ "&children=" + children1; */
   
    
  


    // EMAIL SENDING
    try
    {
        final String to = email1;
        final String from = "biramanepranav04@gmail.com";
        final String password = "gdyjtlzjnkymlegw";

        Properties props = new Properties();
        props.put("mail.smtp.host","smtp.gmail.com");
        props.put("mail.smtp.port","587");
        props.put("mail.smtp.auth","true");
        props.put("mail.smtp.starttls.enable","true");

        Session mailSession = Session.getInstance(props,
        new javax.mail.Authenticator()
        {
            protected PasswordAuthentication getPasswordAuthentication()
            {
                return new PasswordAuthentication(from,password);
            }
        });

        MimeMessage message = new MimeMessage(mailSession);

        message.setFrom(new InternetAddress(from));
        message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));

        message.setSubject("? Strawberry Farm Booking Confirmation ?");

        message.setText(
        "Hello " + name1 + ",\n\n" +
        "? Your Strawberry Farm visit is confirmed!\n\n" +
        "? Visit Date: " + date1 + "\n" +
        "? Time Slot: " + timeslot1 + "\n" +
        "? Adults: " + adults1 + "\n" +
        "? Children: " + children1 + "\n\n" +
        "? Download your ticket here:\n" +
        ticketLink + "\n\n" +
        "? Please arrive 10 minutes before your time slot.\n\n" +
        "? Thank you for booking with us.\n" +
        "See you soon at the Strawberry Farm! ?"
        );

        Transport.send(message);
    }
    catch(Exception mailError)
    {
        out.println("Mail Error: " + mailError);
    }

    // SUCCESS MESSAGE
    out.println("<script type='text/javascript'>");
    out.println("alert('Farm visit booked successfully! Confirmation email sent.');");
    out.println("window.location='../booking.html';");
    out.println("</script>");

    con.close();
}
catch(Exception e)
{
    out.println("Error = " + e);
}


}

%>
