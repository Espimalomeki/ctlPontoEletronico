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
                        + "        <svg width='20' height='20' viewBox='0 0 16 16' class='bi mr-2 bi-calendar3' fill='currentColor' xmlns='http://www.w3.org/2000/svg\'>"
                        + "            <path fill-rule='evenodd' d='M14 0H2a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2zM1 3.857C1 3.384 1.448 3 2 3h12c.552 0 1 .384 1 .857v10.286c0 .473-.448.857-1 .857H2c-.552 0-1-.384-1-.857V3.857z'/>"
                        + "            <path fill-rule='evenodd' d='M6.5 7a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm-9 3a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm-9 3a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2z'/>"
                        + "        </svg>"
                        + "        <b class='mr-auto'>"+listaArray.get(i).getNomeEvento()+"</b>"
                        + "        <button type='button' class='ml-2 mb-1 close' data-dismiss='toast' aria-label='Close'>"
                        + "          <span aria-hidden='true' style='font-size: 1rem;'>"+listaArray.get(i).getTipoEvento()+"</span>"
                        + "        </button>"
                        + "      </div>"
                        + "      <div class='toast-body'>"
                        + "        "+listaArray.get(i).getDescEvento()+"<br>"
                        + "Inicio: "+listaArray.get(i).getDataInicial()+"  - Fim: " +listaArray.get(i).getDataFinal()
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
