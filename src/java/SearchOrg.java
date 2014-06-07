/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.arnx.jsonic.JSON;

/**
 *
 * @author 毛畅
 */
public class SearchOrg extends HttpServlet {

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
            
            String ecode = request.getParameter("dcode");
            
            try{
                // １．JDBC Driver の登録
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                // ２．データベースへの接続
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost/mm_db?characterEncoding=utf-8", "root", "123456");
                // ３．SQL ステートメント・オブジェクトの作成
                Statement stmt = con.createStatement();
                // ４．SQL ステートメントの発行
                ResultSet rs;
                if(ecode == null || ecode == ""){
                    rs = stmt.executeQuery("select * from departments");
                }else{
                    rs = stmt.executeQuery("select * from departments where dcode='"+ecode+"'");
                }
                
                
                // ５．結果の出力
                
                Map<String, Object> json = new HashMap<String, Object>();
                
                String rebody = "";
                int count = 0;
                while(rs.next()){
                    rebody +="<tr>";
                    rebody +="<td><a href=\"#\" data-role=\"loader\" data-target=\"orginfo.html?dc="+rs.getString("dcode")+"\"><i class=\"glyphicon glyphicon-share-alt\" />&nbsp;&nbsp;  "+rs.getString("dcode")+"</a></td>";
                    rebody +="<td>"+rs.getString("dname")+"</td>";
                    rebody +="</tr>";
                    count ++;
                }
                json.put("status","ok");
                json.put("data",rebody);
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
