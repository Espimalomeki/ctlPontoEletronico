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
            
            ps.setInt(1, login.getNumMatricula());
            ps.setString(2, login.getSenha());

            System.out.println(ps);
            ResultSet rs = ps.executeQuery();
            System.out.println("passou por aqui");
          
           if (rs.next()) {
                    login.setPermissao(rs.getString("permissao"));
                    login.setNome(rs.getString("nome"));
                    System.out.println(login.getPermissao());
                    status = true;
           }
           ps.close();
           
           } catch (SQLException e) {
               e.printStackTrace(System.err);
        }
        return status;
     }
}
