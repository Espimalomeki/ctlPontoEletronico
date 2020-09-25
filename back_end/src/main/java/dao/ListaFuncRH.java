package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import model.FuncionarioModel;

/**
 *
 * @author Rogian
 */
public class ListaFuncRH {
    
    Conexao conn = new Conexao();
    
    public ArrayList <FuncionarioModel> ListaFunc() {
           
            FuncionarioModel model = new FuncionarioModel();
//            int numMatricula = model.getNumMatricula();
            Connection con = Conexao.getConexao();
            ArrayList <FuncionarioModel> lista = new ArrayList();
            
        try {    
            Connection conn = Conexao.getConexao();
            String sql = "select * from funcionario";
            PreparedStatement selectPs = con.prepareStatement(sql);           
            ResultSet rs = selectPs.executeQuery();
            
            while(rs.next()){
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
    
}
