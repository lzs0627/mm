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
import java.sql.PreparedStatement;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import net.arnx.jsonic.JSON;

/**
 *
 * @author lizhaoshi
 */
@WebServlet(urlPatterns = {"/addemploye"})
public class addemploye extends HttpServlet {

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
        
        String ecode = request.getParameter("ecode");
        String ename    = request.getParameter("ename");
        String uid    = request.getParameter("uid");
        String sex    = request.getParameter("sex");
        String ethnic    = request.getParameter("ethnic");
        String birthday    = request.getParameter("birthday");
        String wenhua    = request.getParameter("wenhua");
        String hunyin    = request.getParameter("hunyin");
        String jiguan    = request.getParameter("jiguan");
        String bumen    = request.getParameter("bumen");
        String tell    = request.getParameter("tell");
        String workstart    = request.getParameter("workstart");
        String workleave    = request.getParameter("workleave");
        String zhiwu    = request.getParameter("zhiwu");
        String status    = request.getParameter("status");
        String bankname    = request.getParameter("bankname");
        String bankno    = request.getParameter("bankno");
        String desc    = request.getParameter("desc");
        
        try{
            // １．JDBC Driver の登録
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            // ２．データベースへの接続
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/mm_db?characterEncoding=utf-8", "root", "123456");
            // ３．SQL ステートメント・オブprepareStatementジェクトの作成
            PreparedStatement stmt = con.prepareStatement(
                    "insert into employe"
                            + "(ecode,ename,uid,sex,ethnic,birthday,wenhua,hunyin,jiguan,bumen,tell,workstart,workleave,zhiwu,status,bankname,bankno,description,modified,created) "
                            + "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            // ４．SQL ステートメントの発行
            
            stmt.setString(1, ecode);
            stmt.setString(2, ename);
            stmt.setString(3,uid);
            stmt.setInt(4, Integer.parseInt(sex));
            stmt.setString(5, ethnic);
            stmt.setString(6, birthday);
            stmt.setString(7, wenhua);
            stmt.setString(8, hunyin);
            stmt.setString(9, jiguan);
            stmt.setString(10, bumen);
            stmt.setString(11, tell);
            stmt.setString(12, workstart);
            stmt.setString(13,workleave);
            stmt.setString(14,zhiwu);
            stmt.setString(15, status);
            stmt.setString(16,bankname);
            stmt.setString(17, bankno);
            stmt.setString(18,desc);
            stmt.setString(19,"2014/12/12");
            stmt.setString(20,"2014/12/12");
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
