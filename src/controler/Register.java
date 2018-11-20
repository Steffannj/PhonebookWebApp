package controler;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDAOImplementation;

@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String email = request.getParameter("email");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String repeatPassword = request.getParameter("repeatPassword");

		UserDAOImplementation userDAO = new UserDAOImplementation();
		if (!password.equals(repeatPassword)) {
			request.setAttribute("message", "Passwords do not match.");
			request.getRequestDispatcher("/login1.jsp").forward(request, response);
		} else {
			if (password.length() < 8) {
				request.setAttribute("message", "Password must be at least 8 characters.");
				request.getRequestDispatcher("/login1.jsp").forward(request, response);
			} else {
				try {
					if (userDAO.exists(email)) {
						request.setAttribute("message", "An account with this email already exists.");
						request.getRequestDispatcher("/login1.jsp").forward(request, response);
					} else {
						userDAO.addUser(username, password, email);
						response.sendRedirect("/PhonebookWebApp/login1.jsp");
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}

		}
	}

}
