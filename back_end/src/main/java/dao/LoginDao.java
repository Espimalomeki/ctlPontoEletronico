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
            String sql = "SELECT U.numMatricula, U.senha, U.permissao, F.nome " +
                         "FROM usuario as U " +
                         "INNER JOIN funcionario as F " +
                         "ON U.numMatricula = F.numMatricula " +
                         "WHERE U.numMatricula = ? and U.senha = ?";
        
        try {            
            Connection conn = Conexao.getConexao();
            PreparedStatement ps = conn.prepareStatement(sql);
            
            ps.setInt(1, LoginModel.getNumMatricula());
            ps.setString(2, LoginModel.getSenha());

            System.out.println(ps);
            ResultSet rs = ps.executeQuery();
            System.out.println("passou por aqui");
          
           if (rs.next()) {
                    LoginModel.setPermissao(rs.getString("permissao"));
                    LoginModel.setNome(rs.getString("nome"));
                    status = true;
           }
           ps.close();
           
           } catch (SQLException e) {
               e.printStackTrace(System.err);
        }
        return status;
     }
}
