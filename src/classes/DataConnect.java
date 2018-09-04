package classes;

import java.security.NoSuchAlgorithmException;
import java.sql.*;

public class DataConnect {

    public static void main(String args[]){
        String url = "jdbc:mysql://localhost:3306/logindatabase";
        String user = "root";
        String pw = "R0h@n5pw";
        MyConnection con = new MyConnection(url, user, pw);
        if(addUser(con, "r.khosla307@gmail.com", "r0h19@n98", "12345678910111213")){
            System.out.print("success");
        }else{
            System.out.print("failure");
        }
    }

    public static Boolean addUser(MyConnection con, String email, String password, String random) {
        try {
            con.open();
            String hashedPassword = ShaEncrypt.hash256(password);
            Statement s = con.getCon().createStatement();
            String insert = "INSERT INTO users (email, password, randomString, validated) " +
                    "VALUES ('" + email + "', '" + hashedPassword + "', '" + random + "', 0);";
            s.execute(insert);
            con.close();
            return true;
        } catch (SQLException | NoSuchAlgorithmException e) {
            e.printStackTrace();
            con.close();
            return false;
        }
    }

    public static Boolean validateUser(MyConnection con, String random){
        try {
            con.open();
            Statement s = con.getCon().createStatement();
            String update = "UPDATE users SET validated = 1 WHERE randomString = '" + random + "';";
            s.executeUpdate(update);
            con.close();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public static int validateLogin(MyConnection con, String user, String pw){
        try{
            con.open();
            Statement s = con.getCon().createStatement();
            String encryptedPassword = ShaEncrypt.hash256(pw);
            String select = "SELECT idusers FROM users WHERE email = '" + user + "'AND password = '"
                    + encryptedPassword + "';";
            ResultSet result = s.executeQuery(select);
            if(result.next()){
                return 1;
            }else{
                return 0;
            }
        } catch (SQLException | NoSuchAlgorithmException e) {
            e.printStackTrace();
            return -1;
        }
    }


    public static Connection getConnection(String url, String user, String password) throws ClassNotFoundException, SQLException {
        Connection con = null;
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection(url, user, password);
        return con;
    }
}