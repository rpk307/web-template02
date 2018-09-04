function checkFunc(){
    var namePatt = "^(?![0-9])[\\w]+$";
    var emailPatt = "^(?![@])[\\S]+@(?![@])[\\S]+$";
    var ret = true;
    if(document.getElementById("firstName").value.search(namePatt) === -1){
        document.getElementById("firstName").classList.add("redBorder");
        ret = false;
    }else{
        document.getElementById("firstName").classList.remove("redBorder");
    }
    if(document.getElementById("lastName").value.search(namePatt) === -1){
        document.getElementById("lastName").classList.add("redBorder");
        ret = false;
    }else{
        document.getElementById("lastName").classList.remove("redBorder");
    }
    if(document.getElementById("email").value.search(emailPatt) === -1){
        document.getElementById("email").classList.add("redBorder");
        ret = false;
    }else{
        document.getElementById("email").classList.remove("redBorder");
    }
    //Adding password involves database access stuff.  See dynamic version.
    return ret;
}