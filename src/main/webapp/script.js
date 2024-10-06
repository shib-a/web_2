var x_val;
var y_val;
var r_val;
var svg = document.getElementById("svg");
function drawPoints(){}
function toPlane(x, y, r){
    let planeX = (x-300)/(300/r);
    let planeY = (y-300)/(300/r);
    console.log(planeX, planeY);
    return {x: planeX, y: planeY}
}
$(svg).click(function ( evt){
    let pt = svg.createSVGPoint();
    pt.x = evt.clientX;
    pt.y = evt.clientY;

    if(document.querySelector('input[name="radius"]:checked').value){
        r_val = document.querySelector('input[name="radius"]:checked').value;
        let cursorpt = pt.matrixTransform(svg.getScreenCTM());
        console.log("raw:", cursorpt.x, cursorpt.y, r_val)
        let tcords = toPlane(cursorpt.x, cursorpt.y, r_val);
        let data = {"x_data":tcords.x, "y_data": tcords.y, "r_data": r_val};
        console.log(tcords.x, tcords.y);
        //
        // var form = new FormData();
        // form.append("x_data", tcords.x);
        // form.append("y_data", tcords.y);
        // form.append("r_data", r_val);

        $.ajax({
            url:"controller?" + $.param(data),
            type: "GET",
            dataType: "html",
            // success: function (response) {
            //     if (response.result) {
            //         console.log('yes');
            //     } else {
            //         console.log('no');
            //     }
            // },
            error:function(xhr, status, error){alert(error)}
        });
    }


})
var isValidInput = 0;
jQuery('button.ch_x').click(function(){
    jQuery('button.chosen').addClass('ch_x').removeClass('chosen');
    jQuery(this).removeClass('ch_x');
    jQuery(this).addClass('chosen')
    x_val = this.textContent;
    jQuery('button.chosen').css('background','green');
    jQuery('button.ch_x').css('background','grey');
})
document.getElementById("r_choice").addEventListener("input", function (){
    r_val = document.getElementById("r_choice").value;
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
    if(isValidInput) {
        jQuery.ajax({
            url: "controller?"+ $.param(coord_data),
            type: "GET",
            dataType: "json",
            //data: coord_data,
            success: function (response) {
                // var new_row = table.insertRow();
                // var xCell = new_row.insertCell(0);
                // var yCell = new_row.insertCell(1);
                // var rCell = new_row.insertCell(2);
                // var hitCell = new_row.insertCell(3);
                // var timeCell = new_row.insertCell(4);
                // var respTimeCell = new_row.insertCell(5);
                if (response.result) {
                    // xCell.innerHTML = x_val;
                    // yCell.innerHTML = y_val;
                    // rCell.innerHTML = r_val;
                    // hitCell.innerHTML = 'yes';
                    // timeCell.innerHTML= time;
                    // respTimeCell.innerHTML = response.respTime;
                    console.log('yes');
                } else {
                    xCell.innerHTML = x_val;
                    yCell.innerHTML = y_val;
                    rCell.innerHTML = r_val;
                    hitCell.innerHTML = 'no';
                    timeCell.innerHTML= time;
                    respTimeCell.innerHTML = response.respTime;
                    console.log('no');
                }
            },
            error:function(xhr, status, error){alert(error)}
        });
    }
});