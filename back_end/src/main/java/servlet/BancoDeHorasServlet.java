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
@WebServlet(name = "BancoDeHorasServlet", urlPatterns = {"/BancoDeHorasServlet"})
public class BancoDeHorasServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet BancoDeHorasServlet</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet BancoDeHorasServlet at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }

        

    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    PontoEletronicoDao ptEletronico = new PontoEletronicoDao();  
    int TotalHorasTrabalhadas = 0;
    try {
        TotalHorasTrabalhadas = ptEletronico.getTotalHorasTrabalhadas();
        } catch (ParseException ex) {
            Logger.getLogger(BancoDeHorasServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        response.setContentType("text/plain");  // Set content type of the response so that jQuery knows what it can expect.
        response.setCharacterEncoding("UTF-8"); // You want world domination, huh?
        response.getWriter().write(" "+TotalHorasTrabalhadas+" Horas Trabalhadas!");       // Write response body.
    } 
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
