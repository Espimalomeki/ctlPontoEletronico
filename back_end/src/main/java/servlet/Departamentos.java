package servlet;

import dao.DepartamentoDao;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.DepartamentoModel;

@WebServlet(name = "Departamentos", urlPatterns = {"/Departamentos"})
public class Departamentos extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        listaDeptos(request, response);
    }

    private void listaDeptos(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        DepartamentoDao deptos = new DepartamentoDao();
        ArrayList<DepartamentoModel> listaArray = deptos.listaDeptos();
        request.setAttribute("listBook", listaArray);
        RequestDispatcher dispatcher = request.getRequestDispatcher("logado/departamentos.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(Departamentos.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(Departamentos.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
