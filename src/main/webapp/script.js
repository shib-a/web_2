var x_val;
var y_val;
var r_val;
var svg = document.getElementById("svg");
function toPlane(x, y, r){
    // let planeX = (x-150)/(300/r);          let planeX = (svgX - 150) / (120 / r);
    //                                        let planeY = (150 - svgY) / (120 / r);
    // let planeY = (y-150)/(300/r);
    let planeX = (x)/(140/r);
    let planeY = (y-150)/(140/r);
    console.log(planeX, planeY);
    return {x: planeX.toFixed(5), y: planeY.toFixed(5)}
}
function drawPoint(x, y){
    let point = document.createElementNS('http://www.w3.org/2000/svg', 'circle')
    point.setAttribute('cx', x);
    point.setAttribute('cy', y);
    point.setAttribute('r', 3);
    point.setAttribute('fill', 'red')
    svg.appendChild(point)
}
$(svg).click(async function (evt) {
    let pt = svg.createSVGPoint();
    pt.x = evt.clientX;
    pt.y = evt.clientY;

    if (r_val) {
        //r_val = document.querySelector('input[name="radius"]:checked').value;
        let cursorpt = pt.matrixTransform(svg.getScreenCTM().inverse());
        console.log("raw:", cursorpt.x, cursorpt.y, r_val)
        drawPoint(cursorpt.x, cursorpt.y)
        let tcords = toPlane(cursorpt.x, cursorpt.y, r_val);
        let data = {"x_data": tcords.x, "y_data": tcords.y, "r_data": r_val};
        console.log(data.x_data, data.y_data);
        var url = "controller?" + new URLSearchParams(data).toString();
        var response = await fetch(url, {method: "get", redirect: "manual"});
        var new_row = table.insertRow();
        var xCell = new_row.insertCell(0);
        var yCell = new_row.insertCell(1);
        var rCell = new_row.insertCell(2);
        var hitCell = new_row.insertCell(3);
        window.location.href=response.url;
        // $.get(response.url, function (){
        //     const table = $('#table_body_res');
        //     $('#table_body').remove();
        //     $('#table').append(table);
        // });
        // let fd = $('<form>', {action:"controller", method: "get", x_data: tcords.x, y_data: tcords.y, r_data: tcords.r})
        // fd.append("x_data", tcords.x);
        // fd.append("y_data", tcords.y);
        // fd.append("r_data", tcords.r);
        // fd.appendTo('body').submit()
    }


})
var isValidInput = 0;
jQuery('button.ch_x').click(function(){
    jQuery('button.chosen').addClass('ch_x').removeClass('chosen');
    jQuery(this).removeClass('ch_x');
    jQuery(this).addClass('chosen')
    x_val = this.textContent;
    jQuery('button.chosen').css('background','green');
    jQuery('button.ch_x').css('background','-moz-buttondefault');
})
jQuery('button.r_change').click(function(){
    jQuery('button.r_chosen').addClass('r_change').removeClass('r_chosen');
    jQuery(this).removeClass('r_change');
    jQuery(this).addClass('r_chosen')
    r_val = this.textContent;
    jQuery('button.r_chosen').css('background','green');
    jQuery('button.r_change').css('background','-moz-buttondefault');
})

var ch_y_field = document.getElementById("data_ch_y");
ch_y_field.addEventListener("input",function (){
    y_val = String (ch_y_field.value);
    try{
        if(y_val.length===0){
            ch_y_field.style.backgroundColor = "white";
            isValidInput=0;
            return;
        }
        y_val = parseInt(y_val);
        if(isNaN(y_val)){
            ch_y_field.style.backgroundColor = "red";
            isValidInput=0;
        }
        else if((y_val<-5 || y_val >5)){
            ch_y_field.style.backgroundColor = "red";
            isValidInput=0;
        }
        else{
            ch_y_field.style.backgroundColor = "white";
            isValidInput=1;
        }
    } catch (e){
        ch_y_field.style.backgroundColor = "red";
        isValidInput=0;
    }
})

$('#submit_button').on('click',  function(e){
    var table = document.getElementById("table");
    r_val = document.querySelector('input[name="radius"]:checked').value;
    console.log(x_val, y_val, r_val);
    var time = new Date().toLocaleTimeString();
    var coord_data = {"x_data":x_val, "y_data":y_val, "r_data":r_val}
    // if(isValidInput) {
    //     jQuery.ajax({
    //         url: "controller?"+ $.param(coord_data),
    //         type: "GET",
    //         dataType: "json",
    //         //data: coord_data,
    //         success: function (response) {
    //             // var new_row = table.insertRow();
    //             // var xCell = new_row.insertCell(0);
    //             // var yCell = new_row.insertCell(1);
    //             // var rCell = new_row.insertCell(2);
    //             // var hitCell = new_row.insertCell(3);
    //             // var timeCell = new_row.insertCell(4);
    //             // var respTimeCell = new_row.insertCell(5);
    //             if (response.result) {
    //                 // xCell.innerHTML = x_val;
    //                 // yCell.innerHTML = y_val;
    //                 // rCell.innerHTML = r_val;
    //                 // hitCell.innerHTML = 'yes';
    //                 // timeCell.innerHTML= time;
    //                 // respTimeCell.innerHTML = response.respTime;
    //                 console.log('yes');
    //             } else {
    //                 xCell.innerHTML = x_val;
    //                 yCell.innerHTML = y_val;
    //                 rCell.innerHTML = r_val;
    //                 hitCell.innerHTML = 'no';
    //                 timeCell.innerHTML= time;
    //                 respTimeCell.innerHTML = response.respTime;
    //                 console.log('no');
    //             }
    //         },
    //         error:function(xhr, status, error){alert(error)}
    //     });
    // }
});