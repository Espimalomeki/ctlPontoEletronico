package servlet;

import com.google.gson.Gson;
import dao.CalendarioDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.CalendarioDTO;

@WebServlet(name = "CalendarJsonServlet", urlPatterns = {"/CalendarJsonServlet"})
public class CalendarJsonServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List l = new ArrayList();

        CalendarioDao calendario = new CalendarioDao();
        ArrayList<CalendarioDTO> listaArray = calendario.listaEventosTable();   
        int size = calendario.listaEventosTable().size();
        
        for (int i = 0; i < size; i++) {
            listaArray.get(i).getId();
            listaArray.get(i).getTitle();
            listaArray.get(i).getDesc();
            listaArray.get(i).getStart();
            listaArray.get(i).getEnd();
            listaArray.get(i).isEditable();
            l.add(listaArray.get(i));
        }
        
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.write(new Gson().toJson(l));
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

}
