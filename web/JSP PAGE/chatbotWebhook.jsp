<%@ page import="java.sql.*, java.io.*, org.json.*" %>

<%
response.setContentType("application/json");

StringBuilder jb = new StringBuilder();
String line = null;

BufferedReader reader = request.getReader();
while ((line = reader.readLine()) != null)
    jb.append(line);

JSONObject json = new JSONObject(jb.toString());

String date = json.getJSONObject("queryResult")
                  .getJSONObject("parameters")
                  .getString("booking_date");

int MAX_CAPACITY = 50; // ? Change this

int totalBooked = 0;

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/strawberryfarm",
        "root",
        "YOUR_PASSWORD"
    );

    PreparedStatement ps = con.prepareStatement(
        "SELECT SUM(people1) FROM book WHERE date1 = ?"
    );
    ps.setString(1, date);

    ResultSet rs = ps.executeQuery();

    if (rs.next()) {
        totalBooked = rs.getInt(1);
    }

    con.close();

} catch (Exception e) {
    e.printStackTrace();
}

int remaining = MAX_CAPACITY - totalBooked;

String reply;

if (remaining > 0) {
    reply = "Yes! " + remaining + " spots are available on " + date;
} else {
    reply = "Sorry, fully booked on " + date;
}

JSONObject responseJson = new JSONObject();
responseJson.put("fulfillmentText", reply);

out.print(responseJson.toString());
%>