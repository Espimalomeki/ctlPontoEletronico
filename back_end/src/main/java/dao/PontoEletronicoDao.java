package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import javax.swing.JOptionPane;
import model.PontoEletronicoModel;

public class PontoEletronicoDao {
    
    Conexao conn = new Conexao();
    
    
    public static String sei() {
        String sql = "SELECT * FROM usuario";
        ArrayList lista = new ArrayList();
        try {            
            Connection conn = Conexao.getConexao();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                String numMatricula = rs.getString("numMatricula");
                
                System.err.println("Matricula: "+numMatricula);
            }
            ps.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
        
    }
    
    public String inserePonto(){
        String resp = "";
        
        try {
            int numM = 20860269;
            Date dNow = new Date( );
            //SimpleDateFormat ft = new SimpleDateFormat ("yyyy.MM.dd 'at' hh:mm:ss a zzz");
            SimpleDateFormat dataAtual = new SimpleDateFormat ("yyyy/MM/dd");
            SimpleDateFormat hrInicial = new SimpleDateFormat ("yyyy/MM/dd hh:mm:ss");
            
            Connection con = Conexao.getConexao();
            String selectSql = "SELECT * FROM pontoEletronico where dataDia = ? and numMatricula = ?";
            
            PreparedStatement selectPs = con.prepareStatement(selectSql);
            selectPs.setString(1, dataAtual.format(dNow));
            selectPs.setInt(2, numM);
            ResultSet resul = selectPs.executeQuery();
            
            if(resul.next()){
                Connection conecta = Conexao.getConexao();
                
                String hrIniIntervalo = resul.getString("horaInicioIntervalo");
                String hrFimIntervalo = resul.getString("horaFimIntervalo");
                String hrSaida = resul.getString("horaSaida");
                
                //resp = "inicio inter "+hrIniIntervalo+" \n hrFimIntervalo : "+hrFimIntervalo+" hr final"+hrSaida;
                //return resp;
                String updateSql = null;
                
                if(hrIniIntervalo == null){
                  updateSql = "UPDATE pontoEletronico SET horaInicioIntervalo = '" + hrInicial.format(dNow) + "' WHERE dataDia = '"+dataAtual.format(dNow)+"' and numMatricula = "+numM;     
                 System.out.println(updateSql);
                }else if(hrFimIntervalo == null){
                    updateSql = "UPDATE pontoEletronico SET horaFimIntervalo = '" + hrInicial.format(dNow) + "' WHERE dataDia = '"+dataAtual.format(dNow)+"' and numMatricula = "+numM;  
                    System.out.println(updateSql);
                }else if(hrSaida == null){
                    updateSql = "UPDATE pontoEletronico SET  horaSaida = '" + hrInicial.format(dNow) + "' WHERE dataDia = '"+dataAtual.format(dNow)+"' and numMatricula = "+numM;  
                    System.out.println(updateSql);
                }
                
                  PreparedStatement ts = conecta.prepareStatement(updateSql);
                  ts.executeUpdate(); //executeUpdate faz inserção no banco
                    ts.close();
                    conecta.close();
                    return "deu certo";
                    

//                try (PreparedStatement ps = con.prepareStatement(updateSql)) {
//                    ps.executeUpdate(); //executeUpdate faz inserção no banco
//                    ps.close();
//                    con.close();
//                } catch (SQLException e) {;
//                    JOptionPane.showMessageDialog(null, "Erro ao Atualizar informações no banco");
//                }
                
            }else{
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
                ps.setBoolean(8, false);
                ps.execute();
                ps.close();
                con.close();
            }    
            
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Erro!!! \n Nada Inserido"+e , "Erro", JOptionPane.ERROR_MESSAGE);
        }
        return null;
        
    }
    
}

    

