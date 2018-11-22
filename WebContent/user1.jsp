<%@page import="dao.ContactDAOImplementation"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.User"%>
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

		if (session.getAttribute("uname") == null)
			response.sendRedirect("login1.jsp");
	%>


	<div class="container-fluid">

		<div class="row">
			<div class="col-lg-12">
				<h2 style="margin-top: 3%; margin-left: 15%; color: white">Welcome
					${uname} to your phonebook</h2>
			</div>
		</div>

		<div class="row">
			<div class="col-lg-7">

				<div class="row" style="margin-left: 3%; margin-top: 5%;">

					<div class="col-10">
						<form action="SearchContacts" method="post">
							<input type="text" class="form-control-sm fa fa-search"
								placeholder="Search" name="search">
							<button type="submit" class="btn btn-sm" role="button">Search</button>
						</form>
					</div>

					<div class="col-2">
						<button type="button" class="btn btn-sm btn-info"
							data-toggle="modal" data-target="#add">
							Add New <i class="fa fa-user-plus"></i>
						</button>
					</div>
				</div>
				
				<table class="table table-striped"
					style="margin-left: 5%; margin-top: 3%; color: white">

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

									<td><button class="btn btn-outline-warning"
											data-toggle="modal" data-target="#edit${contact.contactId}">
											<i class="fa fa-pencil"></td>
									<div class="modal fade" id="edit${contact.contactId}">
										<div class="modal-dialog" role="document">
											<div class="modal-content"
												style="background-image: url(img/signup.jpg)">
												<div class="modal-header">
													<h4 style="color: white">Edit contact</h4>
													<button type="button" class="close" data-dismiss="modal">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<form action="Edit" method="post">
													<div class="modal-body">
														<div class="row">
															<div class="col-4">
																<label style="color: white; margin-top: 7%"><h6>Firstname</h6></label>
															</div>
															<div class="col-md-8">
																<input type="text" class="form-control"
																	value="${contact.firstname}" name="editedfirstname"
																	required>
															</div>
														</div>
														<div class="row">
															<div class="col-4">
																<label style="color: white; margin-top: 7%"><h6>Lastname</h6></label>
															</div>
															<div class="col-md-8">
																<input type="text" class="form-control"
																	value="${contact.lastname}" name="editedlastname"
																	required>
															</div>
														</div>
														<div class="row">
															<div class="col-4">
																<label style="color: white; margin-top: 7%"><h6>Phone
																		number</h6></label>
															</div>
															<div class="col-md-8">
																<input type="text" class="form-control"
																	value="${contact.phoneNumber}" name="editedphonenumber"
																	required>
															</div>
															<input type="hidden" name="id"
																value="${contact.contactId}">
														</div>

													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-secondary"
															data-dismiss="modal">Close</button>
														<button type="submit" class="btn btn-primary">Edit</button>
													</div>
												</form>
											</div>
										</div>
									</div>


									<td><a href="delete.jsp?id=${contact.contactId}" name=id
										" class="btn btn-outline-danger"> <i class="fa fa-trash"></td>

								</tr>
							</c:forEach>

						</tr>

					</tbody>

				</table>

				<form align="right" action="Logout" method="post">
					<button class="btn btn-danger">Logout</button>
				</form>
			</div>
		</div>
	</div>

	<div class="modal fade" id="add">
		<div class="modal-dialog" role="document">
			<div class="modal-content"
				style="background-image: url(img/signup.jpg)">
				<div class="modal-header">
					<h4 style="color: white">Add contact</h4>
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form action="AddContact" method="post">
					<div class="modal-body">
						<div class="row">
							<div class="col-4">
								<label style="color: white; margin-top: 7%"><h6>Firstname</h6></label>
							</div>
							<div class="col-md-8">
								<input type="text" class="form-control"
									placeholder="Enter firstname" name="firstname" required>
							</div>
						</div>
						<div class="row">
							<div class="col-4">
								<label style="color: white; margin-top: 7%"><h6>Lastname</h6></label>
							</div>
							<div class="col-md-8">
								<input type="text" class="form-control"
									placeholder="Enter lastname" name="lastname" required>
							</div>
						</div>
						<div class="row">
							<div class="col-4">
								<label style="color: white; margin-top: 7%"><h6>Phone
										number</h6></label>
							</div>
							<div class="col-md-8">
								<input type="password" class="form-control"
									placeholder="Enter phone number" name="phonenumber" required>
							</div>
						</div>

					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
						<button type="submit" class="btn btn-primary">Add</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<footer class="page-footer"
		style="background: linear-gradient(black, rgba(159, 12, 12, 0.5)); color: white;">
		<div class="footerText text-center">
			© 2018 Copyright: <a href="https://github.com/Steffannj"
				class="text-success"> Stefan Njegomirovic</a>
		</div>
	</footer>
</body>

</html>
