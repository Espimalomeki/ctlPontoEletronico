
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import model.AlteraSenhaModel;

public class SenhaDao {
    
    public boolean editaSenha(AlteraSenhaModel senha) {
        boolean status = false;
        String sql = "UPDATE usuario set senha = MD5(?) WHERE numMatricula = ?;";

        try {
            Connection conn = Conexao.getConexao();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, senha.getSenha());
            ps.setInt(2, senha.getNumMatricula());

            System.out.println(ps);
            if (ps.executeUpdate() > 0) {
                ps.close();
                System.out.println("Deu certo a alteração da senha");
                status = true;
            }
        } catch (SQLException e) {
            
            e.printStackTrace(System.err);
        }
        return status;
    }
}
