package dao;

import java.sql.SQLException;

import model.User;

public interface UserDAOInterface {
	
	public void addUser(String username, String password, String email) throws SQLException;
	
	public User login(String username, String password) throws SQLException;
	

}
