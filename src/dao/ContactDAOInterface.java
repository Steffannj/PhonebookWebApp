package dao;

import java.sql.SQLException;
import java.util.ArrayList;

import model.Contact;
import model.User;

public interface ContactDAOInterface {

	public void addContact(String firstname, String lastname, String phoneNumber, User user) throws SQLException;

	public void editContact(String newFirstname, String newLastname, String newNubmer, String contactId) throws SQLException;

	public ArrayList<Contact> getContacts(User user) throws SQLException;

	public ArrayList<Contact> searchContact(String search, User user) throws SQLException;

	public Contact getContact(String id) throws SQLException;
}
