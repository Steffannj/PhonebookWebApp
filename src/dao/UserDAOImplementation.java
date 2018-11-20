package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import database.ConnectionManager;

import model.User;

public class UserDAOImplementation implements UserDAOInterface {
	
	Connection conn = ConnectionManager.getInstance().getConnection();

	@Override
	public void addUser(String username, String password, String email) throws SQLException {
		String query = "INSERT INTO user (username,password,email) VALUES (?,?, ?)";

		try (PreparedStatement statement = conn.prepareStatement(query)) {
			statement.setString(1, username);
			statement.setString(2, password);
			statement.setString(3, email);

			statement.execute();
			System.out.println("Successfully registered!");
		}

	}

	@Override
	public User login(String username, String password) throws SQLException {
		User user = new User();

		String query = "SELECT * FROM user WHERE username = ? AND password = ?";

		try (PreparedStatement statement = conn.prepareStatement(query)) {
			statement.setString(1, username);
			statement.setString(2, password);

			ResultSet rs = statement.executeQuery();

			while (rs.next()) {
				user.setUserId(rs.getInt("userId"));
				user.setUsername(rs.getString("username"));
				user.setPassword(rs.getString("password"));
				user.setEmail(rs.getString("email"));

				System.out.println("Successfully loged in!");
			}
		}

		return user;
	}

	@Override
	public boolean exists(String email) throws SQLException {
		boolean exist = false;
		
		String query = "SELECT * FROM user WHERE email = ?";
		
		try(PreparedStatement statement = conn.prepareStatement(query)){
			statement.setString(1, email);
			
			ResultSet rs = statement.executeQuery();
			
			String check = "";
			if(rs.next()) {
				check = rs.getString("email");
			}
			if(check != "") {
				exist = true;
			}
		}
		return exist;
	}



	


}
