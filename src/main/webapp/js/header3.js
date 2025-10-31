var wintimeout;
function SetWinTimeout() {
    var time = document.getElementById("timeout").value;
    wintimeout = window.setTimeout("window.location.href='ServletControllerLogout';", time); //after 5 mins i.e. 5 * 60 * 1000
}
$('body').mouseover(function () {

    window.clearTimeout(wintimeout); //when user mouseover remove timeout and reset it

    SetWinTimeout();

});
SetWinTimeout();