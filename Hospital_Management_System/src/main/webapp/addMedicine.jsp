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

                <p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">Add Medicine</p>

                <form action="addmedicine" method="POST" class="mx-1 mx-md-4" id="medicineForm" novalidate>

                  <div class="mb-3">
                    <div class="form-outline flex-fill mb-0">
                    	<label class="form-label required" for="form3Example1c">Medicine Name</label>
                     	<input name="name" type="text" id="form3Example1c" class="form-control" required />
                     	<div class="error-message" id="nameError">Please enter a valid medicine name (minimum 2 characters)</div>
                    </div>
                  </div>

                  <div class="mb-3">
                    <div class="form-outline flex-fill mb-0">
                    	<label class="form-label required" for="form3Example3c">Unit Price</label>
                      	<input name="price" type="number" step="0.01" id="form3Example3c" class="form-control" required />
                      	<div class="error-message" id="priceError">Please enter a valid positive number for unit price</div>
                    </div>
                  </div>

				  <div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
                    <button type="submit" class="btn btn-primary btn-lg">ADD</button>
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
document.getElementById('medicineForm').addEventListener('submit', function(event) {
    event.preventDefault();
    let isValid = true;

    // Reset previous error states
    document.querySelectorAll('.error-message').forEach(error => error.style.display = 'none');
    document.querySelectorAll('.form-control').forEach(input => input.classList.remove('is-invalid'));

    // Validate Medicine Name
    const nameInput = document.getElementById('form3Example1c');
    if (!nameInput.value.trim() || nameInput.value.trim().length < 2) {
        document.getElementById('nameError').style.display = 'block';
        nameInput.classList.add('is-invalid');
        isValid = false;
    }

    // Validate Unit Price
    const priceInput = document.getElementById('form3Example3c');
    const priceValue = parseFloat(priceInput.value);
    if (!priceInput.value || isNaN(priceValue) || priceValue <= 0) {
        document.getElementById('priceError').style.display = 'block';
        priceInput.classList.add('is-invalid');
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
        if (this.type === 'text' && this.value.trim() && this.value.trim().length >= 2) {
            this.classList.remove('is-invalid');
            if (errorElement) errorElement.style.display = 'none';
        } else if (this.type === 'number') {
            const value = parseFloat(this.value);
            if (!isNaN(value) && value > 0) {
                this.classList.remove('is-invalid');
                if (errorElement) errorElement.style.display = 'none';
            }
        }
    });
});
</script>

</body>
</html>