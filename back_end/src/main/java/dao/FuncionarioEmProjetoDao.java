package dao;

import com.mysql.cj.xdevapi.JsonValue;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import org.json.JSONArray;
import org.json.JSONObject;

import servlet.IncluirFuncEmProjetoServlet;

public class FuncionarioEmProjetoDao {

    //public String incluiFuncEmProj(String codProj, ArrayList<IncluirFuncEmProjetoServlet> funcionarios) throws SQLException {
    public String incluiFuncEmProj(JSONObject obj) throws SQLException {
        String codProj = obj.getString("projeto");
        JSONArray arr = obj.getJSONArray("rgm");
        int numM;
        int idProj;
        
        Connection con = Conexao.getConexao();
        String sql = "INSERT INTO usuariosEmProjeto(numMatricula, idProjeto, horasProjeto) VALUES (?, ?, 0)";
        String sqlSelect;
        PreparedStatement ps = con.prepareStatement(sql);
        
        String rs = null;
        for (Object value : arr) {
            numM = Integer.parseInt(value.toString());
            idProj =  Integer.parseInt(codProj);
            sqlSelect = "SELECT * FROM espimalomeki.usuariosEmProjeto where numMatricula = ? and idProjeto = ?";
            PreparedStatement selectPs = con.prepareStatement(sqlSelect);
            selectPs.setInt(1, numM);
            selectPs.setInt(2, idProj);
            ResultSet resul = selectPs.executeQuery();
            String existeNumM = null;
            
            while (resul.next()) {
                existeNumM = resul.getString("numMatricula");
            }
            
            if (existeNumM == null){
                try {
                    ps.setInt(1, numM);
                    ps.setInt(2, idProj);
                    ps.execute();
                } catch (SQLException e) {
                    e.printStackTrace(System.err);
                }                 
            }
        }
        ps.close();
        con.close();
        return "";
    }

}
