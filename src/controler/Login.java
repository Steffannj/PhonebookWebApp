package controler;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ContactDAOImplementation;
import dao.UserDAOImplementation;
import model.User;


@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uname = request.getParameter("uname");
		String pass = request.getParameter("pass");
		
		UserDAOImplementation userDAO = new UserDAOImplementation();
		ContactDAOImplementation contactDAO = new ContactDAOImplementation();
		
		try {
			User user = userDAO.login(uname, pass);
			
			if(user.getUserId() != 0) {
				HttpSession session = request.getSession();
				session.setAttribute("uname", uname);
				
				request.getSession().setAttribute("list", contactDAO.getContacts(user)); 
				request.getRequestDispatcher("/user1.jsp").forward(request, response);
			}else {
				response.sendRedirect("/PhonebookWebApp/login1.jsp");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
	}

}
