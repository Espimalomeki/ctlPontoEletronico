
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.FichaFuncModel;


public class FichaFuncDao {
        
      public ArrayList ListaFichas() {
            Connection con = Conexao.getConexao();
            ArrayList lista = new ArrayList();
 
        try {       
            Connection conn = Conexao.getConexao();
            String sql = 
                      " SELECT funcionario.numMatricula,"
                    + " funcionario.nome,"
                    + " funcionario.cargo,"
                    + " departamento.nomeDepto,"
                    + " usuariosEmProjeto.idProjeto,"
                    + " usuariosEmProjeto.horasProjeto,"
                    + " projetos.descProjeto,"
                    + " alocacaoHoras.qtdHoras"
                    + " FROM funcionario "
                    + " INNER JOIN departamento ON funcionario.idDepto = departamento.idDepto"
                    + " INNER JOIN usuariosEmProjeto ON funcionario.numMatricula = usuariosEmProjeto.numMatricula"
                    + " INNER JOIN alocacaoHoras ON funcionario.numMatricula = alocacaoHoras.numMatricula"
                    + " INNER JOIN projetos ON projetos.idProjeto = usuariosEmProjeto.idProjeto"
                    + " ORDER BY idProjeto";
            
            PreparedStatement selectPs = con.prepareStatement(sql);         
            ResultSet rs = selectPs.executeQuery();
            
            
            while(rs.next()){
 
            FichaFuncModel Ficha = new FichaFuncModel();
          
            Ficha.setNumMatricula(rs.getInt("numMatricula"));
            Ficha.setNome(rs.getString("nome"));          
            Ficha.setCargo(rs.getString("cargo"));
            Ficha.setNomeDepto(rs.getString("nomeDepto"));
            Ficha.setIdProjeto(rs.getInt("idProjeto"));
            Ficha.setQtdHoras(rs.getString("qtdHoras"));
            Ficha.setDescProjeto(rs.getString("descProjeto"));
            Ficha.setHorasProjeto(rs.getInt("horasProjeto"));
            
      

            
            lista.add(Ficha);    
            
        }
  
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;
      
       }
    
}
