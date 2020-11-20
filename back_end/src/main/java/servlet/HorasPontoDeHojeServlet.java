package servlet;

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
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.PontoEletronicoModel;

@WebServlet(name = "HorasPontoDeHojeServlet", urlPatterns = {"/HorasPontoDeHojeServlet"})
public class HorasPontoDeHojeServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        int numMatricula = Integer.parseInt(session.getAttribute("matricula").toString());

        PontoEletronicoDao ptEletronico = new PontoEletronicoDao();
        ptEletronico.rgmUsuario(numMatricula);
        ArrayList<PontoEletronicoModel> ponto = ptEletronico.pontoDeHoje();
        String horasPontoAtual = "";
        String horasIntervaloAtual = "";
        String hrFinal = "";
        String res = "";

        int tmLista = ponto.size();
        if (tmLista > 0) {
            String hrIni = (ponto.get(0).getHoraEntrada() == null) ? "" : ponto.get(0).getHoraEntrada();
            String hrFim = (ponto.get(0).getHoraSaida() == null) ? "" : ponto.get(0).getHoraSaida();
            String hrIniInt = (ponto.get(0).getHoraInicioIntervalo() == null) ? "" : ponto.get(0).getHoraInicioIntervalo();
            String hrFimInt = (ponto.get(0).getHoraFimIntervalo() == null) ? "" : ponto.get(0).getHoraFimIntervalo();

            SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            SimpleDateFormat formatoHr = new SimpleDateFormat("HH:mm");

            try {
                horasPontoAtual = ptEletronico.calculaTotalDeHoras(hrIni, hrFim, true);
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

                hrFinal = hours + ":" + minutes;

                Date horasTrabalhadas = formatoHr.parse(hrFinal);
                
                long hrRes = horasTrabalhadas.getHours();

                if (hrRes >= 8) {
                    res = "<div style='color:green;'>" + hrFinal + "</div>";
                } else {
                    res = "<div style='color:red;'>" + hrFinal + "</div>";
                }

            } catch (ParseException ex) {
                Logger.getLogger(HorasPontoDeHojeServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            res = "00:00";
        }

        response.setContentType("text/plain");  // Set content type of the response so that jQuery knows what it can expect.
        response.setCharacterEncoding("UTF-8"); // You want world domination, huh?
        response.getWriter().write(res);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
