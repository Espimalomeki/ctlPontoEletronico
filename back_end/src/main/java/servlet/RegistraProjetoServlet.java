/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.RegistraProjetoDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;
import model.RegistraProjetoModel;

/**
 *
 * @author didigob
 */
@WebServlet(name = "registraProj", urlPatterns = {"/projetos"})
public class RegistraProjetoServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private RegistraProjetoDao projDao;

    public void init() {
        projDao = new RegistraProjetoDao();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        int numMatricula = Integer.parseInt(session.getAttribute("matricula").toString());
        
        RegistraProjetoModel proj = new RegistraProjetoModel();
        proj.setCargaTotalHr(request.getParameter("cargaTotalHr"));
        proj.setDescProjeto(request.getParameter("descProjeto"));
        proj.setStatusProjeto(request.getParameter("statusProjeto"));
        
        
        if (projDao.incluirProjeto(proj, numMatricula)) {
            System.out.println("Deu certo !");
            response.sendRedirect("logado/projetos.jsp");
        }
    }
}
