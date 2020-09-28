package servlet;

import dao.DepartamentoDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.DepartamentoModel;

@WebServlet(name = "IncluirDepartamento", urlPatterns = {"/IncluirDepartamento"})
public class IncluiDepartamentoServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private DepartamentoDao deptoDao;

    public void init() {
        deptoDao = new DepartamentoDao();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        DepartamentoModel depto = new DepartamentoModel();
        depto.setNomeDepto(request.getParameter("nomeDepto"));
        
        if (deptoDao.incluirDepartamento(depto)) {
            response.sendRedirect("logado/departamentos.jsp");
        } else {
            PrintWriter out = response.getWriter();
            out.print("<div>This is a danger alert—check it out!</div>");
        }
    }
}
