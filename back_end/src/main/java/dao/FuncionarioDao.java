package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import model.FuncionarioModel;
import model.PontoEletronicoModel;

public class FuncionarioDao {
    public static ArrayList selectFuncionario() {
        int numM = 20860269;
        String sql = "SELECT * FROM funcionario where numMatricula = ?";
        
        Date dNow = new Date( );
        Connection con = Conexao.getConexao();
        //SimpleDateFormat ft = new SimpleDateFormat ("yyyy.MM.dd 'at' hh:mm:ss a zzz");
        SimpleDateFormat dataAtual = new SimpleDateFormat ("yyyy/MM/dd");
        SimpleDateFormat hrInicial = new SimpleDateFormat ("yyyy/MM/dd hh:mm:ss");
        
        
        //ResultSet resul = selectPs.executeQuery();
        
        ArrayList lista = new ArrayList();
        try {            
            Connection conn = Conexao.getConexao();
          
            PreparedStatement selectPs = con.prepareStatement(sql);
            selectPs.setInt(1, numM);
            //selectPs.setInt(1, numM);           
            ResultSet rs = selectPs.executeQuery();
            
            //PreparedStatement ps = conn.prepareStatement(sql);
            
            while(rs.next()){
                FuncionarioModel listaPontos = new FuncionarioModel();
                listaPontos.setNumMatricula(rs.getInt("numMatricula"));
                listaPontos.setNome(rs.getString("dataDia"));
                listaPontos.setCpf(rs.getString("horaEntrada"));
                listaPontos.setEmail(rs.getString("horaSaida"));
                listaPontos.setDataNascimento(rs.getString("dataNascimento"));
                listaPontos.setDataAdmissao(rs.getString("dataAdmissao"));
                listaPontos.setDataRecisao(rs.getString("dataRecisao"));
                listaPontos.setCargo(rs.getString("homeOffice"));
                listaPontos.set(rs.getString("homeOffice"));
                listaPontos.setHomeOffice(rs.getString("homeOffice"));
                listaPontos.setHomeOffice(rs.getString("homeOffice"));
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
}
