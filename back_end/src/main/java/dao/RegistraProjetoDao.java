package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JOptionPane;
import model.RegistraProjetoModel;

public class RegistraProjetoDao {

    Conexao conn = new Conexao();

    public boolean incluirProjeto(RegistraProjetoModel proj) {
        boolean status = false;
        String sql = "insert into projetos(descProjeto,cargaTotalHr,statusProjeto)values(?,?,?);";

        try {
            Connection conn = Conexao.getConexao();
            PreparedStatement ps = conn.prepareStatement(sql);
            
            ps.setString(1, proj.getDescProjeto());
            ps.setString(2, proj.getCargaTotalHr());
            ps.setString(3, proj.getStatusProjeto());
            
            System.out.println(ps);
            if (ps.executeUpdate() > 0) {
                ps.close();
                System.out.println("Deu certo o cadastro do projeto");
                status = true;
            }
        } catch (SQLException e) {
            e.printStackTrace(System.err);
        }
        return status;
      
    }  
        
      
       public ArrayList <RegistraProjetoModel> ListaProjeto() {
            RegistraProjetoModel model = new RegistraProjetoModel();
            int idProj = model.getIdProjeto();
            Connection con = Conexao.getConexao();
            ArrayList lista = new ArrayList();
            
        try {    
            Connection conn = Conexao.getConexao();
            String sql = "select * from projetos";
            PreparedStatement selectPs = con.prepareStatement(sql);
//            selectPs.setInt(1, idProj);           
            ResultSet rs = selectPs.executeQuery();
            
            while(rs.next()){
            RegistraProjetoModel listaPontos = new RegistraProjetoModel();
            listaPontos.setIdProjeto(rs.getInt("idProjeto"));
            listaPontos.setDescProjeto(rs.getString("descProjeto"));
            listaPontos.setStatusProjeto(rs.getString("statusProjeto"));          
            listaPontos.setCargaTotalHr(rs.getString("cargaTotalHr"));
            lista.add(listaPontos);    
        }
  
         
        } catch (SQLException e) {
            e.printStackTrace();
        }
    
        return lista;
      
       }
       
       public boolean editaProjeto(RegistraProjetoModel proj) {
        boolean status = false;
        String sql = "update projetos set descProjeto = ?, statusProjeto = ?, cargaTotalHr = ? where idProjeto = ?;";

        try {
            Connection conn = Conexao.getConexao();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, proj.getDescProjeto());
            ps.setString(2, proj.getStatusProjeto());
            ps.setString(3, proj.getCargaTotalHr());
            ps.setInt(4, proj.getIdProjeto());

            System.out.println(ps);
            if (ps.executeUpdate() > 0) {
                ps.close();
                System.out.println("Deu certo o editar do projeto");
                status = true;
            }
        } catch (SQLException e) {
            e.printStackTrace(System.err);
        }
        return status;
    }
 }     





  




