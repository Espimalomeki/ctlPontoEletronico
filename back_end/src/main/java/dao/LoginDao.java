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
                         "WHERE U.numMatricula = ? and U.senha = ?";
        
        try {            
            Connection conn = Conexao.getConexao();
            PreparedStatement ps = conn.prepareStatement(sql);
            
            ps.setInt(1, LoginModel.getNumMatricula());
            ps.setString(2, LoginModel.getSenha());

            ResultSet rs = ps.executeQuery();
          
           if (rs.next()) {
                    LoginModel.setPermissao(rs.getString("permissao"));
                    LoginModel.setNome(rs.getString("nome"));
                    LoginModel.setCodDepto(rs.getInt("idDepto"));
                    LoginModel.setNomeDepto(rs.getString("nomeDepto"));
                    status = true;
           }
           ps.close();
           
           } catch (SQLException e) {
               e.printStackTrace(System.err);
        }
        return status;
     }
}
