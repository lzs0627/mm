/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.arnx.jsonic.JSON;
import java.util.*;
import java.sql.*;
import javax.servlet.http.HttpSession;
/**
 *
 * @author lizhaoshi
 */
@WebServlet(urlPatterns = {"/logincheck"})
public class Logincheck extends HttpServlet {

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
        response.setContentType("application/json;charset=UTF-8");
        
        String ucode = request.getParameter("ucode");
        String pw    = request.getParameter("pw");
        
        String jdbc = "";
        
        try{
            // １．JDBC Driver の登録
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            // ２．データベースへの接続
            Connection con = DriverManager.getConnection(
		    "jdbc:mysql://localhost/mm_db", "root", "123456");
            
            // ３．SQL ステートメント・オブジェクトの作成
            Statement stmt = con.createStatement();
            // ４．SQL ステートメントの発行
            ResultSet rs = stmt.executeQuery("SELECT * from administrators where ucode='"+ucode+"' and upw='"+pw+"'");
            // ５．結果の出力
            
            String name = "";
            Map<String, Object> json = new HashMap<String, Object>();
            
            if (rs.next()) {
                name = rs.getString("uname");
                HttpSession session = request.getSession();
                session.setAttribute("admin",name);
                json.put("status","ok");
            } else {
                json.put("status","error");
            }

            // ６．データベースのクローズ
            rs.close();
            stmt.close();
            con.close();
            
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
