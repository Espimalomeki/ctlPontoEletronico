/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.BancoDeHorasDao;
import dao.PontoEletronicoDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.BancoDeHorasModel;
import model.PontoEletronicoModel;

/**
 *
 * @author filip
 */
@WebServlet(name = "HorasExtrasServlet", urlPatterns = {"/HorasExtrasServlet"})
public class HorasExtrasServlet extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PontoEletronicoDao ptEletronico = new PontoEletronicoDao();        
        String getHorasExtras= "";
        
        try {
            getHorasExtras =  ptEletronico.getStatusDeHoras();
            response.setContentType("text/plain");  // Set content type of the response so that jQuery knows what it can expect.
            response.setCharacterEncoding("UTF-8"); // You want world domination, huh?
            response.getWriter().write(getHorasExtras);
        } catch (ParseException ex) {
            Logger.getLogger(HorasExtrasServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
            
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
