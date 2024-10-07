<%@ page import="java.util.Iterator" %>
<%@ page import="com.example.web_2.PointModel" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.web_2.PointList" %>
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
    <table id = "table">
        <thead>
        <tr>
            <th class="x_th">Coord. x</th>
            <th>Coord. y</th>
            <th>R value</th>
            <th id ="hit_th">Hit</th>
        </tr>
        </thead>
        <tbody id = "table_body">
            <%  PointList pointList = (PointList) session.getAttribute("pointList");
            ArrayList<PointModel> list = pointList.getPointList();
                for (PointModel point : list) { %>
                    <tr>
                        <td><%=point.getX()%></td>;
                        <td><%=point.getY()%></td>;
                        <td><%=point.getR()%></td>;
                        <td><%=point.getHit()%></td>;
                    </tr>
                }
            <%}%>
        </tbody>
    </table>
    <a href="index.jsp">go back</a>
</body>
</html>
