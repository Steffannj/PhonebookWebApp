<%@page import="dao.ContactDAOImplementation"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width = device-width, inicial-scale=1">
<title>Phonebook</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet" href="style.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<body>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	
if(session.getAttribute("uname") == null)
	response.sendRedirect("login1.jsp");
%>
	<div class="container-flow">

		<div class="row">
			<div class="col-12">
				<h2 style="margin-top: 3%; margin-left: 15%; color: white">Welcome ${uname} to your phonebook</h2>
			</div>
		</div>

		<div class="row">
			<div class="col-7">
				<form>
					<table class="table"
						style="margin-left: 5%; margin-top: 3%; margin-bottom: 5%; color: white">
						<div class="row" style="margin-left: 3%; margin-top: 5%;">
							<div class="col-10">
								<input class="form-control-sm fa fa-search" type="text"
									placeholder="Search">
							</div>
							<div class="col-2">
								<button type="button" class="btn btn-sm btn-info">
									Add New <i class="fa fa-user-plus"></i>
								</button>
							</div>
						</div>
						<thead>
							<tr>
								<th>First name</th>
								<th>Last name</th>
								<th>Contact</th>
								<th>Edit</th>
								<th>Delete</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<c:forEach var="contact" items="${list}">
									<tr>
										<td><c:out value="${contact.firstname}" /></td>
										<td><c:out value="${contact.lastname}" /></td>
										<td><c:out value="${contact.phoneNumber}" /></td>

										<td><button type="button" class="btn btn-outline-warning">
												<i class="fa fa-pencil">
											</button></td>
										<td><button type="button" class="btn btn-outline-danger">
												<i class="fa fa-trash">
											</button></td>
									</tr>
								</c:forEach>

							</tr>

						</tbody>
						
					</table>
				</form>
				<form align = "right" action = "Logout" method="post">
						<button class = "btn btn-danger">Logout</button>
				</form>
			</div>
		</div>
	</div>
	<footer class="footer">
		<div class="footerText text-center">
			� 2018 Copyright: <a href="https://github.com/Steffannj"
				class="text-success"> Stefan Njegomirovic</a>
		</div>
	</footer>
</body>

</html>