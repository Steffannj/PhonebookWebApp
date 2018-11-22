package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import database.ConnectionManager;
import model.Contact;
import model.User;

public class ContactDAOImplementation implements ContactDAOInterface {

	Connection conn = ConnectionManager.getInstance().getConnection();

	@Override
	public void addContact(String firstname, String lastname, String phoneNumber, User user) throws SQLException {
		String query = "INSERT INTO contact(firstname, lastname, phoneNumber, userId) VALUES (?,?,?,?)";

		try (PreparedStatement statement = conn.prepareStatement(query)) {
			statement.setString(1, firstname);
			statement.setString(2, lastname);
			statement.setString(3, phoneNumber);
			statement.setInt(4, user.getUserId());

			statement.execute();
		}
	}

	@Override
	public void editContact(String newFirstname, String newLastname, String newNumber, String contactId) throws SQLException {
		String query = "UPDATE contact SET firstname = ?, lastname = ?, phoneNumber = ? WHERE contactId = ?";

		try (PreparedStatement statement = conn.prepareStatement(query)) {
			statement.setString(1, newFirstname);
			statement.setString(2, newLastname);
			statement.setString(3, newNumber);
			statement.setString(4, contactId);

			statement.execute();

			System.out.println("Successfully updated.");
		}

	}

	@Override
	public ArrayList<Contact> getContacts(User user) throws SQLException {
		String query = "SELECT * FROM contact WHERE userId = ?";
		ArrayList<Contact> listOfContacts = new ArrayList<>();

		try (PreparedStatement statement = conn.prepareStatement(query)) {

			statement.setInt(1, user.getUserId());

			ResultSet rs = statement.executeQuery();

			if (rs.next()) {
				do {
					Contact c = new Contact();
					c.setContactId(rs.getInt("contactId"));
					c.setFirstname(rs.getString("firstname"));
					c.setLastname(rs.getString("lastname"));
					c.setPhoneNumber(rs.getString("phoneNumber"));
					listOfContacts.add(c);
				} while (rs.next());
			} else {
				System.out.println("List is empty.");
			}
		}
		return listOfContacts;
	}

	@Override
	public ArrayList<Contact> searchContact(String search, User user) throws SQLException {
		ArrayList<Contact> searchResult = new ArrayList<>();
		Contact c = new Contact();
		String query = "SELECT * FROM contact WHERE firstname LIKE ? OR lastname LIKE ? AND userId = ?";

		try (PreparedStatement statement = conn.prepareStatement(query)) {

			statement.setString(1, search);
			statement.setString(2, search);
			statement.setInt(3, user.getUserId());
			ResultSet rs = statement.executeQuery();

			if (rs.next()) {
				do {
					c.setFirstname(rs.getString("firstname"));
					c.setLastname(rs.getString("lastname"));
					c.setPhoneNumber(rs.getString("phoneNumber"));
					searchResult.add(c);
				} while (rs.next());
			}

		}
		return searchResult;
	}

	@Override
	public Contact getContact(String id) throws SQLException {
		Contact contact = new Contact();

		String query = "SELECT *  FROM contact WHERE contactId = ?";

		try (PreparedStatement statement = conn.prepareStatement(query)) {

			statement.setString(1, id);

			ResultSet rs = statement.executeQuery();

			if (rs.next()) {
				contact.setContactId(rs.getInt("contactId"));
				contact.setFirstname(rs.getString("firstname"));
				contact.setLastname(rs.getString("lastname"));
				contact.setPhoneNumber(rs.getString("phoneNumber"));
				contact.setUserId(rs.getInt("userId"));
			}
		}
		return contact;
	}
}
