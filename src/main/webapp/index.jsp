<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link rel="stylesheet" href="style.css">
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
    <div>

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
  <svg xmlns="http://www.w3.org/2000/svg" id="svg">
    <line x1="0" y1="150" x2="300" y2="150" stroke="#000720"></line>
    <line x1="150" y1="0" x2="150" y2="300" stroke="#000720"></line>
    <line x1="270" y1="148" x2="270" y2="152" stroke="#000720"></line>
    <text x="265" y="140">R</text>
    <line x1="210" y1="148" x2="210" y2="152" stroke="#000720"></line>
    <text x="200" y="140">R/2</text>
    <line x1="90" y1="148" x2="90" y2="152" stroke="#000720"></line>
    <text x="75" y="140">-R/2</text>
    <line x1="30" y1="148" x2="30" y2="152" stroke="#000720"></line>
    <text x="20" y="140">-R</text>
    <line x1="148" y1="30" x2="152" y2="30" stroke="#000720"></line>
    <text x="156" y="35">R</text>
    <line x1="148" y1="90" x2="152" y2="90" stroke="#000720"></line>
    <text x="156" y="95">R/2</text>
    <line x1="148" y1="210" x2="152" y2="210" stroke="#000720"></line>
    <text x="156" y="215">-R/2</text>
    <line x1="148" y1="270" x2="152" y2="270" stroke="#000720"></line>
    <text x="156" y="275">-R</text>

    <polygon points="300,150 295,155 295, 145" fill="#000720" stroke="#000720"></polygon>
    <polygon points="150,0 145,5 155,5" fill="#000720" stroke="#000720"></polygon>

    <rect x="150" y="150" width="120" height="120" fill-opacity="0.4" stroke="navy" fill="blue"></rect>

    <polygon points="150,150 90,150 150,90" fill-opacity="0.4" stroke="navy" fill="blue"></polygon>

    <path d="M150 150 L 270 150 C 270 80 220 30 150 30 L Z" fill-opacity="0.4" stroke="navy" fill="blue"></path>
  </svg>
  <footer class="footer">
    <h5>shibeyshi® limited 2024. All rights reserved.</h5>
  </footer>
</div>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="script.js"></script>
</body>
</html>