package dao;

import java.awt.event.FocusEvent;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.concurrent.TimeUnit;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;
import model.LoginModel;
import model.PontoEletronicoModel;
import sun.awt.KeyboardFocusManagerPeerImpl;

public class PontoEletronicoDao {

    Conexao conn = new Conexao();

    public ArrayList pontoDeHoje() {
        LoginModel login = new LoginModel();

        int numM = login.getNumMatricula();

        Date dNow = new Date();
        Connection con = Conexao.getConexao();
        //SimpleDateFormat ft = new SimpleDateFormat ("yyyy.MM.dd 'at' hh:mm:ss a zzz");
        SimpleDateFormat dataAtual = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat hrInicial = new SimpleDateFormat("yyyy/MM/dd hh:mm:ss");

        //ResultSet resul = selectPs.executeQuery();
        ArrayList lista = new ArrayList();
        try {
            Connection conn = Conexao.getConexao();

            String sql = "SELECT * FROM pontoEletronico where numMatricula = ? and dataDia = ?";
            
            PreparedStatement selectPs = con.prepareStatement(sql);
            selectPs.setInt(1, numM);
            selectPs.setString(2, dataAtual.format(dNow));
            
            //JOptionPane.showMessageDialog(null, dataAtual.format(dNow));
            
            ResultSet rs = selectPs.executeQuery();

            //PreparedStatement ps = conn.prepareStatement(sql);
            while (rs.next()) {
                PontoEletronicoModel listaPontos = new PontoEletronicoModel();
                listaPontos.setNumMatricula(rs.getInt("numMatricula"));
                listaPontos.setDataDia(rs.getString("dataDia"));
                listaPontos.setHoraEntrada(rs.getString("horaEntrada"));
                listaPontos.setHoraSaida(rs.getString("horaSaida"));
                listaPontos.setHoraInicioIntervalo(rs.getString("horaInicioIntervalo"));
                listaPontos.setHoraFimIntervalo(rs.getString("horaFimIntervalo"));
                listaPontos.setMotivoAjuste(rs.getString("motivoAjuste"));
                listaPontos.setHomeOffice(rs.getString("homeOffice"));
                lista.add(listaPontos);
            }

            rs.close();
            conn.close();

            return lista;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;

    }

    public ArrayList listaPontos() {

        LoginModel login = new LoginModel();
        int numM = login.getNumMatricula();
        Date dNow = new Date();
        Connection con = Conexao.getConexao();
        //SimpleDateFormat ft = new SimpleDateFormat ("yyyy.MM.dd 'at' hh:mm:ss a zzz");
        SimpleDateFormat dataAtual = new SimpleDateFormat("yyyy/MM/dd");
        SimpleDateFormat hrInicial = new SimpleDateFormat("yyyy/MM/dd hh:mm:ss");

        //ResultSet resul = selectPs.executeQuery();
        ArrayList lista = new ArrayList();
        try {
            Connection conn = Conexao.getConexao();

            String sql = "SELECT * FROM pontoEletronico where numMatricula = ? order by dataDia desc LIMIT 5";
            PreparedStatement selectPs = con.prepareStatement(sql);
            //selectPs.setString(1, dataAtua0l.format(dNow));
            selectPs.setInt(1, numM);
            ResultSet rs = selectPs.executeQuery();
            
            String vHoraSaida = "";
            String vHoraIniInterval = "";
            String vHoraFimInterval = "";
            String vHomeOffice = "";
            String vAjuste = "";
            
            //PreparedStatement ps = conn.prepareStatement(sql);
            while (rs.next()) {
                vHoraSaida = rs.getString("horaSaida");
                vHoraIniInterval = rs.getString("horaInicioIntervalo");
                vHoraFimInterval = rs.getString("horaFimIntervalo");
                vHomeOffice = rs.getString("homeOffice");
                vAjuste = rs.getString("motivoAjuste");
                
                PontoEletronicoModel listaPontos = new PontoEletronicoModel();
                listaPontos.setNumMatricula(rs.getInt("numMatricula"));
                listaPontos.setDataDia(rs.getString("dataDia"));
                listaPontos.setHoraEntrada(rs.getString("horaEntrada"));
                if (vHoraSaida == null) {
                    listaPontos.setHoraSaida(" ");
                }else{
                    listaPontos.setHoraSaida(vHoraSaida);
                }
                if(vHoraIniInterval == null){
                    listaPontos.setHoraInicioIntervalo(" ");
                }else{
                    listaPontos.setHoraInicioIntervalo(vHoraIniInterval);
                }
                if(vHoraFimInterval == null){
                    listaPontos.setHoraFimIntervalo(" ");
                }else{
                    listaPontos.setHoraFimIntervalo(vHoraFimInterval);
                }
                
                if(vAjuste == null){
                    listaPontos.setMotivoAjuste(" ");
                }else{
                    listaPontos.setMotivoAjuste(vAjuste);
                }
                //JOptionPane.showMessageDialog(null," ---> "+vHomeOffice+" ");
                if(vHomeOffice == null){
                    listaPontos.setHomeOffice("Não");
                }else{
                    if(vHomeOffice.equals("0")){
                        listaPontos.setHomeOffice("Não");
                        //JOptionPane.showMessageDialog(null, vHomeOffice);
                    }else if(vHomeOffice.equals("1")){
                        listaPontos.setHomeOffice("Sim");
                    }
                }
                
                lista.add(listaPontos);
            }
            
            //;
            rs.close();
            conn.close();

            return lista;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;

    }

    public ArrayList listaHorario(){

        LoginModel login = new LoginModel();
        int numM = login.getNumMatricula();
        Date dNow = new Date();
        Connection con = Conexao.getConexao();
        //SimpleDateFormat ft = new SimpleDateFormat ("yyyy.MM.dd 'at' hh:mm:ss a zzz");
        SimpleDateFormat dataAtual = new SimpleDateFormat("yyyy/MM/dd");
        SimpleDateFormat hrInicial = new SimpleDateFormat("yyyy/MM/dd hh:mm:ss");

        //ResultSet resul = selectPs.executeQuery();
        ArrayList lista = new ArrayList();
        try {
            Connection conn = Conexao.getConexao();

            String sql = "SELECT * FROM pontoEletronico where numMatricula = ?";
            PreparedStatement selectPs = con.prepareStatement(sql);
            //selectPs.setString(1, dataAtua0l.format(dNow));
            selectPs.setInt(1, numM);
            ResultSet rs = selectPs.executeQuery();

            //PreparedStatement ps = conn.prepareStatement(sql);
            String vHoraEntrada;
            String vHoraSaida;
            boolean existeHoras;

            while (rs.next()) {
                existeHoras = true;
                vHoraEntrada = rs.getString("horaEntrada");
                vHoraSaida = rs.getString("horaSaida");

                PontoEletronicoModel listaPontos = new PontoEletronicoModel();
                listaPontos.setNumMatricula(rs.getInt("numMatricula"));
                if (vHoraEntrada == null) {
                    listaPontos.setHoraEntrada(" ");
                    existeHoras = false;
                } else {
                    listaPontos.setHoraEntrada(vHoraEntrada);
                }
                //listaPontos.printType(vHoraSaida);

                if (vHoraSaida == null) {
                    listaPontos.setHoraSaida(" ");
                    existeHoras = false;
                } else {
                    listaPontos.setHoraSaida(vHoraSaida);
                }

                try {
                    listaPontos.setQtdHorasTrabalhadas(calculaTotalDeHoras(vHoraEntrada, vHoraSaida, existeHoras));
                } catch (ParseException ex) {
                    Logger.getLogger(PontoEletronicoDao.class.getName()).log(Level.SEVERE, null, ex);
                }

                lista.add(listaPontos);
            }

            rs.close();
            conn.close();

            return lista;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;

    }

    public String inserePonto(boolean homeOffice) {
        String resp = "";

        try {
            LoginModel login = new LoginModel();
            int numM = login.getNumMatricula();
            Date dNow = new Date();
            //SimpleDateFormat ft = new SimpleDateFormat ("yyyy.MM.dd 'at' hh:mm:ss a zzz");
            SimpleDateFormat dataAtual = new SimpleDateFormat("yyyy/MM/dd");
            SimpleDateFormat hrInicial = new SimpleDateFormat("yyyy/MM/dd hh:mm:ss");

            Connection con = Conexao.getConexao();
            String selectSql = "SELECT * FROM pontoEletronico where dataDia = ? and numMatricula = ?";

            PreparedStatement selectPs = con.prepareStatement(selectSql);
            selectPs.setString(1, dataAtual.format(dNow));
            selectPs.setInt(2, numM);
            ResultSet resul = selectPs.executeQuery();

            if (resul.next()) {
                Connection conecta = Conexao.getConexao();

                String hrIniIntervalo = resul.getString("horaInicioIntervalo");
                String hrFimIntervalo = resul.getString("horaFimIntervalo");
                String hrSaida = resul.getString("horaSaida");

                String updateSql = null;

                if (hrIniIntervalo == null) {
                    updateSql = "UPDATE pontoEletronico SET horaInicioIntervalo = '" + hrInicial.format(dNow) + "' WHERE dataDia = '" + dataAtual.format(dNow) + "' and numMatricula = " + numM;
                    System.out.println(updateSql);
                } else if (hrFimIntervalo == null) {
                    updateSql = "UPDATE pontoEletronico SET horaFimIntervalo = '" + hrInicial.format(dNow) + "' WHERE dataDia = '" + dataAtual.format(dNow) + "' and numMatricula = " + numM;
                    System.out.println(updateSql);
                } else if (hrSaida == null) {
                    updateSql = "UPDATE pontoEletronico SET  horaSaida = '" + hrInicial.format(dNow) + "' WHERE dataDia = '" + dataAtual.format(dNow) + "' and numMatricula = " + numM;
                    System.out.println(updateSql);
                } else {
                    conecta.close();
                    return null;
                }

                PreparedStatement ts = conecta.prepareStatement(updateSql);
                ts.executeUpdate(); //executeUpdate faz inserção no banco
                ts.close();
                conecta.close();
                return "deu certo";

            } else {
                if (!homeOffice) {
                    homeOffice = false;
                }

                String sql = "INSERT INTO pontoEletronico(dataDia, numMatricula, horaEntrada, horaSaida, horaInicioIntervalo, horaFimIntervalo, motivoAjuste, homeOffice)";
                sql += "VALUES (?, ?, ?, ?, ?, ? , ?, ?)";

                PreparedStatement ps = con.prepareStatement(sql);
                ps.setString(1, dataAtual.format(dNow));
                ps.setInt(2, numM);
                ps.setString(3, hrInicial.format(dNow));
                ps.setString(4, null);
                ps.setString(5, null);
                ps.setString(6, null);
                ps.setString(7, null);
                ps.setBoolean(8, homeOffice);
                ps.execute();
                ps.close();
                con.close();
            }

        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Erro!!! \n Nada Inserido" + e, "Erro", JOptionPane.ERROR_MESSAGE);
        }
        return null;

    }

    public int getTotalHorasTrabalhadas() throws ParseException {
        LoginModel login = new LoginModel();
        int numM = login.getNumMatricula();
        Connection con = Conexao.getConexao();
        
        try {
            Connection conn = Conexao.getConexao();

            String sql = "SELECT * FROM pontoEletronico where numMatricula = ?";
            PreparedStatement selectPs = con.prepareStatement(sql);
            selectPs.setInt(1, numM);
            //selectPs.setInt(1, 20860269);
            ResultSet rs = selectPs.executeQuery();

            String vHoraEntrada;
            String vHoraSaida;
            boolean existeHoras;
            int hrTrabalhadas = 0;
            
            while (rs.next()) {
                existeHoras = true;
                vHoraEntrada = rs.getString("horaEntrada");
                vHoraSaida = rs.getString("horaSaida");

                PontoEletronicoModel listaPontos = new PontoEletronicoModel();
                listaPontos.setNumMatricula(rs.getInt("numMatricula"));
                if (vHoraEntrada == null){
                    existeHoras = false;
                }

                if (vHoraSaida == null) {
                    existeHoras = false;
                }

                //////////////
                if (existeHoras) {
                    SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                    SimpleDateFormat formatoHr = new SimpleDateFormat("HH:mm:ss");
                    Date hr1 = formato.parse(vHoraEntrada);
                    Date hr2 = formato.parse(vHoraSaida);
                    
                    long diff = hr2.getTime() - hr1.getTime();          
                    long hours = (diff / (60 * 60 * 1000));
                    hrTrabalhadas += hours;
                } 
            }

            rs.close();
            conn.close();

            return hrTrabalhadas;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public String calculaTotalDeHoras(String h1, String h2, boolean existeHora) throws ParseException {

        if (existeHora) {
            SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            SimpleDateFormat formatoHr = new SimpleDateFormat("HH:mm:ss");
            Date hr1 = formato.parse(h1);
            Date hr2 = formato.parse(h2);

            long diff = hr2.getTime() - hr1.getTime();

            String seconds = (diff / 1000 % 60) + "";
            String minutes = (diff / (60 * 1000) % 60) + "";
            String hours = (diff / (60 * 60 * 1000)) + "";

            seconds = completeToLeft(seconds, '0', 2);
            minutes = completeToLeft(minutes, '0', 2);
            hours = completeToLeft(hours, '0', 2);

            String totalHoras = hours + ":" + minutes + ":" + seconds;

            Date horasTrabalhadas = formatoHr.parse(totalHoras);
            long hrRes = horasTrabalhadas.getTime();
            String res = "";

            //String res = "<div style='color:green;'>"+hours+":"+minutes+":"+seconds+"</div>";
            //resHrTimeUnit
            if (TimeUnit.MILLISECONDS.toHours(hrRes) > 8) {
                res = "<div style='color:green;'>" + totalHoras + "</div>";
            } else {
                res = "<div style='color:red;'>" + totalHoras + "</div>";
            }
            return res;
        } else {
            return " ";
        }

    }

    public static String completeToLeft(String value, char c, int size) {
        String result = value;
        while (result.length() < size) {
            result = c + result;
        }
        return result;
    }


}
