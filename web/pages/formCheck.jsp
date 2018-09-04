<%@ page import="classes.MyConnection" %>
<%@ page import="static classes.DataConnect.validateLogin" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String url = "jdbc:mysql://localhost:3306/logindatabase";
    String user = "root";
    String pw = "R0h@n5pw";
    MyConnection con = new MyConnection(url, user, pw);
    response.setCharacterEncoding("UTF-8");
    String username = request.getParameter("username");
    System.out.println(username);
    String password = request.getParameter("password");
    System.out.println(password);
    Cookie cookie = new Cookie("loggedIn", username);
    response.addCookie(cookie);

    if(validateLogin(con, username, password) == 1){
        response.getWriter().write("1");
    }else{
        response.getWriter().write("0");
    }
//    response.setContentType("application/x-www-form-urlencoded");
//    response.setCharacterEncoding("UTF-8");
//    String name = request.getParameter("username");
//    System.out.println(name);
//    String password = request.getParameter("password");
//    System.out.println(password);
%>

