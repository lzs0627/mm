/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
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
@WebServlet(urlPatterns = {"/UpdateWage"})
public class UpdateWage extends HttpServlet {

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
        WageController wage = new WageController();
        
        String sr = "";
        if (method.equals("add")) {
            wage.readyToCreate();
            wage.setForm(request);
            
            sr = wage.save();
            
        } else if (method.equals("edit")) {
            wage.setForm(request);
            
            sr = wage.update();
        } else if(method.equals("delete")){
            wage.setForm(request);
            
            sr = wage.delete();
        }else {
            sr = "unknow method : "+method;
        }
         
        if (sr.equals("ok")) {
            json.put("status","ok");
        }else{
            json.put("status","error");
            json.put("msg", sr);
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
