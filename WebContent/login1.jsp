<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width = device-width, inicial-scale=1">
    <title>Phonebook</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  <link rel="stylesheet" href="style.css">
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</head>

  <body>
    <div class="container">
      <div class="row">
        <div class="col-12">
          <h2 style="margin-top: 10%; color: white">Welcome to phonebook</h2>
        </div>
      </div>
      <div class="row">
        <div class="col-7">
          <form action="Login" method = "post">
              <div class="form-group" style="margin-top: 20%;">
                <label class="usernameAndPassword">Username</label>
                <input type="text" class="form-control" placeholder="Username" name = "uname">
                <label class="usernameAndPassword" style="margin-top: 5%;">Password</label>
                <input type="password" class="form-control" placeholder="Password" name = "pass">
              </div>
              <div class="checkbox">
                <label style="color: white;">
                  <input type="checkbox">Remember Me
                </label>
              </div>
                <button type = "submit" class="btn btn-primary" role="button">Login</button>
                <button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#signUp" style="float: right;">Sing up</button>

          </form>
        </div>
      </div>
    </div>
    <footer class="footer">
      <div class="footerText text-center">© 2018 Copyright:
            <a href="https://github.com/Steffannj" class="text-success"> Stefan Njegomirovic</a>
          </div>
    </footer>

    <!-- Modal -->
    <div class="modal fade" id="signUp">
      <div class="modal-dialog" role="document">
        <div class="modal-content" style="background-image: url(img/signup.jpg)">
          <div class="modal-header">
            <h4 style="color: white">Sign up</h4>
            <button type="button" class="close" data-dismiss="modal" >
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <div class="row">
                <div class="col-3">
                    <label style="color: white;margin-top: 7%"><h6>Firstname</h6></label>
                </div>
                <div class="col-md-9">
                    <input type="text" class="form-control" placeholder="Enter firstname">
                </div>
            </div>
            <div class="row">
                <div class="col-3">
                    <label style="color: white;margin-top: 7%"><h6>Lastname</h6></label>
                </div>
                <div class="col-md-9">
                    <input type="text" class="form-control" placeholder="Enter lastname">
                </div>
            </div>
            <div class="row">
                <div class="col-3">
                    <label style="color: white;margin-top: 7%"><h6>Email</h6></label>
                </div>
                <div class="col-md-9">
                    <input type="text" class="form-control" placeholder="example@email.com">
                </div>
            </div>
            <div class="row">
                <div class="col-3">
                    <label style="color: white;margin-top: 7%"><h6>Username</h6></label>
                </div>
                <div class="col-md-9">
                    <input type="text" class="form-control" placeholder="Enter username">
                </div>
            </div>
            <div class="row">
                <div class="col-3">
                    <label style="color: white;margin-top: 7%"><h6>Password</h6></label>
                </div>
                <div class="col-md-9">
                    <input type="password" class="form-control" placeholder="Enter password">
                </div>
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            <button type="button" class="btn btn-primary">Register</button>
          </div>
        </div>
      </div>
    </div>
    </body>
</html>