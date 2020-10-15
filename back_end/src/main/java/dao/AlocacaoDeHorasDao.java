package dao;

import static dao.PontoEletronicoDao.completeToLeft;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.TimeZone;
import javax.swing.JOptionPane;
import model.AlocacaoDeHorasModel;
import model.LoginModel;
import model.RegistraProjetoModel;

public class AlocacaoDeHorasDao {
    
    PontoEletronicoDao ptEletronico = new PontoEletronicoDao();
    
    public ArrayList<AlocacaoDeHorasModel> ListaAlocacaoHoras() throws ParseException {
        LoginModel login = new LoginModel();
        int numM = login.getNumMatricula();
        
        Connection con = Conexao.getConexao();
        ArrayList lista = new ArrayList();

       
            String sql = "SELECT projetos.idProjeto, descProjeto, statusProjeto, cargaTotalHr FROM espimalomeki.usuariosEmProjeto " +
            " inner join projetos on projetos.idProjeto = usuariosEmProjeto.idProjeto" +
            " where usuariosEmProjeto.numMatricula = ?";
         try { 
            PreparedStatement selectPs = con.prepareStatement(sql);
            selectPs.setInt(1, numM); 
            
            ResultSet rs = selectPs.executeQuery();
            int idProjeto;
            
            
            while (rs.next()) {
                AlocacaoDeHorasModel listaAlocacao = new AlocacaoDeHorasModel();
                idProjeto = rs.getInt("idProjeto");
                listaAlocacao.setIdProjeto(idProjeto);
                listaAlocacao.setNomeProjeto(rs.getString("descProjeto"));
                //totalHorasAlocadas(numM, idProjeto);
                listaAlocacao.setHorasFeitasProj(totalHorasAlocadas(numM, idProjeto,true));
                listaAlocacao.setStatusProjeto(rs.getString("statusProjeto"));
                listaAlocacao.setHrTotalProj(rs.getString("cargaTotalHr"));
                lista.add(listaAlocacao);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;
    }
    
    public String totalHorasAlocadas(int numM, int idProj, boolean projetoSelecionado) throws SQLException, ParseException{
        Connection con = Conexao.getConexao();
        PreparedStatement selectPs;
        
        if(projetoSelecionado){
            String sql = "select qtdHoras from alocacaoHoras where numMatricula = ? and idProjeto = ?";
            selectPs = con.prepareStatement(sql);
            selectPs.setInt(1, numM);           
            selectPs.setInt(2, idProj);
        }else{
            String sql = "select qtdHoras from alocacaoHoras where numMatricula = ?";
            selectPs = con.prepareStatement(sql);
            selectPs.setInt(1, numM);  
        }
                   
        ResultSet rs = selectPs.executeQuery();
        
        String dateTime;
        long diff = 0;
        
        while (rs.next()) {
            dateTime = rs.getString("qtdHoras");
            SimpleDateFormat formatoHr = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            formatoHr.setTimeZone(TimeZone.getTimeZone("UTC"));
            
            Date hrs = formatoHr.parse("1970-01-01 "+dateTime);
            diff += hrs.getTime(); 
            //JOptionPane.showMessageDialog(null,diff);

        }
        
        String seconds = (diff / 1000 % 60) + "";
        String minutes = (diff / (60 * 1000) % 60) + "";
        String hours = (diff / (60 * 60 * 1000)) + "";

        seconds = completeToLeft(seconds, '0', 2);
        minutes = completeToLeft(minutes, '0', 2);
        hours = completeToLeft(hours, '0', 2);

        String totalHoras = hours + ":" + minutes + ":" + seconds;
        
        return totalHoras;
    }
    
    public String totalHorasDisponiveis() throws SQLException, ParseException{
        LoginModel login = new LoginModel();
        int numM = login.getNumMatricula();
        
        String hrAlocadas = "1970-01-01 "+totalHorasAlocadas(numM, 0, false);
        String hrTrabalhadas = "1970-01-01 "+ptEletronico.getTotalHorasTrabalhadas(numM)+":00";
        
        String resul = ptEletronico.calculaHoraIntervalo(hrAlocadas,hrTrabalhadas);
        
        return resul;
    }
    
    public String alocaHoras(String qtdHoras, int idProj) throws SQLException, ParseException{
        LoginModel login = new LoginModel();
        int numM = login.getNumMatricula();
        String resul;
        
        String hrPermitidas = ptEletronico.calculaHoraIntervalo("1970-01-01 "+qtdHoras+":00" , "1970-01-01 "+totalHorasDisponiveis());
        
        if(hrPermitidas.indexOf("-") != -1){
            return "Hora colocada maior do que a disponivel";
        }
        
        Connection con = Conexao.getConexao();
        String selectSql = "INSERT INTO `espimalomeki`.`alocacaoHoras` (`numMatricula`, `idProjeto`, `qtdHoras`) VALUES (?, ?, ?)";
        
        try{
            
            PreparedStatement ps = con.prepareStatement(selectSql);
            ps.setInt(1, numM);
            ps.setInt(2, idProj);
            ps.setString(3, qtdHoras);
            ps.execute();
            ps.close();
            con.close();
            
        }catch(Exception e){
            return "Erro! Nada registrado!";
        }
        
        resul = "Alocacao de Horas em projeto de codigo "+idProj+" registrada(s)!";
        
        return resul;
        
    }
    
    
    

    
}
