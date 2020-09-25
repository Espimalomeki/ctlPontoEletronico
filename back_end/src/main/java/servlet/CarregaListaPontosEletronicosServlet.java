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
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.PontoEletronicoModel;

/**
 *
 * @author filip
 */
@WebServlet(name = "CarregaListaPontosEletronicosServlet", urlPatterns = {"/CarregaListaPontosEletronicosServlet"})
public class CarregaListaPontosEletronicosServlet extends HttpServlet {

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
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet CarregaListaPontosEletronicosServlet</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet CarregaListaPontosEletronicosServlet at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PontoEletronicoDao ptEletronico = new PontoEletronicoDao();
        int TotalHorasTrabalhadas = 0;
        //PontoEletronicoDao ptEletronico = new PontoEletronicoDao();
        ArrayList <PontoEletronicoModel> listaArray = ptEletronico.listaPontos();
        int tmListaPt = listaArray.size();
        String listaTr = "";
        for (int i = 0; i < tmListaPt; i++) {
            listaTr += "<tr>"
                    + "<td>"+listaArray.get(i).getNumMatricula()+" </td>"
                    + "<td>"+listaArray.get(i).getHoraEntrada()+"</td>"
                    + "<td>"+listaArray.get(i).getHoraInicioIntervalo()+"</td>"
                    + "<td>"+listaArray.get(i).getHoraFimIntervalo()+"</td> "
                    + "<td>"+listaArray.get(i).getHoraSaida()+"</td>"
                    + "<td>"+listaArray.get(i).getHomeOffice()+"</td>"
                    + "<td>"+listaArray.get(i).getMotivoAjuste()+"</td>"
                    + "</tr>";
            
        }
        response.setContentType("text/plain");  // Set content type of the response so that jQuery knows what it can expect.
        response.setCharacterEncoding("UTF-8"); // You want world domination, huh?
        response.getWriter().write(listaTr);
    }

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
