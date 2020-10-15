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
import java.util.stream.Collectors;
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

    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    PontoEletronicoDao ptEletronico = new PontoEletronicoDao();  
    String TotalHorasTrabalhadas = "";
    try {
        TotalHorasTrabalhadas = ptEletronico.getTotalHorasTrabalhadas(0);
        } catch (ParseException ex) {
            Logger.getLogger(BancoDeHorasServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        response.setContentType("text/plain");  // Set content type of the response so that jQuery knows what it can expect.
        response.setCharacterEncoding("UTF-8"); // You want world domination, huh?
        response.getWriter().write(" "+TotalHorasTrabalhadas+" Horas Trabalhadas!");       // Write response body.
    } 
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int str = Integer.parseInt(request.getReader().lines().collect(Collectors.joining(System.lineSeparator())));
        PontoEletronicoDao ptEletronico = new PontoEletronicoDao();  
        String TotalHorasTrabalhadas = "";
        try {
            TotalHorasTrabalhadas = ptEletronico.getTotalHorasTrabalhadas(str);
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
