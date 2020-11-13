/*
 * Criado pelo mais sexy, e sem camiseta
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.AlertasModel;
import model.PontoEletronicoModel;

public class AlertasDao {

    Conexao conn = new Conexao();
    int numM;

    public void rgmUsuario(int numMatricula) {
        numM = numMatricula;
    }

    public ArrayList eventosAtivos() throws SQLException {
        Connection con = Conexao.getConexao();

        String sql = "SELECT eventoCalendario.idEvento, nomeEvento, descEvento, dataInicial, dataFinal,tipoEvento  FROM usuariosEvento \n"
                + "inner join eventoCalendario\n"
                + "on eventoCalendario.idEvento = usuariosEvento.idEvento\n"
                + "where usuariosEvento.numMatricula = ? and dataFinal > CURRENT_DATE();";

        PreparedStatement selectPs = con.prepareStatement(sql);
        selectPs.setInt(1, numM);
        ResultSet rs = selectPs.executeQuery();
        ArrayList lista = new ArrayList();

        while (rs.next()) {

            AlertasModel listaAlertas = new AlertasModel();

            listaAlertas.setIdEvento(rs.getInt("idEvento"));
            listaAlertas.setNomeEvento(rs.getString("nomeEvento"));
            listaAlertas.setDescEvento(rs.getString("descEvento"));
            listaAlertas.setDataInicial(rs.getString("dataInicial"));
            listaAlertas.setDataFinal(rs.getString("dataFinal"));
            listaAlertas.setTipoEvento(rs.getString("tipoEvento"));

            lista.add(listaAlertas);
        }
        rs.close();
        con.close();

        return lista;

    }

}
