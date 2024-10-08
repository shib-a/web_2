<%@ page import="com.example.web_2.PointList" %>
<%@ page import="com.example.web_2.PointModel" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link rel="stylesheet" href="style.css">
  <title>web_2</title>
</head>
<body>
<div class="base">
  <header class="main_header">
    <h1 id="h1">Мартышов Данила Викторович, Р3207, Вариант 409091</h1>
  </header>
  <form id="data">
    <div class = "q_entry">
      <div>
        <label>Изменение X</label>
      </div>
      <button type="button", class="ch_x">-3</button>
      <button type="button", class="ch_x">-2</button>
      <button type="button", class="ch_x">-1</button>
      <button type="button", class="ch_x">0</button>
      <button type="button", class="ch_x">1</button>
      <button type="button", class="ch_x">2</button>
      <button type="button", class="ch_x">3</button>
      <button type="button", class="ch_x">4</button>
      <button type="button", class="ch_x">5</button>
    </div>
    <div class = "q_entry">
      <div><label for="data_ch_y">Изменение Y</label></div>
      <input type="text", name="ch_y", placeholder="-5..5", id="data_ch_y">
    </div>
    <div>

    </div>
    <div class="q_entry" id = 'r_choice'>
      <div>
        <label>Изменение R</label>
      </div>
      <button type="button", class="r_change">1</button>
      <button type="button", class="r_change">2</button>
      <button type="button", class="r_change">3</button>
      <button type="button", class="r_change">4</button>
      <button type="button", class="r_change">5</button>
    </div>
    <input type="button" id = "submit_button" value = "Submit">
  </form>
  <div id = "ti_div">
    <div id = "table_div">
      <table id = "table" class = res_table>
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
        if(pointList!=null){
          ArrayList<PointModel> list = pointList.getPointList();
          for (PointModel point : list) { %>
        <tr>
          <td><%=point.getX()%></td>
          <td><%=point.getY()%></td>
          <td><%=point.getR()%></td>
          <td><%=point.getHit()%></td>
        </tr>
        <%}}%>
        </tbody>
      </table>
      <div id="svg_div">
        <svg xmlns="http://www.w3.org/2000/svg" width="300" height="300" viewBox="-150 -150 300 300" id="svg">
          <g transform="scale(1, -1)">
            <line x1="-150" y1 = "0" x2 = "150" y2="0" stroke="black" stroke-width="1"></line>
            <line x1="0" y1 = "-150" x2 = "0" y2="150" stroke="black" stroke-width="1"></line>
            <%--   horizontal -s   --%>
            <line x1 ="70" y1="5" x2="70" y2="-5" stroke="black" stroke-width="1"></line>
            <line x1 ="140" y1="5" x2="140" y2="-5" stroke="black" stroke-width="1"></line>
            <line x1 ="-70" y1="5" x2="-70" y2="-5" stroke="black" stroke-width="1"></line>
            <line x1 ="-140" y1="5" x2="-140" y2="-5" stroke="black" stroke-width="1"></line>
            <%--   vertical -s   --%>
            <line x1 ="5" y1="70" x2="-5" y2="70" stroke="black" stroke-width="1"></line>
            <line x1 ="5" y1="140" x2="-5" y2="140" stroke="black" stroke-width="1"></line>
            <line x1 ="5" y1="-70" x2="-5" y2="-70" stroke="black" stroke-width="1"></line>
            <line x1 ="5" y1="-140" x2="-5" y2="-140" stroke="black" stroke-width="1"></line>

            <polygon points="0,0 0,140 -70,0" fill="blue" fill-opacity="0.4"></polygon>
            <path d="M 0 -140 C 0 -140, -140 -140, -140 -0 L 0 0 L 0 -140 Z" fill="blue" fill-opacity="0.4"></path>
          </g>
          <%--   horizontal Rs   --%>
          <text x="60" y="-8">R/2</text>
          <text x="135" y="-8">R</text>
          <text x="-85" y="-8">-R/2</text>
          <text x="-145" y="-8">-R</text>
          <%--   vertical -s   --%>
          <text x="7" y="-65">R/2</text>
          <text x="7" y="-135">R</text>
          <text x="7" y="65">-R/2</text>
          <text x="7" y="135">-R</text>

          <rect x="0" y="0" height="140" width="70" fill-opacity="0.4" fill="blue"></rect>
          <%--    points     --%>
          <%if (pointList!=null){
            ArrayList<PointModel> list = pointList.getPointList();
            for (PointModel point : list) {%>
              <circle cx = "<%if(point.getRaw_x()==null){%><%=point.toDumbAssCoords().get("x")%><%} else{%><%=point.getRaw_x()%><%}%>" cy="<%if(point.getRaw_y()==null){%><%=point.toDumbAssCoords().get("y")%><%} else{%><%=point.getRaw_y()%><%}%>" r="5" fill="red"></circle>
          <%}}%>
          <%--        <path d="M 0 140 A 70 70 0 0 1 -140 0" fill="blue" fill-opacity="0.4"></path>--%>
          <%--        <path d="M 0 140 C 0 140, 140 0, 140 140" fill="blue" fill-opacity="0.4"></path>--%>
        </svg>
      </div>
    </div>
  </div>
  <footer class="footer">
    <h5>shibeyshi® limited 2024. All rights reserved.</h5>
  </footer>
</div>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="script.js"></script>
</body>
</html>