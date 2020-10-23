package servlet;

import dao.SenhaDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.AlteraSenhaModel;

@WebServlet(name = "alterarSenha", urlPatterns = {"/AlterarSenha"})
public class EditaSenhaServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private  SenhaDao senhaDao;

    public void init() {
        senhaDao = new SenhaDao();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        AlteraSenhaModel senha = new AlteraSenhaModel();
        
        senha.setNumMatricula(Integer.parseInt(request.getParameter("numMatricula")));
        senha.setSenha(request.getParameter("senha"));
      

            if (senhaDao.editaSenha(senha)) {
            
            response.sendRedirect("logado/perfilProfissional.jsp?");
            
        } else {
            PrintWriter out = response.getWriter();
            out.print("<div>Não foi possível alterar a senha, volte para a página anterior e tente novamente</div>");
        }
    }

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
