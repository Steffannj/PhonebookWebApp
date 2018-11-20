package controler;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ContactDAOImplementation;
import dao.UserDAOImplementation;
import model.User;

@WebServlet("/AddContact")
public class AddContact extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
		String phoneNumber = request.getParameter("phonenumber");
		User user = (User) request.getSession().getAttribute("user");

		ContactDAOImplementation contactDAO = new ContactDAOImplementation();
		try {
			contactDAO.addContact(firstname, lastname, phoneNumber, user);
			
			request.getSession().setAttribute("list", contactDAO.getContacts(user));
			request.getRequestDispatcher("/user1.jsp").forward(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
