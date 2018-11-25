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
</head>

<body>
	<div class="container" style="margin-bottom: 10em;">
		<div class="row">
			<div class="col-lg-12">
				<h2 style="margin-top: 10%; color: white">Welcome to phonebook</h2>
			</div>
		</div>

		<div class="row">
			<div class="col-lg-7">
				<form action="Login" method="post">

					<div class="form-group" style="margin-top: 20%;">
						<label class="usernameAndPassword">Username</label> <input
							type="text" class="form-control" placeholder="Username"
							name="uname"> <label class="usernameAndPassword"
							style="margin-top: 5%;">Password</label> <input type="password"
							class="form-control" placeholder="Password" name="pass">
					</div>

					<div class="checkbox">
						<label style="color: white;"> <input type="checkbox">Remember
							Me
						</label>
					</div>

					<div class="row">
						<div class="col-2">
							<button type="submit" class="btn btn-primary" role="button"
								style="float: left">Login</button>
						</div>
						
						<div class="col-8" style="text-align: center">
							<c:choose>
								<c:when
									test="${message == 'Registration failed. Passwords do not match.'}">
									<p style="color: red;">${message}</p>
								</c:when>
								<c:when
									test="${message == 'Registration failed. Password must be at least 8 characters.'}">
									<p style="color: red;">${message}</p>
								</c:when>
								<c:when
									test="${message == 'Registration failed. An account with this email already exists.'}">
									<p style="color: red;">${message}</p>
								</c:when>
								<c:otherwise>
									<p style="color: green;">${message}</p>
								</c:otherwise>
							</c:choose>
						</div>
						
						<div class="col-2">
							<button type="button" class="btn btn-secondary"
								data-toggle="modal" data-target="#signUp" style="float: right;">Sing
								up</button>
						</div>
						
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

	<!-- Modal -->

	<div class="modal fade" id="signUp">
		<div class="modal-dialog" role="document">
			<div class="modal-content"
				style="background-image: url(img/signup.jpg)">
				
				<div class="modal-header">
					<h4 style="color: white">Sign up</h4>
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				
				<form action="Register" method="post">
					<div class="modal-body">
						<div class="row">
							<div class="col-lg-4">
								<label style="color: white; margin-top: 7%"><h6>Email</h6></label>
							</div>
							<div class="col-lg-8">
								<input type="text" class="form-control"
									placeholder="example@email.com" name="email" required>
							</div>
						</div>
						
						<div class="row">
							<div class="col-lg-4">
								<label style="color: white; margin-top: 7%"><h6>Username</h6></label>
							</div>
							<div class="col-lg-8">
								<input type="text" class="form-control"
									placeholder="Enter username" name="username" required>
							</div>
						</div>
						
						<div class="row">
							<div class="col-lg-4">
								<label style="color: white; margin-top: 7%"><h6>Password</h6></label>
							</div>
							<div class="col-md-8">
								<input type="password" class="form-control"
									placeholder="Enter password" name="password" required>
							</div>
						</div>
						
						<div class="row">
							<div class="col-lg-4">
								<label style="color: white; margin-top: 7%"><h6>Repeat
										password</h6></label>
							</div>
							<div class="col-lg-8">
								<input type="password" class="form-control"
									placeholder="Enter password" name="repeatPassword" required>
							</div>
						</div>
						
					</div>
					
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
						<button type="submit" class="btn btn-primary">Register</button>
					</div>
				</form>
			</div>
		</div>
	</div>


</body>
</html>