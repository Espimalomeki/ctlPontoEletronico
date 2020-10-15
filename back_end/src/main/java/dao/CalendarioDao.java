package dao;

import java.awt.event.FocusEvent;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import model.CalendarioDTO;
import model.CalendarioModel;
import model.DepartamentoModel;
import model.LoginModel;

public class CalendarioDao {

    public ArrayList listaEventos() {

        Connection con = Conexao.getConexao();
        LoginModel login = new LoginModel();

        int numM = login.getNumMatricula();

        ArrayList lista = new ArrayList();
        try {
            Connection conn = Conexao.getConexao();

            String sql = "SELECT * FROM eventoCalendario WHERE numMatricula = ?";
            PreparedStatement selectPs = con.prepareStatement(sql);
            selectPs.setInt(1, numM);
            ResultSet rs = selectPs.executeQuery();

            while (rs.next()) {
                CalendarioDTO eventos = new CalendarioDTO();
                eventos.setId(rs.getInt("idEvento"));
                eventos.setTitle(rs.getString("nomeEvento"));
                eventos.setDesc(rs.getString("descEvento"));
                eventos.setStart(rs.getString("dataInicial"));
                eventos.setEnd(rs.getString("dataFinal"));
                lista.add(eventos);
            }

            rs.close();
            conn.close();

            return lista;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;

    }
    
    public ArrayList listaEventosTable() {

        Connection con = Conexao.getConexao();
        LoginModel login = new LoginModel();

        int numM = login.getNumMatricula();

        ArrayList lista = new ArrayList();
        try {
            Connection conn = Conexao.getConexao();

            String sql = "SELECT U.idEvento, E.nomeEvento, E.descEvento, E.dataInicial, E.dataFinal, E.numMatricula " + 
                         "FROM usuariosEvento as U " +
                         "INNER JOIN eventoCalendario as E " +
                         "ON U.idEvento = E.idEvento " +
                         "WHERE U.numMatricula = ?";
                        
            PreparedStatement selectPs = con.prepareStatement(sql);
            selectPs.setInt(1, numM);
            ResultSet rs = selectPs.executeQuery();

            while (rs.next()) {
                CalendarioDTO eventos = new CalendarioDTO();
                eventos.setId(rs.getInt("idEvento"));
                eventos.setTitle(rs.getString("nomeEvento"));
                eventos.setDesc(rs.getString("descEvento"));
                eventos.setStart(rs.getString("dataInicial"));
                eventos.setEnd(rs.getString("dataFinal"));
                
                if(rs.getInt("numMatricula") == numM)
                    eventos.setEditable(true);
                else
                    eventos.setEditable(false);
                
                lista.add(eventos);
            }

            rs.close();
            conn.close();

            return lista;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;

    }

    public CalendarioDTO listaUnico(int id){
        Connection conn = Conexao.getConexao();
        LoginModel login = new LoginModel();
        CalendarioDTO evento = new CalendarioDTO();

        try {
            

            String sql = "SELECT * FROM eventoCalendario WHERE idEvento = ?";
            PreparedStatement selectPs = conn.prepareStatement(sql);
            selectPs.setInt(1,id);
            ResultSet rs = selectPs.executeQuery();

            if(rs.next()) {
                
                evento.setId(rs.getInt("idEvento"));
                evento.setTitle(rs.getString("nomeEvento"));
                evento.setDesc(rs.getString("descEvento"));
                evento.setStart(rs.getString("dataInicial"));
                evento.setEnd(rs.getString("dataFinal"));
                evento.setType(rs.getString("tipoEvento"));
            }

            rs.close();
            conn.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return evento;
        
    }
    
    public boolean insereEvento(CalendarioModel calendario) {
        boolean status = false;

        Connection con = Conexao.getConexao();
        LoginModel login = new LoginModel();

        int numM = login.getNumMatricula();
        Date dNow = new Date();

        try {
            SimpleDateFormat datahoraForm = new SimpleDateFormat("yyyy/MM/dd hh:mm:ss");

            String sql = "INSERT INTO eventoCalendario(nomeEvento, descEvento, dataCriacao, dataInicial, dataFinal, tipoEvento, numMatricula) ";
            sql += "VALUES (?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, calendario.getNomeEvento());
            ps.setString(2, calendario.getDescEvento());
            ps.setString(3, datahoraForm.format(dNow));
            ps.setString(4, calendario.getDataInicio());
            ps.setString(5, calendario.getDataFim());
            ps.setString(6, calendario.getTipoEvento());
            ps.setInt(7, numM);
            ps.execute();
            ps.close();
            con.close();
            status = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;

    }
}
