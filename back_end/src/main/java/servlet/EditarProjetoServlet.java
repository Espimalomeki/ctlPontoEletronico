package servlet;

import dao.RegistraProjetoDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.RegistraProjetoModel;

@WebServlet(name = "EditarProjeto", urlPatterns = {"/EditarProjeto"})
public class EditarProjetoServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private  RegistraProjetoDao projDao;

    public void init() {
        projDao = new RegistraProjetoDao();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        RegistraProjetoModel proj = new RegistraProjetoModel();
        
        proj.setIdProjeto(Integer.parseInt(request.getParameter("idProjeto")));
        proj.setDescProjeto(request.getParameter("descProjeto"));
        proj.setStatusProjeto(request.getParameter("statusProjeto"));
        proj.setCargaTotalHr(request.getParameter("cargaTotalHr"));

        if (projDao.editaProjeto(proj)) {
            response.sendRedirect("logado/projetos.jsp");
        } else {
            PrintWriter out = response.getWriter();
            out.print("<div>Não foi possível editar o projeto, volte para a página anterior e tente novamente</div>");
        }
    }

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
