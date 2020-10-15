/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.FuncionarioEmProjetoDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.stream.Collectors;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author filip
 */
@WebServlet(name = "IncluirFuncEmProjetoServlet", urlPatterns = {"/IncluirFuncEmProjetoServlet"})
public class IncluirFuncEmProjetoServlet extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet IncluirFuncEmProjetoServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet IncluirFuncEmProjetoServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String jsonString = request.getReader().lines().collect(Collectors.joining(System.lineSeparator()));
        
        JSONObject obj = new JSONObject(jsonString);
        
        //String codProj = obj.getJSONObject("pageInfo").getString("pageName");
        //String codProj = obj.getString("projeto");
        //JSONArray arr = obj.getJSONArray("rgm");
        
        FuncionarioEmProjetoDao funcProj = new FuncionarioEmProjetoDao();
        try {
            funcProj.incluiFuncEmProj(obj);
            
            
            
//        for (int i = 0; i < arr.length(); i++){;
//            String post_id = arr.getJSONObject(i).getString("post_id");
//        }
        } catch (SQLException ex) {
            Logger.getLogger(IncluirFuncEmProjetoServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
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
