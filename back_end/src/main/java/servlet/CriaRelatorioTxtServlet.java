/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.Conexao;
import dao.PontoEletronicoDao;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Scanner;
import java.util.stream.Collectors;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.LoginModel;
import model.PontoEletronicoModel;

/**
 *
 * @author filip
 */
@WebServlet(name = "CriaRelatorioTxtServlet", urlPatterns = {"/CriaRelatorioTxtServlet"})
public class CriaRelatorioTxtServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

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

        FileWriter arquivo = new FileWriter(new File("C:\\Users\\filip\\OneDrive\\Desktop\\tabuada.html"));

        PontoEletronicoDao ptEletronico = new PontoEletronicoDao();
        ArrayList<PontoEletronicoModel> listaArray = ptEletronico.listaPontos();
        int tmListaPt = listaArray.size();
        String resultadoTxt = "<html> <head> </head> <body>";

        LoginModel login = new LoginModel();
        int numM = login.getNumMatricula();

        Connection con = Conexao.getConexao();
        ArrayList lista = new ArrayList();

        try {
            Connection conn = Conexao.getConexao();
            String sql = "select * from funcionario where numMatricula = ?";
            PreparedStatement selectPs = con.prepareStatement(sql);
            selectPs.setInt(1, numM);
            ResultSet rs = selectPs.executeQuery();

            while (rs.next()) {

                lista.add(0, rs.getInt("numMatricula"));
                lista.add(1, rs.getString("nome"));
                lista.add(2, rs.getString("cargo"));
                lista.add(3, rs.getString("email"));
                //lista.add(listaFunc); 
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        //for(int i=0; i < lista.size(); i++){  
        //}
        resultadoTxt += "<h1> numero da Matricula: " + lista.get(0);
        resultadoTxt += "<br> Nome Completo: " + lista.get(1);
        resultadoTxt += "<br> Cargo: " + lista.get(2);
        resultadoTxt += "<br> Email numero da Matricula: " + lista.get(3);

        for (int i = 0; i < tmListaPt; i++) {
            resultadoTxt += "</h1><br><tr>"
                    + "<td>" + listaArray.get(i).getNumMatricula() + " </td>"
                    + "<td>" + listaArray.get(i).getHoraEntrada() + "</td>"
                    + "<td>" + listaArray.get(i).getHoraInicioIntervalo() + "</td>"
                    + "<td>" + listaArray.get(i).getHoraFimIntervalo() + "</td> "
                    + "<td>" + listaArray.get(i).getHoraSaida() + "</td>"
                    + "<td>" + listaArray.get(i).getHomeOffice() + "</td>"
                    + "<td>" + listaArray.get(i).getMotivoAjuste() + "</td>"
                    + "</tr>"
                    + "</body> </html>";

        }

        arquivo.write(resultadoTxt);
        arquivo.close();
//        gravarArq.printf("+--Resultado--+%n");
//        for (i = 1; i <= 10; i++) {
//            gravarArq.printf("| %2d X %d = %2d |%n", i, n, (i * n));
//        }
//        gravarArq.printf("+-------------+%n");

        //arq.close();
//        System.out.printf("\nTabuada foi gravada com sucesso ", n);;
        response.setContentType("text/plain");  // Set content type of the response so that jQuery knows what it can expect.
        response.setCharacterEncoding("UTF-8"); // You want world domination, huh?
        response.getWriter().write("Tabuada foi gravada com sucesso ");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String str = request.getReader().lines().collect(Collectors.joining(System.lineSeparator()));
//        System.out.println(str);     
//        PrintWriter out = response.getWriter();
//        out.println(str);
//        out.close();
        
        
        FileWriter arquivo = new FileWriter(new File("C:\\Users\\filip\\OneDrive\\Desktop\\tabuada.html"));

        PontoEletronicoDao ptEletronico = new PontoEletronicoDao();
        ArrayList<PontoEletronicoModel> listaArray = ptEletronico.listaPontos();
        int tmListaPt = listaArray.size();
        String resultadoTxt = "<html> <head> </head> <body>";

        LoginModel login = new LoginModel();
        int numM = login.getNumMatricula();

        Connection con = Conexao.getConexao();
        ArrayList lista = new ArrayList();

        try {
            Connection conn = Conexao.getConexao();
            String sql = "select * from funcionario where numMatricula = ?";
            PreparedStatement selectPs = con.prepareStatement(sql);
            selectPs.setInt(1, Integer.parseInt(str));
            ResultSet rs = selectPs.executeQuery();

            while (rs.next()) {

                lista.add(0, rs.getInt("numMatricula"));
                lista.add(1, rs.getString("nome"));
                lista.add(2, rs.getString("cargo"));
                lista.add(3, rs.getString("email"));
                //lista.add(listaFunc); 
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        //for(int i=0; i < lista.size(); i++){  
        //}
        resultadoTxt += "<h1> numero da Matricula: " + lista.get(0);
        resultadoTxt += "<br> Nome Completo: " + lista.get(1);
        resultadoTxt += "<br> Cargo: " + lista.get(2);
        resultadoTxt += "<br> Email numero da Matricula: " + lista.get(3);

        for (int i = 0; i < tmListaPt; i++) {
            resultadoTxt += "</h1><br><tr>"
                    + "<td>" + listaArray.get(i).getNumMatricula() + " </td>"
                    + "<td>" + listaArray.get(i).getHoraEntrada() + "</td>"
                    + "<td>" + listaArray.get(i).getHoraInicioIntervalo() + "</td>"
                    + "<td>" + listaArray.get(i).getHoraFimIntervalo() + "</td> "
                    + "<td>" + listaArray.get(i).getHoraSaida() + "</td>"
                    + "<td>" + listaArray.get(i).getHomeOffice() + "</td>"
                    + "<td>" + listaArray.get(i).getMotivoAjuste() + "</td>"
                    + "</tr>"
                    + "</body> </html>";

        }

        arquivo.write(resultadoTxt);
        arquivo.close();
//        gravarArq.printf("+--Resultado--+%n");
//        for (i = 1; i <= 10; i++) {
//            gravarArq.printf("| %2d X %d = %2d |%n", i, n, (i * n));
//        }
//        gravarArq.printf("+-------------+%n");

        //arq.close();
//        System.out.printf("\nTabuada foi gravada com sucesso ", n);;
        response.setContentType("text/plain");  // Set content type of the response so that jQuery knows what it can expect.
        response.setCharacterEncoding("UTF-8"); // You want world domination, huh?
        response.getWriter().write("Tabuada foi gravada com sucesso ");
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
