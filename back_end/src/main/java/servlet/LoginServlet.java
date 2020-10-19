package servlet;

import dao.LoginDao;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.LoginModel;

@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private LoginDao loginDao;

    public void init() {
        loginDao = new LoginDao();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int numMatricula = Integer.parseInt(request.getParameter("matricula"));
        String senha = request.getParameter("password");
        LoginModel login = new LoginModel();
        login.setNumMatricula(numMatricula);
        login.setSenha(senha);

        boolean validationFlag = loginDao.validate(login);

        if (validationFlag) {
            HttpSession session = request.getSession();
            session.setAttribute("perfil", login.getPermissao());
            session.setAttribute("matricula", login.getNumMatricula());
            session.setAttribute("nomeFunc", login.getNome());
            session.setAttribute("nomeDepto", login.getNomeDepto());
            session.setAttribute("codDepto", login.getCodDepto());
            request.getSession().setAttribute("usuarioLogado", login);
            response.sendRedirect("logado/principal.jsp");
        } else{
            response.sendRedirect("index.jsp");
        }
    }

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
