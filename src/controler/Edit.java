package controler;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ContactDAOImplementation;
import model.User;

@WebServlet("/Edit")
public class Edit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String newFirstname = request.getParameter("editedfirstname");
		String newLastname = request.getParameter("editedlastname");
		String newNumber = request.getParameter("editedphonenumber");
		String id = request.getParameter("id");
		System.out.println(newFirstname);
		System.out.println(newLastname);
		System.out.println(newNumber);
		System.out.println(id);
		User user = (User) request.getSession().getAttribute("user");
		ContactDAOImplementation contactDAO = new ContactDAOImplementation();
		
		try {
			contactDAO.editContact(newFirstname, newLastname, newNumber, id);
			request.getSession().setAttribute("list", contactDAO.getContacts(user));
			request.getRequestDispatcher("/user1.jsp").forward(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
