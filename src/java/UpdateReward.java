/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.arnx.jsonic.JSON;

/**
 *
 * @author 毛畅
 */
@WebServlet(urlPatterns = {"/UpdateReward"})
public class UpdateReward extends HttpServlet {

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
        request.setCharacterEncoding("utf-8");
        
        Map<String, Object> json = new HashMap<String, Object>();
        
        String method = request.getParameter("method");
        String employe_id = request.getParameter("eid");
        String id = request.getParameter("id");
        String type = request.getParameter("type");
        String enterat = request.getParameter("enterat");
        String yuanyin = request.getParameter("yuanyin");
        String other = request.getParameter("other");
        
        try{
            // １．JDBC Driver の登録
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            // ２．データベースへの接続
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/mm_db?characterEncoding=utf-8", "root", "123456");
            // ３．SQL ステートメント・オブprepareStatementジェクトの作成
            if (method.equals("add")) {
                PreparedStatement stmt = con.prepareStatement(
                        "insert into rewards "
                                + "(employe_id,rtype,enterat,yuanyin,beizhu) "
                                + "values(?,?,?,?,?)");
                stmt.setInt(1, Integer.parseInt(employe_id));
                stmt.setString(2, type);
                stmt.setString(3,enterat);
                stmt.setString(4,yuanyin);
                stmt.setString(5,other);
                stmt.execute();
                json.put("status","ok");
            } else if (method.equals("edit")) {
                PreparedStatement stmt = con.prepareStatement(
                    "update rewards set "
                            + "rtype=?,"
                            + "enterat=?,"
                            + "yuanyin=?,"
                            + "beizhu=?"
                            + "where id=?");
                stmt.setString(1, type);
                stmt.setString(2, enterat);
                stmt.setString(3, yuanyin);
                stmt.setString(4,other);
                stmt.setInt(5, Integer.parseInt(id));
                stmt.execute();
                json.put("status","ok");
            } else if(method.equals("delete")){
                PreparedStatement stmt = con.prepareStatement(
                "delete from rewards where id=?");
                
                stmt.setInt(1, Integer.parseInt(id));
                stmt.execute();
                json.put("status","ok");
            } else {
                json.put("status","error");
                json.put("msg", "unknow method : "+method);
            }
            
        }catch (Exception e2) {
            json.put("status","error");
            json.put("msg", e2.getMessage());
		}
        
        response.getOutputStream().write(JSON.encode(json).getBytes("UTF-8"));
        
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
