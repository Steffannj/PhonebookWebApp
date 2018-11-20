<%@page import ="java.sql.Statement"%>
<%@page import ="java.sql.DriverManager"%>
<%@page import ="java.sql.Connection"%>
<%@page import="dao.ContactDAOImplementation"%>
<%@page import="model.User"%>
<%
String id = request.getParameter("id");
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/phonebook?useSSL=false&serverTimezone=UTC","root","root");
Statement stat = conn.createStatement();

ContactDAOImplementation contactDAO = new ContactDAOImplementation();
User user = (User) request.getSession().getAttribute("user");

stat.executeUpdate("DELETE FROM contact WHERE contactId = '"+id+"'");
request.getSession().setAttribute("list", contactDAO.getContacts(user));
request.getRequestDispatcher("/user1.jsp").forward(request, response);
%>