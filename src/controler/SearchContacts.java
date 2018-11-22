package controler;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ContactDAOImplementation;
import model.Contact;
import model.User;

@WebServlet("/SearchContacts")
public class SearchContacts extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String search = request.getParameter("search");

		ContactDAOImplementation contactDAO = new ContactDAOImplementation();
		User user = (User) request.getSession().getAttribute("user");
		ArrayList<Contact> searchList = new ArrayList<>();

		try {
			searchList = contactDAO.searchContact(search, user);

			request.getSession().setAttribute("list", searchList);
			request.getRequestDispatcher("/user1.jsp").forward(request, response);
		} catch (SQLException e1) {
			e1.printStackTrace();
		}

	}

}
