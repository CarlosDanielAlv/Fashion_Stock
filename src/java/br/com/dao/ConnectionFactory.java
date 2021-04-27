package br.com.dao;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 * @author Carlo
 */
public class ConnectionFactory {
    
    private String url = "jdbc:mysql://127.0.0.1:3306/dbestoque";
    private String user = "root";
    private String password = "root";
    
    public Connection getConnection(){
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(url,user,password);
            
        } catch (Exception err) {
            throw new RuntimeException("Erro no ConnectionFactory: "+err);
        }
    }
}
