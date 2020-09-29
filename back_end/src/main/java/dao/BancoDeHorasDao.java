package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import model.BancoDeHorasModel;
import model.LoginModel;
import model.PontoEletronicoModel;

public class BancoDeHorasDao {
    
    public ArrayList listaItens() {
        //Conexao conn = new Conexao();
 
        LoginModel login = new LoginModel();
        int numM = login.getNumMatricula();
        Date dNow = new Date( );
        Connection con = Conexao.getConexao();
        //SimpleDateFormat ft = new SimpleDateFormat ("yyyy.MM.dd 'at' hh:mm:ss a zzz");
        SimpleDateFormat dataAtual = new SimpleDateFormat ("yyyy/MM/dd");
        SimpleDateFormat hrInicial = new SimpleDateFormat ("yyyy/MM/dd hh:mm:ss");
        
        
        //ResultSet resul = selectPs.executeQuery();
        
        ArrayList lista = new ArrayList();
        try {            
            Connection conn = Conexao.getConexao();
            
            String sql = "SELECT * FROM bancoDeHoras where numMatricula = ?";
            PreparedStatement selectPs = con.prepareStatement(sql);
            //selectPs.setString(1, dataAtua0l.format(dNow));
            selectPs.setInt(1, numM);           
            ResultSet rs = selectPs.executeQuery();
            
            //PreparedStatement ps = conn.prepareStatement(sql);
            
            while(rs.next()){
                BancoDeHorasModel listaItens = new BancoDeHorasModel();
                listaItens.setNumMatricula(rs.getInt("numMatricula"));
                listaItens.setDataInicial(rs.getString("dataInicial"));
                listaItens.setDataFinal(rs.getString("dataFinal"));
//                listaItens.setHoraSaida(rs.getString("horaSaida"));
//                listaItens.setHoraInicioIntervalo(rs.getString("horaInicioIntervalo"));
//                listaItens.setHoraFimIntervalo(rs.getString("horaFimIntervalo"));
//                listaItens.setMotivoAjuste(rs.getString("motivoAjuste"));
//                listaItens.setHomeOffice(rs.getString("homeOffice"));
                lista.add(listaItens);
            }
            
            rs.close();
            conn.close();
            
            return lista;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;
        
    }
    
}
