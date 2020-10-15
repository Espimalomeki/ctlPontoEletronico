/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.Conexao;
import dao.FuncionarioDao;
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
import model.FuncionarioModel;
import model.LoginModel;
import model.PontoEletronicoModel;
import model.RelatorioFuncionarioSelecionadoModel;

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

        //FileWriter arquivo = new FileWriter(new File("C:\\Users\\filip\\OneDrive\\Desktop\\tabuada.html"));

        PontoEletronicoDao ptEletronico = new PontoEletronicoDao();
        ArrayList<PontoEletronicoModel> listaArray = ptEletronico.listaHorario(0);
        int tmListaPt = listaArray.size();
        String resultadoTxt = "<html> <head> </head> "
                + "<style>  </style>"
                + "<body style='margin-left:50px'> ";
        
        FuncionarioDao funcDao = new FuncionarioDao();
        FuncionarioModel func = funcDao.retornaFuncionario();
        resultadoTxt += "<center><h2>Relatorio Geral</h2></center> <div style='margin-left: 6rem;margin-bottom: 3rem; width: 45%; position: relative; float: left; font-size: 1.3rem;'>"
        + "<p class='card-text'>Nome Completo:"+ func.getNome()+"</p>"+
        "<p class='card-text'>CPF: "+ func.getCpf()+"</p>"+
        "<p class='card-text'>Documento de Identidade: "+ func.getRne()+"</p>"+
        "<p class='card-text'>Data de Nascimento: "+ func.getDataNasc()+"</p>"+
        "<p class='card-text'>E-mail: "+ func.getEmail()+"</p>"+
        "<p class='card-text'>Endereço: "+func.getEndereco()+"</p>"+
        "<p class='card-text'>Complemento: "+ func.getComplemento()+"</p>"
                + "</div> <div style='margin-bottom: 3rem; width: 35%; position: relative; float: left; font-size: 1.3rem;'>"+
        "<p class='card-text'>Número de Matrícula: "+ func.getNumMatricula()+"</p>"+
        "<p class='card-text'>Data de Admissão: "+ func.getDataAdmissao()+"</p>"+
        "<p class='card-text'>Cargo: "+ func.getCargo()+"</p>"+
        "<p class='card-text'>Carga Horaria: "+ func.getCargaHoraria()+"</p>"+
        "<p class='card-text'>Salário: "+ func.getSalario()+"</p>"+
        "<p class='card-text'>Conta Bancária: "+ func.getContaBancaria()+"</p></div>";
        
        resultadoTxt += "</h1><br>"
                    + "<table style='width: 95%;'><thead><tr>"
                    + "<th>Entrada</th><th>Saída Intervalo</th><th>Entrada Intervalo</th><th>Saí&shy;da</th><th>Homeoffice</th><th>Motivo de Ajuste</th>"
                    + "</tr>"
                    + "</thead><tbody>";
        for (int i = 0; i < tmListaPt; i++) {
            resultadoTxt += "<tr>"
                    + "<td>" + listaArray.get(i).getHoraEntrada() + "</td>"
                    + "<td>" + listaArray.get(i).getHoraInicioIntervalo() + "</td>"
                    + "<td>" + listaArray.get(i).getHoraFimIntervalo() + "</td> "
                    + "<td>" + listaArray.get(i).getHoraSaida() + "</td>"
                    + "<td>" + listaArray.get(i).getHomeOffice() + "</td>"
                    + "<td>" + listaArray.get(i).getMotivoAjuste() + "</td>"
                    + "</tr>";
                    

        }
        
        resultadoTxt += ""
                + "</tr></tbody></table>"
                + "</body> </html>";
        response.setContentType("text/plain");  // Set content type of the response so that jQuery knows what it can expect.
        response.setCharacterEncoding("UTF-8"); // You want world domination, huh?
        response.getWriter().write(resultadoTxt);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String str = request.getReader().lines().collect(Collectors.joining(System.lineSeparator()));

        PontoEletronicoDao ptEletronico = new PontoEletronicoDao();
        ArrayList<RelatorioFuncionarioSelecionadoModel> listaArray = ptEletronico.listaPontosFuncSelecionado(str);
        int tmListaPt = listaArray.size();

        String resultadoTxt = "<html> <head> </head> "
                + "<style>  </style>"
                + "<body style='margin-left:50px'> ";
        
        FuncionarioDao funcDao = new FuncionarioDao();
        RelatorioFuncionarioSelecionadoModel func = funcDao.retornaFuncionarioSelecionado(str);
        resultadoTxt += "<center><h2>Relatorio Geral</h2></center> <div style='margin-left: 6rem;margin-bottom: 3rem; width: 45%; position: relative; float: left; font-size: 1.3rem;'>"
        + "<p class='card-text'>Nome Completo:"+ func.getNome()+"</p>"+
        "<p class='card-text'>CPF: "+ func.getCpf()+"</p>"+
        "<p class='card-text'>Documento de Identidade: "+ func.getRne()+"</p>"+
        "<p class='card-text'>Data de Nascimento: "+ func.getDataNasc()+"</p>"+
        "<p class='card-text'>E-mail: "+ func.getEmail()+"</p>"+
        "<p class='card-text'>Endereço: "+func.getEndereco()+"</p>"+
        "<p class='card-text'>Complemento: "+ func.getComplemento()+"</p>"
                + "</div> <div style='margin-bottom: 3rem; width: 35%; position: relative; float: left; font-size: 1.3rem;'>"+
        "<p class='card-text'>Número de Matrícula: "+ func.getNumMatricula()+"</p>"+
        "<p class='card-text'>Data de Admissão: "+ func.getDataAdmissao()+"</p>"+
        "<p class='card-text'>Cargo: "+ func.getCargo()+"</p>"+
        "<p class='card-text'>Carga Horaria: "+ func.getCargaHoraria()+"</p>"+
        "<p class='card-text'>Salário: "+ func.getSalario()+"</p>"+
        "<p class='card-text'>Conta Bancária: "+ func.getContaBancaria()+"</p></div>";
        
        resultadoTxt += "</h1><br>"
                    + "<table style='width: 95%;'><thead><tr>"
                    + "<th>Rgm</th><th>Entrada</th><th>Saída Intervalo</th><th>Entrada Intervalo</th><th>Saí&shy;da</th><th>Homeoffice</th><th>Motivo de Ajuste</th>"
                    + "</tr>"
                    + "</thead><tbody>";
        for (int i = 0; i < tmListaPt; i++) {
            resultadoTxt += "<tr>"
                    + "<td>" + listaArray.get(i).getNumMatricula() + " </td>"
                    + "<td>" + listaArray.get(i).getHoraEntrada() + "</td>"
                    + "<td>" + listaArray.get(i).getHoraInicioIntervalo() + "</td>"
                    + "<td>" + listaArray.get(i).getHoraFimIntervalo() + "</td> "
                    + "<td>" + listaArray.get(i).getHoraSaida() + "</td>"
                    + "<td>" + listaArray.get(i).getHomeOffice() + "</td>"
                    + "<td>" + listaArray.get(i).getMotivoAjuste() + "</td>"
                    + "</tr>";
                    

        }
        
        resultadoTxt += ""
                + "</tr></tbody></table>"
                + "</body> </html>";
//        gravarArq.printf("+--Resultado--+%n");
//        for (i = 1; i <= 10; i++) {
//            gravarArq.printf("| %2d X %d = %2d |%n", i, n, (i * n));
//        }
//        gravarArq.printf("+-------------+%n");

        //arq.close();
//        System.out.printf("\nTabuada foi gravada com sucesso ", n);;
        response.setContentType("text/plain");  // Set content type of the response so that jQuery knows what it can expect.
        response.setCharacterEncoding("UTF-8"); // You want world domination, huh?
        response.getWriter().write(resultadoTxt);
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
