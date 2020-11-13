/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.RegistraProjetoDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.RegistraProjetoModel;

/**
 *
 * @author filip
 */
@WebServlet(name = "ListaProjetosServlet", urlPatterns = {"/ListaProjetosServlet"})
public class ListaProjetosServlet extends HttpServlet {

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
            out.println("<title>Servlet ListaProjetos</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ListaProjetos at " + request.getContextPath() + "</h1>");
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
            
        RegistraProjetoDao projeto = new RegistraProjetoDao();
            
        ArrayList <RegistraProjetoModel> listaArray = projeto.ListaProjeto(numMatricula);
        int tmListaPt = listaArray.size();
        String listaTr = "<option data-default disabled selected></option>";
        
        int idPonto;
        String nomeProj;
        for (int i = 0; i < tmListaPt; i++) {
            idPonto = listaArray.get(i).getIdProjeto();
            nomeProj = listaArray.get(i).getDescProjeto();
                
            listaTr += "<option value='"+idPonto+"'>"+idPonto+" - "+nomeProj+"</option>";
        }
        response.setContentType("text/plain"); 
        response.setCharacterEncoding("UTF-8");
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
