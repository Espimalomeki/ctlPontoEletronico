package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.LoginModel;

public class LoginDao {
     Conexao conn = new Conexao();
    
     public boolean validate(LoginModel login) {
            boolean status = false;
            String sql = "SELECT U.numMatricula, U.senha, U.permissao, F.nome, F.idDepto, D.nomeDepto " +
                         "FROM usuario as U " +
                         "INNER JOIN funcionario as F ON U.numMatricula = F.numMatricula " +
                         "INNER JOIN departamento as D ON F.idDepto = D.idDepto " +
                         "WHERE U.numMatricula = ? and U.senha = MD5(?)";
        
        try {            
            Connection conn = Conexao.getConexao();
            PreparedStatement ps = conn.prepareStatement(sql);
            
            ps.setInt(1, login.getNumMatricula());
            ps.setString(2, login.getSenha());

            ResultSet rs = ps.executeQuery();
          
           if (rs.next()) {
                    login.setPermissao(rs.getString("permissao"));
                    login.setNome(rs.getString("nome"));
                    login.setCodDepto(rs.getInt("idDepto"));
                    login.setNomeDepto(rs.getString("nomeDepto"));
                    status = true;
           }
           ps.close();
           
           } catch (SQLException e) {
               e.printStackTrace(System.err);
        }
        return status;
     }
}
