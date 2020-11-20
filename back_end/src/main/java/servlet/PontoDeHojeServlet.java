/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.PontoEletronicoDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;
import model.PontoEletronicoModel;

/**
 *
 * @author filip
 */
@WebServlet(name = "PontoDeHojeServlet", urlPatterns = {"/PontoDeHojeServlet"})
public class PontoDeHojeServlet extends HttpServlet {

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
//            out.println("<title>Servlet PontoDeHoje</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet PontoDeHoje at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        int numMatricula = Integer.parseInt(session.getAttribute("matricula").toString());
        
        PontoEletronicoDao ptEletronico = new PontoEletronicoDao();    
        ptEletronico.rgmUsuario(numMatricula);
        ArrayList<PontoEletronicoModel> ponto = ptEletronico.pontoDeHoje();
        String listaPontoAtual = "";
        //JOptionPane.showMessageDialog(null,ponto.get(0).getHoraEntrada());
        int tmLista = ponto.size();
        if(tmLista > 0){
            String hrIni = (ponto.get(0).getHoraEntrada() == null) ? "": ponto.get(0).getHoraEntrada();
            String hrIniInt = (ponto.get(0).getHoraInicioIntervalo() == null) ? "": ponto.get(0).getHoraInicioIntervalo();
            String hrFimInt = (ponto.get(0).getHoraFimIntervalo() == null) ? "": ponto.get(0).getHoraFimIntervalo();
            String hrFim = (ponto.get(0).getHoraSaida() == null) ? "": ponto.get(0).getHoraSaida();
            
            listaPontoAtual += ""
                    + "<p class='card-text'>Entrada: "+hrIni+"</p>"
                    + "<p class='card-text'>Saí­da para intervalo: "+hrIniInt+"</p>"
                    + "<p class='card-text'>Volta do intervalo: "+hrFimInt+"</p>"
                    + "<p class='card-text'>Saí­da: "+hrFim+"</p>";
        }else{
            listaPontoAtual = "Não há batidas de ponto no dia de hoje!";
        }
        
        response.setContentType("text/plain");  // Set content type of the response so that jQuery knows what it can expect.
        response.setCharacterEncoding("UTF-8"); // You want world domination, huh?
        response.getWriter().write(listaPontoAtual);
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
