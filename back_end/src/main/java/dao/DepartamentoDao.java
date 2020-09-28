package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.DepartamentoModel;

public class DepartamentoDao {

    public ArrayList listaDeptos() {

        Connection con = Conexao.getConexao();

        ArrayList lista = new ArrayList();
        try {
            Connection conn = Conexao.getConexao();

            String sql = "SELECT * FROM departamento";
            PreparedStatement selectPs = con.prepareStatement(sql);
            ResultSet rs = selectPs.executeQuery();

            while (rs.next()) {
                DepartamentoModel listaDeptos = new DepartamentoModel();
                listaDeptos.setCodDepto(rs.getInt("idDepto"));
                listaDeptos.setNomeDepto(rs.getString("nomeDepto"));
                lista.add(listaDeptos);
            }

            rs.close();
            conn.close();

            return lista;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;

    }

    public DepartamentoModel getDeptoUnico(int codDepto) {

        DepartamentoModel depto = new DepartamentoModel();

        Connection con = Conexao.getConexao();

        try {
            Connection conn = Conexao.getConexao();

            String sql = "SELECT * FROM departamento where idDepto = ?";
            PreparedStatement selectPs = con.prepareStatement(sql);
            ResultSet rs = selectPs.executeQuery();

            if (rs.next()) {
                depto.setCodDepto(rs.getInt("idDepto"));
                depto.setNomeDepto(rs.getString("nomeDepto"));
            }

            rs.close();
            conn.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return depto;

    }

    public boolean incluirDepartamento(DepartamentoModel depto) {
        boolean status = false;
        String sql = "insert into departamento(nomeDepto)values(?);";

        try {
            Connection conn = Conexao.getConexao();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, depto.getNomeDepto());

            System.out.println(ps);
            if (ps.executeUpdate() > 0) {
                ps.close();
                System.out.println("Deu certo o cadastro do depto");
                status = true;
            }
        } catch (SQLException e) {
            e.printStackTrace(System.err);
        }
        return status;
    }
    public boolean editaDepartamento(DepartamentoModel depto) {
        boolean status = false;
        String sql = "update departamento set nomeDepto = ? where idDepto = ?;";

        try {
            Connection conn = Conexao.getConexao();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, depto.getNomeDepto());
            ps.setInt(2, depto.getCodDepto());

            System.out.println(ps);
            if (ps.executeUpdate() > 0) {
                ps.close();
                System.out.println("Deu certo o editar do depto");
                status = true;
            }
        } catch (SQLException e) {
            e.printStackTrace(System.err);
        }
        return status;
    }

}
