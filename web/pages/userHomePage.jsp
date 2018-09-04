<%@ page import="classes.MyConnection" %>
<%@ page import="static classes.DataConnect.validateLogin" %>
<%--
  Created by IntelliJ IDEA.
  User: rkhos
  Date: 07/08/2018
  Time: 17:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="${pageContext.request.contextPath}/scripts/loginAjaxFunctions.js"></script>
    <title>userHomePage</title>
</head>
<body onload="checkLogin()">
<div class="wholePage">
    <div class="navbar">
        <a href="${pageContext.request.contextPath}/pages/homePage.html">Home</a>
        <a href="${pageContext.request.contextPath}/pages/infoPage.html">Info</a>
        <div class="dropdown">
            <button class="dropbtn">Dropdown
                <i class="fa fa-caret-down"></i>
            </button>
            <div class="dropdown-content">
                <a href="#">Link 1</a>
                <a href="#">Link 2</a>
                <a href="#">Link 3</a>
            </div>
        </div>
        <a href="${pageContext.request.contextPath}/pages/formPage.html">Form</a>
        <div class="dropdown" style="float: right; width:171px;" id ="loginDropdown">
            <button class="dropbtn">Login
                <i class="fa fa-caret-down"></i>
            </button>
            <div class="dropdown-content" style="padding: 5px">
                <Form onsubmit="return loadDoc()" name ="loginFrm" id="loginFrm">
                    Username:<br>
                    <input type="text" placeholder="Enter Username" name="username" id="username"><br>
                    Password:<br>
                    <input type="password" placeholder="Enter Password" name="password" id="password"><br>
                    <input type = submit><br>
                </Form>
                <a href="/pages/newAccountPage.html">Create Account</a>
            </div>
        </div>
    </div>
    <div class = "page">
        <%
            String url = "jdbc:mysql://localhost:3306/logindatabase";
            String user = "root";
            String pw = "R0h@n5pw";
            MyConnection con = new MyConnection(url, user, pw);

            String username = request.getParameter("userName");
            String password = request.getParameter("password");
            if(validateLogin(con, username, password) == 1){
                out.print("welcome");
                Cookie userCookie = new Cookie("Username", username);
                response.addCookie(userCookie);
            }else if (validateLogin(con, username, password) == 0){
                out.print("not a user");
            }else{
                out.print("failure");
            }
        %>
    </div>
</div>
<footer class="author">
    <div>
        Html template - Author Rohan Khosla
    </div>
</footer>
</body>
</html>
