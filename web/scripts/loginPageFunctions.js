function checkFunc(){
    var emailPatt = "^(?![@])[\\S]+@(?![@])[\\S]+$";
    var ret = true;
    if(document.getElementById("userName").value.search(emailPatt) === -1){
        document.getElementById("userName").classList.add("redBorder");
        ret = false;
    }else{
        document.getElementById("email").classList.remove("redBorder");
    }
    //Adding password involves database access stuff.  See dynamic version.
    return ret;
}