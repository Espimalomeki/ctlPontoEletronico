package dao;

import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.FuncionarioModel;
import model.LoginModel;
import util.GeraSenha;

public class FuncionarioDao {

    Conexao conn = new Conexao();

    public boolean incluirFuncionario(FuncionarioModel func) {
        boolean status = false;
        String sql = "insert into funcionario(nome,cpf,rne,email,dataNascimento,"
                + "telefone,contaBancaria,endereco,complemento,dataAdmissao,cargo,"
                + "cargaHoraria,salario,genero,permissao)values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);";

        try {
            Connection conn = Conexao.getConexao();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, func.getNome());
            ps.setString(2, func.getCpf());
            ps.setString(3, func.getRne());
            ps.setString(4, func.getEmail());
            ps.setString(5, func.getDataNasc());
            ps.setString(6, func.getTelefone());
            ps.setString(7, func.getContaBancaria());
            ps.setString(8, func.getEndereco());
            ps.setString(9, func.getComplemento());
            ps.setString(10, func.getDataAdmissao());
            ps.setString(11, func.getCargo());
            ps.setString(12, func.getCargaHoraria());
            ps.setString(13, func.getSalario());
            ps.setString(14, func.getGenero());
            ps.setString(15, func.getPermissao());

            System.out.println(ps);
            if (ps.executeUpdate() > 0) {
                ps.close();
                System.out.println("Deu certo o cadastro do funcionario");
                if(incluirUsuario(func)){
                status = true;    
                }                
            }
        } catch (SQLException e) {
            e.printStackTrace(System.err);
        }
        return status;
    }

    public boolean incluirUsuario(FuncionarioModel func) {
        boolean status = false;
        String sql = "select numMatricula, permissao from funcionario where cpf = ?";
        String sql2 = "insert into usuario(numMatricula, senha, permissao)values(?,?,?);";

        try {
            Connection conn = Conexao.getConexao();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, func.getCpf());

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                String matricula = rs.getString("numMatricula");
                String permissao = rs.getString("permissao");

                PreparedStatement ps2 = conn.prepareStatement(sql2);
                ps2.setString(1, matricula);
                ps2.setString(2, GeraSenha.gerarSenhaAleatoria());
                ps2.setString(3, permissao);
                
                if (ps2.executeUpdate() > 0) {
                System.out.println("Deu certo o cadastro de usuario");
                status = true;
                }  
            }

            ps.close();

        } catch (SQLException e) {
            e.printStackTrace(System.err);
        }

        return status;
    }

}
