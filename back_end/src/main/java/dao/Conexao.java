package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexao {
    public static Connection getConexao() {
        Connection con = null;

        try {
            String serverName = "db-espimalomeki2.cxcrimytnhb6.us-east-2.rds.amazonaws.com";
            String mydatabase = "espimalomeki";

            String username = "admin";
            String password = "espimalomeki";

            String driverName = "com.mysql.cj.jdbc.Driver";
            Class.forName(driverName);

            String url = "jdbc:mysql://" + serverName + "/" + mydatabase + "?useTimezone=true&serverTimezone=UTC";
            con = DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException e) {
            System.out.println("Driver não encontrado " + e.toString());
        } catch (SQLException e) {
            System.out.println("Erro ao conectar o Banco de Dados " + e.toString());
        }

        return con;
    }
}
