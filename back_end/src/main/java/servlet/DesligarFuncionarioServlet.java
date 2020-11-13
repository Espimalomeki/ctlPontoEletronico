package servlet;

import dao.FuncionarioDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "DesligarFuncionario", urlPatterns = {"/DesligarFuncionario"})
public class DesligarFuncionarioServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        int numMatricula = Integer.parseInt(session.getAttribute("matricula").toString());
        int nMatriculaFunc = Integer.parseInt(request.getParameter("numMatriculaFunc"));
        String senha = request.getParameter("password");

        FuncionarioDao func = new FuncionarioDao();

        String statusLogin = func.confirmaDesligamento(numMatricula, senha);

        if (statusLogin != "OK") {
            request.setAttribute("msgDesl", statusLogin);
            response.sendRedirect("logado/editarFuncionario.jsp?numMatricula=" + nMatriculaFunc);
        }else{
            try {
                if(func.desligarFuncionario(numMatricula, nMatriculaFunc, senha)){
                    response.sendRedirect("logado/listaTodosFuncionarios.jsp");
                }else{
                    request.setAttribute("msgDesl", "Erro ao desligar funcionario");
                    response.sendRedirect("logado/editarFuncionario.jsp?numMatricula=" + nMatriculaFunc);
                }
            } catch (SQLException ex) {
                Logger.getLogger(DesligarFuncionarioServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

}
