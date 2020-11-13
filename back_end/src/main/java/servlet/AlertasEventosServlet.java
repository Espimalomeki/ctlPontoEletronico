/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.AlertasDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.AlertasModel;

/**
 *
 * @author filip
 */
@WebServlet(name = "AlertasEventosServlet", urlPatterns = {"/AlertasEventosServlet"})
public class AlertasEventosServlet extends HttpServlet {

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
            out.println("<title>Servlet AlertasEventosServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AlertasEventosServlet at " + request.getContextPath() + "</h1>");
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        int numMatricula = Integer.parseInt(session.getAttribute("matricula").toString());

        AlertasDao alerta = new AlertasDao();
        alerta.rgmUsuario(numMatricula);
        try {
            ArrayList<AlertasModel> listaArray = alerta.eventosAtivos();

            int tmLista = listaArray.size();
            String divAlertas = "";

            for (int i = 0; i < tmLista; i++) {

                divAlertas += ""
                        + "<div class='toast fade show' role='alert' aria-live='assertive' aria-atomic='true'>"
                        + "      <div class='toast-header'>"
                        + "        <svg class='bd-placeholder-img rounded mr-2' width='20' height='20' xmlns='http://www.w3.org/2000/svg' preserveAspectRatio='xMidYMid slice' focusable='false' role='img'><rect width='100%' height='100%' fill='#007aff'></rect></svg>"
                        + "        <strong class='mr-auto'>"+listaArray.get(i).getNomeEvento()+"</strong>"
                        + "        <button type='button' class='ml-2 mb-1 close' data-dismiss='toast' aria-label='Close'>"
                        + "          <span aria-hidden='true'>"+listaArray.get(i).getTipoEvento()+"</span>"
                        + "        </button>"
                        + "      </div>"
                        + "      <div class='toast-body'>"
                        + "        "+listaArray.get(i).getDescEvento()+"<br>"
                        + "Inicio: "+listaArray.get(i).getDataInicial()+"  - Fim:" +listaArray.get(i).getDataFinal()
                        + "      </div>"
                        + "    </div>";
            }
            response.setContentType("text/plain");  // Set content type of the response so that jQuery knows what it can expect.
            response.setCharacterEncoding("UTF-8"); // You want world domination, huh?
            response.getWriter().write(divAlertas);

        } catch (SQLException ex) {
            Logger.getLogger(AlertasEventosServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

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
