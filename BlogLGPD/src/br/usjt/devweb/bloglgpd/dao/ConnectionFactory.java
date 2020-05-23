package br.usjt.devweb.bloglgpd.dao;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionFactory {
	static {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");//vai mudar provavelmente
			
		} catch (ClassNotFoundException e) {
			throw new RuntimeException(e);
		}
	}
	
	// Obtém conexão com o banco de dados
	public static Connection obtemConexao() throws SQLException {
		return DriverManager
				.getConnection("jdbc:mysql://postagemblog.mysql.uhserver.com/postagemblog?&user=usjtsantana1&password=USJTS@ntana1");
		//n�o tem no 5.6 useTimezone=true&serverTimezone=America/Sao_Paulo
	}

}
