package dao;

import java.sql.SQLException;
import java.util.ArrayList;

import model.Contact;
import model.User;

public interface ContactDAOInterface {

	public void addContact(User user) throws SQLException;

	public void updateContact(Contact contact) throws SQLException;

	public void deleteContact(Contact contact) throws SQLException;

	public ArrayList<Contact>getContacts(User user) throws SQLException;

	public void searchContactByFirstname(User user) throws SQLException;

	public void searchContactByLastname(User user) throws SQLException;

	public Contact getContact(User user) throws SQLException;
}
