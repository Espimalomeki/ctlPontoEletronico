package servlet;

import dao.DepartamentoDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.DepartamentoModel;

@WebServlet(name = "EditarDepartamento", urlPatterns = {"/EditarDepartamento"})
public class EditaDepartamentoServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private DepartamentoDao deptoDao;

    public void init() {
        deptoDao = new DepartamentoDao();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        DepartamentoModel depto = new DepartamentoModel();
        //System.out.println(Integer.parseInt(request.getParameter("codDepto")));
        depto.setCodDepto(Integer.parseInt(request.getParameter("codDepto")));
        
        depto.setNomeDepto(request.getParameter("nomeDepto"));

        if (deptoDao.editaDepartamento(depto)) {
            response.sendRedirect("logado/departamentos.jsp");
        } else {
            PrintWriter out = response.getWriter();
            out.print("<div>Não foi possível editar o departamento, volte para a página anterior e tente novamente</div>");
        }
    }

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
