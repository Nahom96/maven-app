<%
    java.util.Calendar calendar = java.util.Calendar.getInstance();
    int hour = calendar.get(java.util.Calendar.HOUR_OF_DAY);
    String greeting = (hour < 12) ? "Good morning" : "Good afternoon";
%>
<html>
<head><title>COMP367</title></head>
<body>
    <h1><%= greeting %>, Nahom, Welcome to COMP367</h1>
</body>
</html>
