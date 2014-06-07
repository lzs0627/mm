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
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.arnx.jsonic.JSON;
/**
 *
 * @author 毛畅
 */
@WebServlet(urlPatterns = {"/UpdateHistory"})
public class UpdateHistory extends HttpServlet {

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
        String employe_id = request.getParameter("employe_id");
        String id = request.getParameter("id");
        String zhiwu = request.getParameter("zhiwu");
        String nworkplace = request.getParameter("nworkplace");
        String oworkplace = request.getParameter("oworkplace");
        String changeat = request.getParameter("changeat");
        String yuanyin = request.getParameter("yuanyin");
        
        try{
            // １．JDBC Driver の登録
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            // ２．データベースへの接続
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/mm_db?characterEncoding=utf-8", "root", "123456");
            // ３．SQL ステートメント・オブprepareStatementジェクトの作成
            if (method.equals("add")) {
                PreparedStatement stmt = con.prepareStatement(
                        "insert into histories "
                                + "(employe_id,zhiwu,nworkplace,oworkplace,changeat,diaodongyuanyin) "
                                + "values(?,?,?,?,?,?)");
                stmt.setInt(1, Integer.parseInt(employe_id));
                stmt.setString(2, zhiwu);
                stmt.setString(3,nworkplace);
                stmt.setString(4,oworkplace);
                stmt.setString(5,changeat);
                stmt.setString(6,yuanyin);
                stmt.execute();
                json.put("status","ok");
                json.put("yuanyin", yuanyin);
            } else if (method.equals("edit")) {
                PreparedStatement stmt = con.prepareStatement(
                    "update histories set "
                            + "zhiwu=?,"
                            + "nworkplace=?,"
                            + "oworkplace=?,"
                            + "changeat=?,"
                            + "diaodongyuanyin=?"
                            + "where id=?");
                stmt.setString(1, zhiwu);
                stmt.setString(2, nworkplace);
                stmt.setString(3, oworkplace);
                stmt.setString(4,changeat);
                stmt.setString(5, yuanyin);
                stmt.setInt(6, Integer.parseInt(id));
                stmt.execute();
                json.put("status","ok");
                json.put("yuanyin", yuanyin);
            } else if(method.equals("delete")){
                PreparedStatement stmt = con.prepareStatement(
                "delete from histories where id=?");
                
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
