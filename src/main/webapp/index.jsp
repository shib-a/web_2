<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link rel="stylesheet" href="/style.css">
  <title>Title</title>
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
    <div class="q_entry" id = 'r_choice'>
      <div>
        <label>Изменение R</label>
      </div>
      <input type="radio", name="radius", value="1", class="r_change">R=1<br>
      <input type="radio", name="radius", value="2", class="r_change">R=2<br>
      <input type="radio", name="radius", value="3", class="r_change">R=3<br>
      <input type="radio", name="radius", value="4", class="r_change">R=4<br>
      <input type="radio", name="radius", value="5", class="r_change">R=5<br>
    </div>
    <input type="button" id = "submit_button" value = "Submit">
  </form>
  <div id = "ti_div">
    <div id = "table_div">
      <table id = "table">
        <thead>
        <tr>
          <th class="x_th">Coord. x</th>
          <th>Coord. y</th>
          <th>R value</th>
          <th id ="hit_th">Hit</th>
          <th>Time</th>
          <th>Responded in (ns)</th>
        </tr>
        </thead>
        <tbody id = "table_body">
        </tbody>
      </table>
      <img src="img.png" id="image">
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