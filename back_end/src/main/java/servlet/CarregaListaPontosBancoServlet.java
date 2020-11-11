package servlet;

import dao.BancoDeHorasDao;
import dao.PontoEletronicoDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.stream.Collectors;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.BancoDeHorasModel;
import model.PontoEletronicoModel;

@WebServlet(name = "CarregaListaPontosBancoServlet", urlPatterns = {"/CarregaListaPontosBancoServlet"})
public class CarregaListaPontosBancoServlet extends HttpServlet {
    
    

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CarregaListaPontosBancoServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CarregaListaPontosBancoServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        int numMatricula = Integer.parseInt(session.getAttribute("matricula").toString());
        
        PontoEletronicoDao ptEletronico = new PontoEletronicoDao();        
        ArrayList<PontoEletronicoModel> listaHr = ptEletronico.listaHorario(numMatricula);
            int tamListaHr = listaHr.size();
        
            String listaResul = "";

            for (int i = 0; i < tamListaHr; i++) {

                listaResul += "<tr>"
                    + "<td>"+ listaHr.get(i).getHoraEntrada()+"</td>"
                    + "<td>"+ listaHr.get(i).getHoraInicioIntervalo()+"</td>"
                    + "<td>"+ listaHr.get(i).getHoraFimIntervalo()+"</td>"
                    + "<td>"+ listaHr.get(i).getHoraSaida() +"</td>"
                    + "<td>"+ listaHr.get(i).getQtdHorasTrabalhadas() +"</td>"
                + "</tr>"; 

            }
            
            response.setContentType("text/plain");  // Set content type of the response so that jQuery knows what it can expect.
            response.setCharacterEncoding("UTF-8"); // You want world domination, huh?
            response.getWriter().write(listaResul);
            
       
        
        
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int str = Integer.parseInt(request.getReader().lines().collect(Collectors.joining(System.lineSeparator())));
        
        HttpSession session = request.getSession();
        int numMatricula = Integer.parseInt(session.getAttribute("matricula").toString());
        
        PontoEletronicoDao ptEletronico = new PontoEletronicoDao();
        //ptEletronico.rgmUsuario(numMatricula);
        
        ArrayList<PontoEletronicoModel> listaHr = ptEletronico.listaHorario(str);
            int tamListaHr = listaHr.size();
        
            String listaResul = "";

            for (int i = 0; i < tamListaHr; i++) {

                listaResul += "<tr>"
                    + "<td>"+ listaHr.get(i).getHoraEntrada()+"</td>"
                    + "<td>"+ listaHr.get(i).getHoraInicioIntervalo()+"</td>"
                    + "<td>"+ listaHr.get(i).getHoraFimIntervalo()+"</td>"
                    + "<td>"+ listaHr.get(i).getHoraSaida() +"</td>"
                    + "<td>"+ listaHr.get(i).getQtdHorasTrabalhadas() +"</td>"
                + "</tr>"; 

            }
            
            response.setContentType("text/plain");  // Set content type of the response so that jQuery knows what it can expect.
            response.setCharacterEncoding("UTF-8"); // You want world domination, huh?
            response.getWriter().write(listaResul);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
