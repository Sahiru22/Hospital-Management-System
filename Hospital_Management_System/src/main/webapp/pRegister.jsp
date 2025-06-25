<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

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

<!-- Font Awesome for icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

<style>
	.required::after {
		content: " *";
		color: red;
	}
	.error-message {
		color: red;
		font-size: 0.875em;
		margin-top: 0.25rem;
		display: none;
	}
	.is-invalid {
		border-color: red !important;
	}
</style>

</head>
<body>
<section class="vh-100" style="background-color: #eee;">
  <div class="container h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-lg-12 col-xl-11">
        <div class="card text-black" style="border-radius: 25px;">
          <div class="card-body p-md-5">
            <div class="row justify-content-center">
              <div class="col-md-10 col-lg-6 col-xl-5 order-2 order-lg-1">

                <p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">Register</p>

                <form action="preg" method="POST" class="mx-1 mx-md-4" id="registerForm" novalidate>

                  <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-user fa-lg me-3 fa-fw"></i>
                    <div class="form-outline flex-fill mb-0">
                      <input name="pname" type="text" id="form3Example1c" class="form-control" required />
                      <label class="form-label required" for="form3Example1c">Your Name</label>
                      <div class="error-message" id="pnameError">Please enter a valid name (minimum 2 characters)</div>
                    </div>
                  </div>

                  <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-user fa-lg me-3 fa-fw"></i>
                    <div class="form-outline flex-fill mb-0">
                      <input name="username" type="text" id="form3Example3c" class="form-control" required />
                      <label class="form-label required" for="form3Example3c">User Name</label>
                      <div class="error-message" id="usernameError">Please enter a valid username (minimum 3 characters)</div>
                    </div>
                  </div>

                  <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-lock fa-lg me-3 fa-fw"></i>
                    <div class="form-outline flex-fill mb-0">
                      <input name="password" type="password" id="form3Example4c" class="form-control" required />
                      <label class="form-label required" for="form3Example4c">Password</label>
                      <div class="error-message" id="passwordError">Password must be at least 6 characters long</div>
                    </div>
                  </div>

                  <div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
                    <button type="submit" class="btn btn-primary btn-lg">Register</button>
                  </div>

                </form>

              </div>
              <div class="col-md-10 col-lg-6 col-xl-7 d-flex align-items-center order-1 order-lg-2">

                <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-registration/draw1.webp"
                  class="img-fluid" alt="Sample image">

              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<script>
document.getElementById('registerForm').addEventListener('submit', function(event) {
    event.preventDefault();
    let isValid = true;

    // Reset previous error states
    document.querySelectorAll('.error-message').forEach(error => error.style.display = 'none');
    document.querySelectorAll('.form-control').forEach(input => input.classList.remove('is-invalid'));

    // Validate Name
    const nameInput = document.getElementById('form3Example1c');
    if (!nameInput.value.trim() || nameInput.value.trim().length < 2) {
        document.getElementById('pnameError').style.display = 'block';
        nameInput.classList.add('is-invalid');
        isValid = false;
    }

    // Validate Username
    const usernameInput = document.getElementById('form3Example3c');
    if (!usernameInput.value.trim() || usernameInput.value.trim().length < 3) {
        document.getElementById('usernameError').style.display = 'block';
        usernameInput.classList.add('is-invalid');
        isValid = false;
    }

    // Validate Password
    const passwordInput = document.getElementById('form3Example4c');
    if (!passwordInput.value || passwordInput.value.length < 6) {
        document.getElementById('passwordError').style.display = 'block';
        passwordInput.classList.add('is-invalid');
        isValid = false;
    }

    // If all validations pass, submit the form
    if (isValid) {
        this.submit();
    }
});

// Real-time validation on input
document.querySelectorAll('input').forEach(input => {
    input.addEventListener('input', function() {
        const errorElement = document.getElementById(this.id + 'Error');
        if (this.type === 'text' && this.value.trim()) {
            if (this.id === 'form3Example1c' && this.value.trim().length >= 2) {
                this.classList.remove('is-invalid');
                if (errorElement) errorElement.style.display = 'none';
            } else if (this.id === 'form3Example3c' && this.value.trim().length >= 3) {
                this.classList.remove('is-invalid');
                if (errorElement) errorElement.style.display = 'none';
            }
        } else if (this.type === 'password' && this.value.length >= 6) {
            this.classList.remove('is-invalid');
            if (errorElement) errorElement.style.display = 'none';
        }
    });
});
</script>

</body>
</html>