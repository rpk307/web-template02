package classes;

import java.sql.Connection;
import java.sql.SQLException;

import static classes.DataConnect.getConnection;

public class MyConnection {
    private final String url;
    private final String user;
    private final String password;
    private Connection con;

    public MyConnection(String url, String user, String password){
        this.url = url;
        this.user = user;
        this.password = password;
    }

    public boolean open(){
        try {
            con = getConnection(url, user, password);
            return true;
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean close(){
        try {
            con.close();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public Connection getCon(){
        return con;
    }
}
