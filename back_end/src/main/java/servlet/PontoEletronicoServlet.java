/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.PontoEletronicoDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author filip
 */
@WebServlet(name = "PontoEletronicoServlet", urlPatterns = {"/PontoEletronicoServlet"})
public class PontoEletronicoServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//        PrintWriter out = response.getWriter();
//        boolean homeOffice = Boolean.parseBoolean(request.getParameter("homeOffice"));
//        try {
//            PontoEletronicoDao ptEletronico = new PontoEletronicoDao();
//
//            ptEletronico.inserePonto(homeOffice);
//
//            response.sendRedirect(request.getContextPath() + "/pontoEletronico.jsp");
//
//        } finally {
//            out.close();
//        };
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        PrintWriter out = response.getWriter();
        boolean homeOffice = Boolean.parseBoolean(request.getParameter("homeOffice"));
            PontoEletronicoDao ptEletronico = new PontoEletronicoDao();

            ptEletronico.inserePonto(homeOffice);
            response.setContentType("text/html;charset=UTF-8");
            //response.setContentType("text/plain");  // Set content type of the response so that jQuery knows what it can expect.
            //response.setCharacterEncoding("UTF-8"); // You want world domination, huh?
            response.getWriter().write(" Ponto Registrado!");

        
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
