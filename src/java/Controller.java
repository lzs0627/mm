/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author 毛畅
 */

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.http.HttpServletRequest;

public class Controller {
    
    protected Connection conn;
    protected String commandType;
    protected HttpServletRequest request;
    Controller()
    {
        conn = null;
        commandType = "";
        request = null;
        
        try{
            // １．JDBC Driver の登録
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            // ２．データベースへの接続
            conn = DriverManager.getConnection("jdbc:mysql://localhost/mm_db?characterEncoding=utf-8", "root", "123456");
        }catch (Exception e2) {
            
		}
        
    }
    
    public void readyToCreate()
    {
        this.setCommandType("create");
    }
    
    private void setCommandType(String type)
    {
        this.commandType = type;
    }
    
    public void setForm(HttpServletRequest request){
        this.request = request;
    }
    
    
}
