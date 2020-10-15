package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.FuncionarioModel;
import model.LoginModel;
import model.RelatorioFuncionarioSelecionadoModel;
import util.GeraSenha;

public class FuncionarioDao {

    Conexao conn = new Conexao();

    public boolean incluirFuncionario(FuncionarioModel func) {
        boolean status = false;
        String sql = "insert into funcionario(nome,cpf,rne,email,dataNascimento,"
                + "telefone,contaBancaria,endereco,complemento,dataAdmissao,cargo,"
                + "cargaHoraria,salario,genero,permissao,idDepto)values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);";

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
            ps.setInt(16, func.getCodDepto());
            
            System.out.println(ps);
            if (ps.executeUpdate() > 0) {
                ps.close();
                System.out.println("Deu certo o cadastro do funcionario");
                if (incluirUsuario(func)) {
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

    public FuncionarioModel retornaFuncionario() {
        FuncionarioModel func = new FuncionarioModel();
        String sql = "select * from funcionario where numMatricula = ?";

        try {
            Connection conn = Conexao.getConexao();
            PreparedStatement ps = conn.prepareStatement(sql);
            LoginModel login = new LoginModel();
            int numM = login.getNumMatricula();
            ps.setInt(1, numM);

            System.out.println(ps);
            ResultSet rs = ps.executeQuery();
            System.out.println("passou por aqui");

            if (rs.next()) {
                func.setPermissao(rs.getString("permissao"));
                func.setNome(rs.getString("nome"));
                func.setCpf(rs.getString("cpf"));
                func.setRne(rs.getString("rne"));
                func.setCargo(rs.getString("cargo"));
                func.setEmail(rs.getString("email"));
                func.setDataNasc(rs.getString("dataNascimento"));
                func.setTelefone(rs.getString("telefone"));
                func.setContaBancaria(rs.getString("contaBancaria"));
                func.setEndereco(rs.getString("endereco"));
                func.setComplemento(rs.getString("complemento"));
                func.setDataAdmissao(rs.getString("dataAdmissao"));
                func.setCargaHoraria(rs.getString("cargaHoraria"));
                func.setSalario(rs.getString("salario"));
                func.setGenero(rs.getString("genero"));
                func.setNumMatricula(Integer.parseInt(rs.getString("numMatricula")));
                System.out.println(login.getPermissao());
            }
            ps.close();

        } catch (SQLException e) {
            e.printStackTrace(System.err);
        }
        return func;
    }

    public FuncionarioModel retornaFuncionario(int numMatricula) {
        FuncionarioModel func = new FuncionarioModel();
        String sql = "select * from funcionario where numMatricula = ?";

        try {
            Connection conn = Conexao.getConexao();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, numMatricula);

            System.out.println(ps);
            ResultSet rs = ps.executeQuery();
            System.out.println("passou por aqui");

            if (rs.next()) {
                func.setPermissao(rs.getString("permissao"));
                func.setNome(rs.getString("nome"));
                func.setCpf(rs.getString("cpf"));
                func.setRne(rs.getString("rne"));
                func.setCargo(rs.getString("cargo"));
                func.setEmail(rs.getString("email"));
                func.setDataNasc(rs.getString("dataNascimento"));
                func.setTelefone(rs.getString("telefone"));
                func.setContaBancaria(rs.getString("contaBancaria"));
                func.setEndereco(rs.getString("endereco"));
                func.setComplemento(rs.getString("complemento"));
                func.setDataAdmissao(rs.getString("dataAdmissao"));
                func.setCargaHoraria(rs.getString("cargaHoraria"));
                func.setSalario(rs.getString("salario"));
                func.setGenero(rs.getString("genero"));
                func.setNumMatricula(Integer.parseInt(rs.getString("numMatricula")));
                func.setCodDepto(Integer.parseInt(rs.getString("idDepto")));
            }
            ps.close();

        } catch (SQLException e) {
            e.printStackTrace(System.err);
        }
        return func;
    }
    
    public RelatorioFuncionarioSelecionadoModel retornaFuncionarioSelecionado(String numMFunc) {
        RelatorioFuncionarioSelecionadoModel func = new RelatorioFuncionarioSelecionadoModel();
        String sql = "select * from funcionario where numMatricula = ?";

        try {
            Connection conn = Conexao.getConexao();
            PreparedStatement ps = conn.prepareStatement(sql);
            //LoginModel login = new LoginModel();
            int numM = Integer.parseInt(numMFunc);
            ps.setInt(1, numM);

            System.out.println(ps);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                func.setPermissao(rs.getString("permissao"));
                func.setNome(rs.getString("nome"));
                func.setCpf(rs.getString("cpf"));
                func.setRne(rs.getString("rne"));
                func.setCargo(rs.getString("cargo"));
                func.setEmail(rs.getString("email"));
                func.setDataNasc(rs.getString("dataNascimento"));
                func.setTelefone(rs.getString("telefone"));
                func.setContaBancaria(rs.getString("contaBancaria"));
                func.setEndereco(rs.getString("endereco"));
                func.setComplemento(rs.getString("complemento"));
                func.setDataAdmissao(rs.getString("dataAdmissao"));
                func.setCargaHoraria(rs.getString("cargaHoraria"));
                func.setSalario(rs.getString("salario"));
                func.setGenero(rs.getString("genero"));
                func.setNumMatricula(Integer.parseInt(rs.getString("numMatricula")));
            }
            ps.close();

        } catch (SQLException e) {
            e.printStackTrace(System.err);
        }
        return func;
    }

    public ArrayList<FuncionarioModel> listaFuncDepto() {

        Connection con = Conexao.getConexao();
        ArrayList<FuncionarioModel> lista = new ArrayList();

        try {
            
            Connection conn = Conexao.getConexao();
            String sql = "select * from funcionario where idDepto = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            
            LoginModel login = new LoginModel();
            int idDepartamento = login.getCodDepto();
            ps.setInt(1, idDepartamento);
            
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                FuncionarioModel listaFunc = new FuncionarioModel();
                listaFunc.setNumMatricula(rs.getInt("numMatricula"));
                listaFunc.setNome(rs.getString("nome"));
                listaFunc.setCargo(rs.getString("cargo"));
                listaFunc.setEmail(rs.getString("email"));
                lista.add(listaFunc);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;
    }
    
    public ArrayList<FuncionarioModel> listaGeralFunc() {

        Connection con = Conexao.getConexao();
        ArrayList<FuncionarioModel> lista = new ArrayList();

        try {
            
            Connection conn = Conexao.getConexao();
            String sql = "select * from funcionario";
            PreparedStatement ps = con.prepareStatement(sql);
            
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                FuncionarioModel listaFunc = new FuncionarioModel();
                listaFunc.setNumMatricula(rs.getInt("numMatricula"));
                listaFunc.setNome(rs.getString("nome"));
                listaFunc.setCargo(rs.getString("cargo"));
                listaFunc.setEmail(rs.getString("email"));
                lista.add(listaFunc);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;
    }

     public boolean atualizarUsuario(FuncionarioModel func) {
        boolean status = false;
        String sql = "select numMatricula, permissao from funcionario where cpf = ?";
        String sql2 = "update usuario set permissao = ? where numMatricula = ?";

        try {
            Connection conn = Conexao.getConexao();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, func.getCpf());

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                String matricula = rs.getString("numMatricula");
                String permissao = rs.getString("permissao");

                PreparedStatement ps2 = conn.prepareStatement(sql2);
                ps2.setString(1, permissao);
                ps2.setString(2, matricula);

                if (ps2.executeUpdate() > 0) {
                    System.out.println("Deu certo a Atualizacao de usuario");
                    status = true;
                }
            }

            ps.close();

        } catch (SQLException e) {
            e.printStackTrace(System.err);
        }

        return status;
    }
    public boolean editaFuncionario(FuncionarioModel func){
        boolean status = false;
        String sql;
        sql = "update funcionario set "
                + "nome = ?,"
                + "cpf = ?,"
                + "rne = ?,"
                + "email = ?,"
                + "dataNascimento = ?,"
                + "telefone = ?,"
                + "contaBancaria = ?,"
                + "endereco = ?,"
                + "complemento = ?,"
                + "dataAdmissao = ?,"
                + "cargo = ?,"
                + "cargaHoraria = ?,"
                + "salario = ?,"
                + "genero = ?,"
                + "permissao = ?,"
                + "idDepto = ? "
                + "where numMatricula = ?";

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
            ps.setInt(16, func.getCodDepto());
            ps.setInt(17,func.getNumMatricula());
            
            System.out.println(ps);
            if (ps.executeUpdate() > 0) {
                ps.close();
                System.out.println("Funcionário Atualizado com sucesso");
                if (atualizarUsuario(func)) {
                    status = true;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(System.err);
        }
        return status;
    } 
    
}
