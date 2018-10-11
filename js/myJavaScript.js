//dropdown menu open-close -JQUERY

$(document).ready(function(){

//===========================================================================

var timer;
function hideAll(){
    var dropdown = document.getElementsByClassName("dropdown-content");
    for(i=0; i<dropdown.length; i++){
        dropdown[i].style.display = "none";
    }
}
    
$("#bed").mouseenter(function(){
    clearTimeout(timer);
    timer = setTimeout(function () {
        hideAll();
        $("#cont-1").show();
    }, 500);
});


$("#pil").mouseenter(function(){
    clearTimeout(timer);
    timer = setTimeout(function () {
        hideAll();
        $("#cont-2").show();
    }, 500);
});


$("#bath").mouseenter(function(){
    clearTimeout(timer);
    timer = setTimeout(function () {
        hideAll();
        $("#cont-3").show();
    }, 500);
});

$("#bed, #pil, #bath, .dropdown-content").mouseleave(function(){
    clearTimeout(timer);
    timer = setTimeout(function () {
        hideAll();
    }, 500);
});

$(".dropdown-content").mouseenter(function(){
    clearTimeout(timer);
});

});


// slideshow automatski
var index = 0;
var slide = document.getElementsByClassName("slider-main");
function mySlide(){
    t = setInterval( function(){
        if (index > slide.length-1){
            index = 0;
        }
        for (i=0; i<slide.length; i++){
            slide[i].style.display = "none";
        }
            slide[index].style.display = "block";
            index++;
            
    }, 4000);
}
mySlide();
    
//footer ***radi***

var TfooterShow;

$("footer").mouseenter(function(){
    TfooterShow = setTimeout(function () {
        $("#hidden-footer").slideDown();
    }, 800);
});
$("footer").mouseleave(function(){
        clearTimeout(TfooterShow);
        $("#hidden-footer").slideUp();
});






