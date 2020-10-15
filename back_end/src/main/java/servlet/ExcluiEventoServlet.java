package servlet;

import dao.CalendarioDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.CalendarioModel;

@WebServlet(name = "ExcluiEvento", urlPatterns = {"/ExcluiEvento"})
public class ExcluiEventoServlet extends HttpServlet {

     private CalendarioDao calendDao;

    public void init() {
        calendDao = new CalendarioDao();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        CalendarioModel calend = new CalendarioModel();
        calend.setIdEvento(Integer.parseInt(request.getParameter("id")));


        if (calendDao.excluiEvento(calend)) {
            response.sendRedirect("logado/calendario.jsp");
        } else {
            System.out.println("Erro ao excluir evento");
            response.sendRedirect("logado/calendario.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}
