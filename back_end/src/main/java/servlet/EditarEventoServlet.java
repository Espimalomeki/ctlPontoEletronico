package servlet;

import dao.CalendarioDao;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.CalendarioModel;


@WebServlet(name = "EditarEvento", urlPatterns = {"/EditarEvento"})
public class EditarEventoServlet extends HttpServlet{
    
    private CalendarioDao calendDao;

    public void init() {
        calendDao = new CalendarioDao();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        CalendarioModel calend = new CalendarioModel();
        calend.setNomeEvento(request.getParameter("nomeEvento"));
        calend.setDescEvento(request.getParameter("descEvento"));
        calend.setDataInicio(request.getParameter("dtInicio").toString());
        calend.setDataFim(request.getParameter("dtFim").toString());
        calend.setTipoEvento(request.getParameter("tipoEvento"));
        calend.setIdEvento(Integer.parseInt(request.getParameter("idEvento")));


        if (calendDao.editaEvento(calend)) {
            response.sendRedirect("logado/calendario.jsp");
        } else {
            response.sendRedirect("logado/editarEvento.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}
