<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="style.css">
    <title>result</title>
</head>
<body>
    <% if(request.getParameter("x")!=null){out.println(request.getParameter("x"));}%>
    <a href="index.jsp">go back</a>
</body>
</html>
