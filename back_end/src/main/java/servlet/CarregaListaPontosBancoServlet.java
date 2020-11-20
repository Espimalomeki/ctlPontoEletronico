package servlet;

import dao.BancoDeHorasDao;
import dao.PontoEletronicoDao;
import static dao.PontoEletronicoDao.completeToLeft;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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

                String res = "";
                String horasPontoAtual = "";
                String horasIntervaloAtual = "";
                String hrFinal = "";
                
                SimpleDateFormat formatoHr = new SimpleDateFormat("HH:mm:ss");
                
                horasPontoAtual = listaHr.get(i).getQtdHorasTrabalhadas();
                
                String hrIniInt = (listaHr.get(i).getHoraInicioIntervalo() == null) ? "" : listaHr.get(i).getHoraInicioIntervalo();
                String hrFimInt = (listaHr.get(i).getHoraFimIntervalo() == null) ? "" : listaHr.get(i).getHoraFimIntervalo();
                
            try {
                horasIntervaloAtual = ptEletronico.calculaHoraIntervalo(hrIniInt, hrFimInt);
                
                Date hr1 = formatoHr.parse(horasPontoAtual);
                Date hr2 = formatoHr.parse(horasIntervaloAtual);

                long diff = hr1.getTime() - hr2.getTime();

                String seconds = (diff / 1000 % 60) + "";
                String minutes = (diff / (60 * 1000) % 60) + "";
                String hours = (diff / (60 * 60 * 1000)) + "";

                seconds = completeToLeft(seconds, '0', 2);
                minutes = completeToLeft(minutes, '0', 2);
                hours = completeToLeft(hours, '0', 2);

                hrFinal = hours + ":" + minutes + ":" + seconds;

                Date horasTrabalhadas = formatoHr.parse(hrFinal);
                
                long hrRes = horasTrabalhadas.getHours();

                if (hrRes >= 8) {
                    res = "<div style='color:green;'>" + hrFinal + "</div>";
                } else {
                    res = "<div style='color:red;'>" + hrFinal + "</div>";
                }
                
            } catch (ParseException ex) {
                Logger.getLogger(CarregaListaPontosBancoServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
                
                listaResul += "<tr>"
                    + "<td>"+ listaHr.get(i).getHoraEntrada()+"</td>"
                    + "<td>"+ listaHr.get(i).getHoraInicioIntervalo()+"</td>"
                    + "<td>"+ listaHr.get(i).getHoraFimIntervalo()+"</td>"
                    + "<td>"+ listaHr.get(i).getHoraSaida() +"</td>"
                    + "<td>"+ res +"</td>"
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
                String res = "";
                String horasPontoAtual = "";
                String horasIntervaloAtual = "";
                String hrFinal = "";
                
                SimpleDateFormat formatoHr = new SimpleDateFormat("HH:mm:ss");
                
                horasPontoAtual = listaHr.get(i).getQtdHorasTrabalhadas();
                
                String hrIniInt = (listaHr.get(i).getHoraInicioIntervalo() == null) ? "" : listaHr.get(i).getHoraInicioIntervalo();
                String hrFimInt = (listaHr.get(i).getHoraFimIntervalo() == null) ? "" : listaHr.get(i).getHoraFimIntervalo();
                
            try {
                horasIntervaloAtual = ptEletronico.calculaHoraIntervalo(hrIniInt, hrFimInt);
                
                Date hr1 = formatoHr.parse(horasPontoAtual);
                Date hr2 = formatoHr.parse(horasIntervaloAtual);

                long diff = hr1.getTime() - hr2.getTime();

                String seconds = (diff / 1000 % 60) + "";
                String minutes = (diff / (60 * 1000) % 60) + "";
                String hours = (diff / (60 * 60 * 1000)) + "";

                seconds = completeToLeft(seconds, '0', 2);
                minutes = completeToLeft(minutes, '0', 2);
                hours = completeToLeft(hours, '0', 2);

                hrFinal = hours + ":" + minutes + ":" + seconds;

                Date horasTrabalhadas = formatoHr.parse(hrFinal);
                
                long hrRes = horasTrabalhadas.getHours();

                if (hrRes >= 8) {
                    res = "<div style='color:green;'>" + hrFinal + "</div>";
                } else {
                    res = "<div style='color:red;'>" + hrFinal + "</div>";
                }
                
            } catch (ParseException ex) {
                Logger.getLogger(CarregaListaPontosBancoServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
                
                listaResul += "<tr>"
                    + "<td>"+ listaHr.get(i).getHoraEntrada()+"</td>"
                    + "<td>"+ listaHr.get(i).getHoraInicioIntervalo()+"</td>"
                    + "<td>"+ listaHr.get(i).getHoraFimIntervalo()+"</td>"
                    + "<td>"+ listaHr.get(i).getHoraSaida() +"</td>"
                    + "<td>"+ res +"</td>"
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
