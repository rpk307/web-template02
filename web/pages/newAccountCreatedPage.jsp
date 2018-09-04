<%@ page import="java.sql.Connection" %><%--
  Created by IntelliJ IDEA.
  User: rkhos
  Date: 05/08/2018
  Time: 16:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="static classes.CreateRandom.randomString" %>
<%@ page import="static classes.DataConnect.addUser" %>
<%@ page import="static classes.sendEmail.sendConfirmation" %>
<%@ page import="classes.MyConnection" %>

<html>
<head>
    <script src="${pageContext.request.contextPath}/scripts/loginAjaxFunctions.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/styles.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src = "${pageContext.request.contextPath}/scripts/loginPageFunctions.js"></script>
    <meta charset="UTF-8">
    <title>accountCreated</title>
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
                <a href="${pageContext.request.contextPath}/pages/newAccountPage.html">Create Account</a>
            </div>
        </div>
    </div>
    <div class = "Page">
        <%
            String url = "jdbc:mysql://localhost:3306/logindatabase";
            String user = "root";
            String pw = "R0h@n5pw";
            MyConnection con = new MyConnection(url, user, pw);
            String random = randomString();
            if(addUser(con, request.getParameter("userName"), request.getParameter("password"), random)){
                out.print("success");
                String link = "http://localhost:8080/pages/loginPages/confirmAccountPage.jsp?a=" + random;
                sendConfirmation(request.getParameter("userName"), link);
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
