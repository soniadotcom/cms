$(document).ready(function(){
    $('#selectAllBoxes').click(function(event) {
        if(this.checked) {
            $('.checkBoxes').each(function() {
                this.checked = true;
            });
        } else {
            $('.checkBoxes').each(function() {
                this.checked = false;
            });
        }
    });


    //Loading Screen
    var div_box = "<div id='load-screen'><div class='spinner'><div class='double-bounce1'></div><div class='double-bounce2'></div></div></div>";
    $("body").prepend(div_box);

    $('#load-screen').delay(700).fadeOut(600, function() {
        $(this).remove();
    });
});


function loadUsersOnline() {
    $.get("functions.php?onlineusers=result", function(data){
        $(".usersonline").text(data);
    });
}

setInterval(function(){
    loadUsersOnline();
}, 500);
