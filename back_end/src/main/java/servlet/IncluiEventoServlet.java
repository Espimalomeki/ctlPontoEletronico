package servlet;

import dao.CalendarioDao;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.CalendarioModel;

@WebServlet(name = "IncluiEvento", urlPatterns = {"/IncluiEvento"})
public class IncluiEventoServlet extends HttpServlet {

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

        HttpSession session = request.getSession();
        int numMatricula = Integer.parseInt(session.getAttribute("matricula").toString());
        
//        String[] participantes = request.getParameterValues("select1");
//        for(int i = 0; i < participantes.length; i++){
//            out.println(participantes[i] + "<BR>");
//        }
        if (calendDao.insereEvento(calend, numMatricula)) {
            int idEvento = calendDao.buscaId(calend.getNomeEvento(), numMatricula);
            String[] participantes = request.getParameterValues("participantes");
            for (int i = 0; i < participantes.length; i++) {
                calendDao.associaEventoUsuario(Integer.parseInt(participantes[i]), idEvento);
            }
            response.sendRedirect("logado/calendario.jsp");
        } else {
            response.sendRedirect("logado/incluirEvento.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

}
