package servlet;

import dao.FuncionarioDao;
import dao.LoginDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.FuncionarioModel;

@WebServlet(name = "CadastraFuncionario", urlPatterns = {"/CadastraFuncionario"})
public class CadastraFuncionarioServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private FuncionarioDao funcDao;

    public void init() {
        funcDao = new FuncionarioDao();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        FuncionarioModel func = new FuncionarioModel();
        func.setNome(request.getParameter("nome"));
        func.setCpf(request.getParameter("cpf"));
        func.setRne(request.getParameter("rne"));
        func.setEmail(request.getParameter("email"));
        func.setDataNasc(request.getParameter("dataNascimento"));
        func.setTelefone(request.getParameter("telefone"));
        func.setContaBancaria(request.getParameter("contaBancaria"));
        func.setEndereco(request.getParameter("endereco"));
        func.setComplemento(request.getParameter("complemento"));
        func.setDataAdmissao(request.getParameter("dataAdmissao"));
        func.setCargo(request.getParameter("cargo"));
        func.setCargaHoraria(request.getParameter("cargaHoraria"));
        func.setSalario(request.getParameter("salario"));
        func.setGenero(request.getParameter("genero"));
        func.setPermissao(request.getParameter("permissao"));

        if (funcDao.incluirFuncionario(func)) {
            System.out.println("Deu certo 1");
            response.sendRedirect("principal.jsp");
        } else {
            response.sendRedirect("cadastrarFuncionario.jsp");
        }
    }
}
