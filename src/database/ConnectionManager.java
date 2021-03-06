package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionManager {
private static ConnectionManager instance = null;
	
	private static final String USERNAME = "root";
	private static final String PASSWORD = "root";
	private static final String CONN_STRING = "jdbc:mysql://localhost/phonebook?useSSL=false&serverTimezone=UTC";
	
	private Connection connection = null;
	
	private ConnectionManager() {

	}
	
	public static ConnectionManager getInstance() {
		if (instance == null) {
			instance = new ConnectionManager();
		}
		return instance;
	}

	private boolean openConnection() {
		try {
			try {
				Class.forName("com.mysql.jdbc.Driver").newInstance();
			} catch (InstantiationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			connection = DriverManager.getConnection(CONN_STRING, USERNAME, PASSWORD);
			return true;
		} catch (SQLException e) {
			System.err.println(e);
			return false;
		}
	}

	public Connection getConnection() {
		if (connection == null) {
			if (openConnection()) {
				return connection;
			} else {
				return null;
			}
		}
		return connection;
	}

	public void close() {
		try {
			connection.close();
			connection = null;
		} catch (Exception e) {
		}
	}
}
