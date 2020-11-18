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
import model.EventoUsuarioModel;
import model.LoginModel;

public class CalendarioDao {
    
    public ArrayList listaEventosTable(int numMatricula) {

        Connection con = Conexao.getConexao();

        ArrayList lista = new ArrayList();
        try {
            Connection conn = Conexao.getConexao();

            String sql = "SELECT U.idEvento, E.nomeEvento, E.descEvento, E.dataInicial, E.dataFinal, E.numMatricula " + 
                         "FROM usuariosEvento as U " +
                         "INNER JOIN eventoCalendario as E " +
                         "ON U.idEvento = E.idEvento " +
                         "WHERE U.numMatricula = ?";
                        
            PreparedStatement selectPs = con.prepareStatement(sql);
            selectPs.setInt(1, numMatricula);
            ResultSet rs = selectPs.executeQuery();

            while (rs.next()) {
                CalendarioDTO eventos = new CalendarioDTO();
                eventos.setId(rs.getInt("idEvento"));
                eventos.setTitle(rs.getString("nomeEvento"));
                eventos.setDesc(rs.getString("descEvento"));
                eventos.setStart(rs.getString("dataInicial"));
                eventos.setEnd(rs.getString("dataFinal"));
                
                if(rs.getInt("numMatricula") == numMatricula)
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
    
    public boolean insereEvento(CalendarioModel calendario, int numMatricula) {
        boolean status = false;

        Connection con = Conexao.getConexao();
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
            ps.setInt(7, numMatricula);
            ps.execute();
            ps.close();
            con.close();
            status = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;

    }
    public boolean associaEventoUsuario(int numMatricula, int idEvento) {
        boolean status = false;

        Connection con = Conexao.getConexao();

        try {
            String sql = "INSERT INTO usuariosEvento(numMatricula, idEvento) VALUES (?, ?)";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, numMatricula);
            ps.setInt(2, idEvento); 
            ps.execute();
            ps.close();
            con.close();
            status = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;

    }
    
    public int buscaId(String nome, int numMatricula){
        Connection conn = Conexao.getConexao();
        
        int idEvento = 0;
        try {
            String sql = "SELECT idEvento FROM eventoCalendario WHERE nomeEvento = ? and numMatricula = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1,nome);
            ps.setInt(2,numMatricula);
            ResultSet rs = ps.executeQuery();

            if(rs.next()) {
                idEvento = rs.getInt("idEvento");
            }

            rs.close();
            conn.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return idEvento;
        
    }
    public boolean editaEvento(CalendarioModel calendario) {
        boolean status = false;
        String sql = "update eventoCalendario set nomeEvento = ?, descEvento = ?, dataInicial = ?, dataFinal = ?, tipoEvento = ? where idEvento = ?";

        try {
            Connection con = Conexao.getConexao();
            
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, calendario.getNomeEvento());
            ps.setString(2, calendario.getDescEvento());
            ps.setString(3, calendario.getDataInicio());
            ps.setString(4, calendario.getDataFim());
            ps.setString(5, calendario.getTipoEvento());
            ps.setInt(6, calendario.getIdEvento());
            System.out.println(ps);
            if (ps.executeUpdate() > 0) {
                ps.close();
                System.out.println("Deu certo o editar do evento");
                status = true;
            }
        } catch (SQLException e) {
            e.printStackTrace(System.err);
        }
        return status;
    }
    public boolean excluiEvento(CalendarioModel calendario) {
        boolean status = false;
        String sql = "DELETE FROM usuariosEvento WHERE idEvento = ?";
        String sql2 = "DELETE FROM eventoCalendario WHERE idEvento = ?";
        try {
            Connection con = Conexao.getConexao();
            
            PreparedStatement ps = con.prepareStatement(sql);
            
            int id = calendario.getIdEvento();
            ps.setInt(1, id);
            
            
            if (ps.executeUpdate() > 0) {
                ps.close();
                PreparedStatement ps2 = con.prepareStatement(sql2);
                ps2.setInt(1, id);
                if(ps2.executeUpdate(sql2) > 0){
                    ps2.close();
                    status = true;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(System.err);
        }
        return status;
    }
    
}
