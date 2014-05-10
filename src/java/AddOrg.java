/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.arnx.jsonic.JSON;

/**
 *
 * @author lizhaoshi
 */
public class AddOrg extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            String ecode = request.getParameter("dcode");
            String ename    = request.getParameter("dname");
            String desc    = request.getParameter("desc");
            
            try{
                // １．JDBC Driver の登録
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                // ２．データベースへの接続
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost/mm_db?characterEncoding=utf-8", "root", "123456");
                // ３．SQL ステートメント・オブprepareStatementジェクトの作成
                PreparedStatement stmt = con.prepareStatement(
                        "insert into departments"
                                + "(dcode,dname,description,modified,created) "
                                + "values(?,?,?,?,?)");
                // ４．SQL ステートメントの発行
            
            stmt.setString(1, ecode);
            stmt.setString(2, ename);
            stmt.setString(3,desc);
            stmt.setString(4,"2014/12/12");
            stmt.setString(5,"2014/12/12");
            stmt.execute();
            
            Map<String, Object> json = new HashMap<String, Object>();
            json.put("status","ok");
            
            response.getOutputStream().write(JSON.encode(json).getBytes("UTF-8"));
            
        } catch (Exception e2) {
			System.out.println(
				"Exception: " + e2.getMessage());
		}
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
