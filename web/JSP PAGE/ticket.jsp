<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
String name = request.getParameter("name");
String date = request.getParameter("date");
String time = request.getParameter("time");
String adults = request.getParameter("adults");
String children = request.getParameter("children");
%>

<!DOCTYPE html>
<html>
<head>
<title>Strawberry Farm Ticket</title>

<style>

body{
font-family: Arial;
background:#f7f7f7;
text-align:center;
}

.ticket{
width:400px;
margin:50px auto;
background:white;
padding:20px;
border-radius:10px;
border:3px dashed #ff4d6d;
box-shadow:0px 0px 10px gray;
}

h2{
color:#ff4d6d;
}

.details{
text-align:left;
margin-top:20px;
font-size:18px;
}

button{
margin-top:20px;
padding:10px 20px;
background:#ff4d6d;
color:white;
border:none;
border-radius:5px;
font-size:16px;
cursor:pointer;
}

</style>

<script src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>

<script>

function downloadTicket(){

html2canvas(document.querySelector(".ticket")).then(canvas => {

var link=document.createElement("a");
link.download="StrawberryFarmTicket.jpg";
link.href=canvas.toDataURL();
link.click();

});

}

</script>

</head>

<body>

<div class="ticket">

<h2>🍓 Strawberry Farm Entry Ticket 🍓</h2>

<div class="details">

<p><b>Name:</b> <%=name%></p>
<p><b>Date:</b> <%=date%></p>
<p><b>Time:</b> <%=time%></p>
<p><b>Adults:</b> <%=adults%></p>
<p><b>Children:</b> <%=children%></p>

</div>

<button onclick="downloadTicket()">Download Ticket</button>

</div>

</body>
</html>