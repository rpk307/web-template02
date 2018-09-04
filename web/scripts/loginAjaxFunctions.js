// function checkLoginAjax(){
//     var frm = document.forms.namedItem("loginFrm");
//     var request = "";
//     for(var i=0; i < frm.elements.length - 1 ; i++){
//         request += frm.elements[i].name + "=" + frm.elements[i].value + "&";
//     }
//     request = request.substring(0, request.length - 1);
//     alert(request);
//     loadDoc("/pages/formCheck.jsp", request, responseProcess);
//     return false;
// }
//
// function loadDoc(url,content, cFunction) {
//     var xhttp;
//     xhttp=new XMLHttpRequest();
//     xhttp.onreadystatechange = function() {
//         if (this.readyState === 4 && this.status === 200) {
//             // cFunction(this);
//             document.getElementById("username").classList.add("redBorder")
//         }
//     };
//     xhttp.open("GET", url, true);
//     xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
//     xhttp.send(content);
// }
//
// function responseProcess(xhttp){
//     if(xhttp.responseText === "0"){
//         document.getElementById("username").classList.add("redBorder")
//     }
// }

function loadDoc() {
    var xhttp = new XMLHttpRequest();
    var request = "";
    var frm = document.forms[0];
    for(var i=0; i < frm.elements.length; i++){
        request += frm.elements[i].name + "=" + frm.elements[i].value + "&";
    }
    xhttp.onreadystatechange = function() {
        if (this.readyState === 4 && this.status === 200) {
            alert(getCookie("loggedIn"))
        }
    };
    xhttp.open("POST", "formCheck.jsp", true);
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.send(request);
    return false;
}

function getCookie(cname) {
    var name = cname + "=";
    var decodedCookie = decodeURIComponent(document.cookie);
    var ca = decodedCookie.split(';');
    for(var i = 0; i <ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) == ' ') {
            c = c.substring(1);
        }
        if (c.indexOf(name) == 0) {
            return c.substring(name.length, c.length);
        }
    }
    return "";
}

function checkLogin(){
    var name = getCookie("loggedIn");
    if (name!==""){
        document.getElementById("loginDropdown").innerHTML = "<button class=\"dropbtn\">Account\n" +
            "<i class=\"fa fa-caret-down\"></i>\n" +
            "</button>\n" +
            "<div class=\"dropdown-content\" style=\"padding: 5px\">\n" +
            "<a href=\"#\">User HomePage</a>\n" +
            "</div>";
    }
}
