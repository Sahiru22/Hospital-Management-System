<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Hospital Management System</title>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.84.0">

    <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/sign-in/">

    <!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">

<!-- JavaScript Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
	crossorigin="anonymous">
</script>

  <style>
		html,
		body {
		  height: 100%;
		}
		
		.form-signin {
		  width: 100%;
		  max-width: 330px;
		  padding: 15px;
		  margin:0px;
		}
		
		.form-signin .checkbox {
		  font-weight: 400;
		}
		
		.form-signin .form-floating:focus-within {
		  z-index: 2;
		}
		
		.form-signin input[type="text"] {
		  margin-bottom: -1px;
		  border-bottom-right-radius: 0;
		  border-bottom-left-radius: 0;
		}
		
		.form-signin input[type="password"] {
		  margin-bottom: 10px;
		  border-top-left-radius: 0;
		  border-top-right-radius: 0;
		}
		
		.invalid-feedback {
		  display: none;
		  color: #dc3545;
		  font-size: 0.875em;
		}
		
		.was-validated .form-control:invalid ~ .invalid-feedback {
		  display: block;
		}
		
		.required-asterisk::after {
		  content: '*';
		  color: red;
		  margin-left: 2px;
		}
		
		body {
		  display: flex;
		  align-items: center;
		  padding-top: 40px;
		  padding-bottom: 40px;
		  background-color: #f5f5f5;
		  flex-direction: column;
		}
    </style>
	
</head>
<body>

	<div class="px-4 py-5 text-center">
		<img class="d-block mx-auto mb-4" src="images/icons8-tasklist-96.png"
			alt="">
		<h1 class="display-5 fw-bold">Hospital Management System</h1>
		<div class="col-lg-12 mx-auto">
			<p class="lead mb-4">Welcome to our hospital management System.</p>
		</div>
	</div>

<main class="form-signin">
<div class="card">
		<div class="card-body">
  <form action="login" method="POST" class="needs-validation" novalidate>
    <h1 class="h3 mb-3 fw-normal" style="align-items: center;">Please Log in to continue</h1>

    <div class="form-floating mb-3">
      <input type="text" name="uid" class="form-control" id="floatingInput" placeholder="Username" required minlength="3">
      <label for="floatingInput" class="required-asterisk">User Name</label>
      <div class="invalid-feedback" id="usernameFeedback">
        Username must be at least 3 characters long.
      </div>
    </div>
    <div class="form-floating mb-3">
      <input type="password" name="pass" class="form-control" id="floatingPassword" placeholder="Password" required minlength="6">
      <label for="floatingPassword" class="required-asterisk">Password</label>
      <div class="invalid-feedback" id="passwordFeedback">
        Password must be at least 6 characters long.
      </div>
    </div>

    <button class="w-100 btn btn-lg btn-primary" type="submit">Sign in</button>
  </form>
  </div>
</div>
	
<br>

<a href="pRegister.jsp">
<input class="w-100 btn btn-lg btn btn-outline-primary" type="button" name="update" value="Create New Account">
</a>

<a href="Admin.jsp">
<input class="w-100 btn btn-lg btn btn-outline-primary" type="button" name="update" value="Admin Login">
</a>
</main>

<script>
(function () {
  'use strict'
  var forms = document.querySelectorAll('.needs-validation')
  Array.prototype.slice.call(forms).forEach(function (form) {
    form.addEventListener('submit', function (event) {
      var usernameInput = form.querySelector('#floatingInput');
      var passwordInput = form.querySelector('#floatingPassword');
      var usernameFeedback = form.querySelector('#usernameFeedback');
      var passwordFeedback = form.querySelector('#passwordFeedback');

      // Reset feedback messages
      usernameFeedback.textContent = 'Username must be at least 3 characters long.';
      passwordFeedback.textContent = 'Password must be at least 6 characters long.';

      // Check if fields are empty
      if (!usernameInput.value) {
        usernameFeedback.textContent = 'Please enter your username.';
      }
      if (!passwordInput.value) {
        passwordFeedback.textContent = 'Please enter your password.';
      }

      if (!form.checkValidity()) {
        event.preventDefault();
        event.stopPropagation();
      }
      form.classList.add('was-validated');
    }, false);

    // Real-time validation on input
    form.querySelector('#floatingInput').addEventListener('input', function (e) {
      var feedback = form.querySelector('#usernameFeedback');
      if (!e.target.value) {
        feedback.textContent = 'Please enter your username.';
      } else if (e.target.value.length < 3) {
        feedback.textContent = 'Username must be at least 3 characters long.';
      } else {
        feedback.textContent = '';
      }
    });

    form.querySelector('#floatingPassword').addEventListener('input', function (e) {
      var feedback = form.querySelector('#passwordFeedback');
      if (!e.target.value) {
        feedback.textContent = 'Please enter your password.';
      } else if (e.target.value.length < 6) {
        feedback.textContent = 'Password must be at least 6 characters long.';
      } else {
        feedback.textContent = '';
      }
    });
  });
})();
</script>

</body>
</html>