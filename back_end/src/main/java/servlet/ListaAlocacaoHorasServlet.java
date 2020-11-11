/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.AlocacaoDeHorasDao;
import dao.RegistraProjetoDao;
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
import javax.servlet.http.HttpSession;
import model.AlocacaoDeHorasModel;

/**
 *
 * @author filip
 */
@WebServlet(name = "ListaAlocacaoHorasServlet", urlPatterns = {"/ListaAlocacaoHorasServlet"})
public class ListaAlocacaoHorasServlet extends HttpServlet {

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
            out.println("<title>Servlet ListaAlocacaoHorasServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ListaAlocacaoHorasServlet at " + request.getContextPath() + "</h1>");
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
        try {
            AlocacaoDeHorasDao projeto = new AlocacaoDeHorasDao();
            projeto.rgmUsuario(numMatricula);
            ArrayList <AlocacaoDeHorasModel> listaArray = projeto.ListaAlocacaoHoras();
            int tmListaPt = listaArray.size();
            String listaTr = "";
            
            int idPonto;
            String nomeProj;
            for (int i = 0; i < tmListaPt; i++) {
                idPonto = listaArray.get(i).getIdProjeto();
                nomeProj = listaArray.get(i).getNomeProjeto();
                listaTr += "<tr id='"+idPonto+"'>";
                
                listaTr += ""
                        + "<td>"+idPonto+"</td>"
                        + "<td>"+nomeProj+"</td>"
                        + "<td>"+listaArray.get(i).getHorasFeitasProj()+"</td>"
                        + "<td>"+listaArray.get(i).getStatusProjeto()+"</td>"
                        + "<td>"+listaArray.get(i).getHrTotalProj()+"</td>"
                        + "<td> <button class='btn btn-success' onclick='modificarPonto("+idPonto+",`"+nomeProj+"`)'> Inserir Hora </button> </td>"                        
                        + "</tr>";
            }
            response.setContentType("text/plain");  // Set content type of the response so that jQuery knows what it can expect.
            response.setCharacterEncoding("UTF-8"); // You want world domination, huh?
            response.getWriter().write(listaTr);
        } catch (ParseException ex) {
            Logger.getLogger(ListaAlocacaoHorasServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

}
