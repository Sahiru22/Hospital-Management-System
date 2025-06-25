<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Lab</title>

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
	.required-asterisk::after {
		content: '*';
		color: red;
		margin-left: 2px;
	}
	
	.invalid-feedback {
		display: none;
		color: #dc3545;
		font-size: 0.875em;
	}
	
	.was-validated .form-control:invalid ~ .invalid-feedback {
		display: block;
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

                <p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">Add Lab</p>

                <form action="addlab" method="POST" class="mx-1 mx-md-4 needs-validation" novalidate>

                  <div class="mb-3">
                    <div class="form-outline flex-fill mb-0">
                    	<label class="form-label required-asterisk" for="form3Example1c">Lab Name</label>
                     	<input name="name" type="text" id="form3Example1c" class="form-control" required minlength="3" />
                     	<div class="invalid-feedback" id="nameFeedback">
							Lab name must be at least 3 characters long.
						</div>
                    </div>
                  </div>

                  <div class="mb-3">
                    <div class="form-outline flex-fill mb-0">
                    	<label class="form-label required-asterisk" for="form3Example3c">Area (City)</label>
                      	<input name="area" type="text" id="form3Example3c" class="form-control" required minlength="2" />
                      	<div class="invalid-feedback" id="areaFeedback">
							Area must be at least 2 characters long.
						</div>
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
(function () {
  'use strict';
  var forms = document.querySelectorAll('.needs-validation');
  Array.prototype.slice.call(forms).forEach(function (form) {
    form.addEventListener('submit', function (event) {
      var nameInput = form.querySelector('#form3Example1c');
      var areaInput = form.querySelector('#form3Example3c');
      var nameFeedback = form.querySelector('#nameFeedback');
      var areaFeedback = form.querySelector('#areaFeedback');

      // Reset feedback messages
      nameFeedback.textContent = 'Lab name must be at least 3 characters long.';
      areaFeedback.textContent = 'Area must be at least 2 characters long.';

      // Check if fields are empty
      if (!nameInput.value) {
        nameFeedback.textContent = 'Please enter the lab name.';
      }
      if (!areaInput.value) {
        areaFeedback.textContent = 'Please enter the area.';
      }

      if (!form.checkValidity()) {
        event.preventDefault();
        event.stopPropagation();
      }
      form.classList.add('was-validated');
    }, false);

    // Real-time validation for Lab Name
    form.querySelector('#form3Example1c').addEventListener('input', function (e) {
      var feedback = form.querySelector('#nameFeedback');
      if (!e.target.value) {
        feedback.textContent = 'Please enter the lab name.';
      } else if (e.target.value.length < 3) {
        feedback.textContent = 'Lab name must be at least 3 characters long.';
      } else {
        feedback.textContent = '';
      }
    });

    // Real-time validation for Area
    form.querySelector('#form3Example3c').addEventListener('input', function (e) {
      var feedback = form.querySelector('#areaFeedback');
      if (!e.target.value) {
        feedback.textContent = 'Please enter the area.';
      } else if (e.target.value.length < 2) {
        feedback.textContent = 'Area must be at least 2 characters long.';
      } else {
        feedback.textContent = '';
      }
    });
  });
})();
</script>

</body>
</html>