package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.LoginModel;

@WebServlet(name = "Logout", urlPatterns = {"/Logout"})
public class LogoutServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        LoginModel login = new LoginModel();
        login.setNumMatricula(0);
        login.setSenha(null);
        login.setNome(null);
        login.setPermissao(null);
        login.setCodDepto(0);

        HttpSession session = request.getSession();
        session.setAttribute("perfil", null);
        session.setAttribute("matricula", null);
        session.setAttribute("nomeFunc", null);
        request.getSession().setAttribute("usuarioLogado", null);
        response.sendRedirect("index.jsp");
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request,response);
    }
    

}
