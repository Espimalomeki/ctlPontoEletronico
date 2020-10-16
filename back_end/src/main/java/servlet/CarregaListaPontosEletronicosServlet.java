/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.FuncionarioDao;
import dao.PontoEletronicoDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.enterprise.context.SessionScoped;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;
import model.FuncionarioModel;
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
        try {
            PontoEletronicoDao ptEletronico = new PontoEletronicoDao();
            ArrayList <PontoEletronicoModel> listaArray = ptEletronico.listaPontos(false);
            int tmListaPt = listaArray.size();
            String listaTr = "";
            FuncionarioDao funcDao = new FuncionarioDao();
            FuncionarioModel func = funcDao.retornaFuncionario();
            String funcao = func.getPermissao();
            
            int idPonto;
            for (int i = 0; i < tmListaPt; i++) {
                idPonto = listaArray.get(i).getIdPonto();
                listaTr += "<tr id='"+idPonto+"'>";
                                                        
//                if(funcao.equals("RH")){
//                    listaTr += "<td> <button class='btn btn-success' onclick='modificarPonto("+idPonto+")'> Editar </button> </td>";
//                };
                
                listaTr += ""
//                    + "<td>"+listaArray.get(i).getNumMatricula()+" </td>"
                        + "<td><center>"+listaArray.get(i).getHoraEntrada()+"</center></td>"
                        + "<td class='pl-5'>"+listaArray.get(i).getTotalHrIntervalo()+"</td>"
                        + "<td><center>"+listaArray.get(i).getHoraSaida()+"</center></td>"
                        + "<td class='pl-4'>"+listaArray.get(i).getHomeOffice()+"</td>"
                        + "<td><small>"+listaArray.get(i).getMotivoAjuste()+"</small></td>";
                
                        if(funcao.equals("RH")){
                            listaTr += "<td><button class='btn btn-danger' onclick='excluirPonto(`"+idPonto+"`)' >Excluir</button></td>";
                        }
                                
                listaTr += "</tr>";
            }
            response.setContentType("text/plain");  // Set content type of the response so that jQuery knows what it can expect.
            response.setCharacterEncoding("UTF-8"); // You want world domination, huh?
            response.getWriter().write(listaTr);
        } catch (ParseException ex) {
            Logger.getLogger(CarregaListaPontosEletronicosServlet.class.getName()).log(Level.SEVERE, null, ex);
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
