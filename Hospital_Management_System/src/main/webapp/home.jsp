<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Hospital Management System</title>

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
<body style="padding-left: 80px; padding-right: 80px; padding-bottom: 20px;">

	<%@page import="java.sql.DriverManager"%>
	<%@page import="java.sql.ResultSet"%>
	<%@page import="java.sql.Statement"%>
	<%@page import="java.sql.Connection"%>

	<c:forEach var="p" items="${pDetails}">
		<c:set var="id" value="${p.id}" />
	</c:forEach>
	
	<%
	String pid = request.getParameter("id");
	String driverName = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/hospital";
	String user = "root";
	String pass = "1234";
	Connection con;
	String pID = pid;

	try {
		Class.forName(driverName);
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	}

	Connection connection = null;
	Statement statement = null;
	ResultSet resultSet = null;
	ResultSet resultSet2 = null;
	ResultSet resultSet3 = null;
	%>

	<div class="px-4 py-5 text-center">
		<img class="d-block mx-auto mb-4" src="images/icons8-health-64.png" alt="">
		<h1 class="display-5 fw-bold">Hospital Management System</h1>
		<div class="col-lg-6 mx-auto">
			<p class="lead mb-4">The Hospital Management System at present
				includes a doctor Channeling System and Service that has been
				implemented in 260-plus hospitals both Private and Ayurvedic; over
				5500 doctors; 2000-plus channeling agents; a Hospital Information
				system; and a mobile application.</p>
		</div>
	</div>

	<!-- Channeling Section -->
	<div class="card">
		<div class="card-body">
			<div id="mmenu_screen" class="container-fluid main_container d-flex">
				<div class="row flex-fill">
					<div class="col-sm-4 h-100" style="padding-left: 0px; padding-right: 0px;">
						<div class="card">
							<div class="card-body">
								<form action="addAppoinment" method="POST" class="needs-validation" novalidate>
									<label class="form-label"><b>ADD APPOINTMENT</b></label>
									<div style="display: none;" class="mb-3">
										<label for="pid" class="form-label">Patient ID</label><br>
										<input class="form-control" type="text" value='${id}' name="pid" id="pid" readonly>
									</div>
									<div class="mb-3">
										<label class="form-label required-asterisk" for="pname">Channeling Name</label>
										<input class="form-control" type="text" name="pname" id="pname" placeholder="Enter name" required minlength="3">
										<div class="invalid-feedback" id="pnameFeedback">
											Channeling name must be at least 3 characters long.
										</div>
									</div>
									<div class="mb-3">
										<label class="form-label required-asterisk" for="age">Patient Age</label>
										<input class="form-control" type="number" name="age" id="age" placeholder="Type the age" required min="1" max="150">
										<div class="invalid-feedback" id="ageFeedback">
											Please enter a valid age (1-150).
										</div>
									</div>
									<div class="mb-3">
										<label class="form-label required-asterisk" for="select">Select Doctor</label>
										<div id="emailHelp" class="form-text">Select doctor from the list below.</div>
										<select class="form-control" name="select" id="select" required>
											<%
											try {
												connection = DriverManager.getConnection(url, user, pass);
												statement = connection.createStatement();
												String sql = "SELECT iddoctor, dname, type from doctor;";
												resultSet = statement.executeQuery(sql);
												while (resultSet.next()) {
											%>
											<option value="<%=resultSet.getString("iddoctor")%>"><%=resultSet.getString("dname")%>, (<%=resultSet.getString("type")%>)</option>
											<%
											}
											} catch (Exception e) {
												e.printStackTrace();
											}
											%>
										</select>
										<div class="invalid-feedback" id="selectFeedback">
											Please select a doctor.
										</div>
									</div>
									<div class="mb-3">
										<label class="form-label required-asterisk" for="date">Channel Date</label>
										<input class="form-control" type="date" name="date" id="date" required>
										<div class="invalid-feedback" id="dateFeedback">
											Please select a valid future date.
										</div>
									</div>
									<input class="w-100 btn btn-primary" type="submit" name="submit" value="Add Appointment">
								</form>
							</div>
						</div>
					</div>
					<div class="col-sm-4 mmenu_screen--direktaction flex-fill">
						<div class="px-4 py-5 text-center">
							<img class="d-block mx-auto mb-4" src="images/18707003_TaeAugust11.jpg" alt="" width="auto" height="250">
							<h1 class="display-5 fw-bold">Appointments</h1>
							<div class="col-lg-6 mx-auto">
								<div class="d-grid gap-2 d-sm-flex justify-content-sm-center">
									<form action="viewAppoinment" method="POST">
										<div class="mb-3" style="display: none;">
											<label for="viewPid" class="form-label">Patient ID</label><br>
											<input class="form-control" type="text" value='${id}' name="pid" id="viewPid" readonly>
										</div>
										<input class="btn btn-primary px-4 gap-3" type="submit" name="submit" value="View Appointments">
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br>

	<!-- Order Section -->
	<div class="card">
		<div class="card-body">
			<div id="mmenu_screen" class="container-fluid main_container d-flex">
				<div class="row flex-fill">
					<div class="col-sm-4 h-100" style="padding-left: 0px; padding-right: 0px;">
						<div class="card" style="height: 555px;">
							<div class="card-body">
								<form action="addorder" method="POST" class="needs-validation" novalidate>
									<label class="form-label"><b>Order Medicine</b></label>
									<div class="mb-3" style="display: none;">
										<label for="orderPid" class="form-label">Patient ID</label>
										<input class="form-control" type="text" value='${id}' name="pid" id="orderPid" readonly>
									</div>
									<div class="mb-3">
										<label class="form-label required-asterisk" for="receiverName">Receiver Name</label>
										<input class="form-control" type="text" name="name" id="receiverName" placeholder="Enter name" required minlength="3">
										<div class="invalid-feedback" id="receiverNameFeedback">
											Receiver name must be at least 3 characters long.
										</div>
									</div>
									<div class="mb-3">
										<label class="form-label required-asterisk" for="orderPhone">Contact Number</label>
										<input class="form-control" type="text" name="phone" id="orderPhone" placeholder="Enter Number" required pattern="(\+94)?[0-9]{9,10}">
										<div class="invalid-feedback" id="orderPhoneFeedback">
											Please enter a valid phone number (e.g., +94xxxxxxxxx or 10 digits).
										</div>
									</div>
									<div class="mb-3">
										<label class="form-label required-asterisk" for="address">Address</label>
										<input class="form-control" type="text" name="address" id="address" placeholder="Enter Address" required minlength="5">
										<div class="invalid-feedback" id="addressFeedback">
											Address must be at least 5 characters long.
										</div>
									</div>
									<div class="mb-3">
										<label class="form-label required-asterisk" for="mid">Select Medicine</label>
										<div id="emailHelp" class="form-text">Select Medicine you need to order from the list below.</div>
										<select class="form-control" name="mid" id="mid" required>
											<%
											try {
												connection = DriverManager.getConnection(url, user, pass);
												statement = connection.createStatement();
												String sql3 = "SELECT idmedicine,mname,price from medicine;";
												resultSet3 = statement.executeQuery(sql3);
												while (resultSet3.next()) {
											%>
											<option value="<%=resultSet3.getString("idmedicine")%>"><%=resultSet3.getString("mname")%> - Rs.<%=resultSet3.getString("price")%></option>
											<%
											}
											} catch (Exception e) {
												e.printStackTrace();
											}
											%>
										</select>
										<div class="invalid-feedback" id="midFeedback">
											Please select a medicine.
										</div>
									</div>
									<input class="w-100 btn btn-primary" type="submit" name="submit" value="Order">
								</form>
							</div>
						</div>
					</div>
					<div class="col-sm-4 mmenu_screen--direktaction flex-fill">
						<div class="px-4 py-5 text-center">
							<img class="d-block mx-auto mb-4" src="images/9650843_7882.jpg" alt="" width="auto" height="300">
							<h1 class="display-5 fw-bold">Order Medicine</h1>
							<div class="col-lg-6 mx-auto">
								<div class="d-grid gap-2 d-sm-flex justify-content-sm-center">
									<form action="orderView.jsp" method="POST">
										<div class="mb-3" style="display: none;">
											<label for="orderViewPid" class="form-label">Patient ID</label><br>
											<input class="form-control" type="text" value='${id}' name="pid" id="orderViewPid" readonly>
										</div>
										<input class="btn btn-primary px-4 gap-3" type="submit" name="submit" value="View Orders">
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="footer-basic">
		<p class="copyright">ABC Hospital pvt.LTD @2025</p>
	</div>

	<script>
		(function () {
			'use strict';
			const forms = document.querySelectorAll('.needs-validation');
			const today = new Date().toISOString().split('T')[0];

			Array.prototype.slice.call(forms).forEach(function (form) {
				// Set min date for Channel Date to today
				const dateInput = form.querySelector('#date');
				if (dateInput) {
					dateInput.setAttribute('min', today);
				}

				form.addEventListener('submit', function (event) {
					const pnameInput = form.querySelector('#pname');
					const ageInput = form.querySelector('#age');
					const selectInput = form.querySelector('#select');
					const dateInput = form.querySelector('#date');
					const testNameInput = form.querySelector('#testName');
					const labInput = form.querySelector('#lab');
					const phoneInput = form.querySelector('#phone');
					const receiverNameInput = form.querySelector('#receiverName');
					const orderPhoneInput = form.querySelector('#orderPhone');
					const addressInput = form.querySelector('#address');
					const midInput = form.querySelector('#mid');

					// Reset feedback messages
					if (pnameInput) {
						pnameInput.nextElementSibling.textContent = pnameInput.value ? 'Channeling name must be at least 3 characters long.' : 'Please enter the channeling name.';
					}
					if (ageInput) {
						ageInput.nextElementSibling.textContent = ageInput.value ? 'Please enter a valid age (1-150).' : 'Please enter the patient age.';
					}
					if (selectInput) {
						selectInput.nextElementSibling.textContent = 'Please select a doctor.';
					}
					if (dateInput) {
						dateInput.nextElementSibling.textContent = dateInput.value ? 'Please select a valid future date.' : 'Please select a date.';
					}
					if (testNameInput) {
						testNameInput.nextElementSibling.textContent = testNameInput.value ? 'Test name must be at least 3 characters long.' : 'Please enter the test name.';
					}
					if (labInput) {
						labInput.nextElementSibling.textContent = 'Please select a lab.';
					}
					if (phoneInput) {
						phoneInput.nextElementSibling.textContent = phoneInput.value ? 'Please enter a valid phone number (e.g., +94xxxxxxxxx or 10 digits).' : 'Please enter a contact number.';
					}
					if (receiverNameInput) {
						receiverNameInput.nextElementSibling.textContent = receiverNameInput.value ? 'Receiver name must be at least 3 characters long.' : 'Please enter the receiver name.';
					}
					if (orderPhoneInput) {
						orderPhoneInput.nextElementSibling.textContent = orderPhoneInput.value ? 'Please enter a valid phone number (e.g., +94xxxxxxxxx or 10 digits).' : 'Please enter a contact number.';
					}
					if (addressInput) {
						addressInput.nextElementSibling.textContent = addressInput.value ? 'Address must be at least 5 characters long.' : 'Please enter an address.';
					}
					if (midInput) {
						midInput.nextElementSibling.textContent = 'Please select a medicine.';
					}

					if (!form.checkValidity()) {
						event.preventDefault();
						event.stopPropagation();
					}
					form.classList.add('was-validated');
				}, false);

				// Real-time validation
				function addRealTimeValidation(input, feedback, validateFn, emptyMessage, invalidMessage) {
					if (input) {
						input.addEventListener('input', function () {
							const value = input.value;
							const feedbackElement = input.nextElementSibling;
							if (!value) {
								feedbackElement.textContent = emptyMessage;
							} else if (!validateFn(value)) {
								feedbackElement.textContent = invalidMessage;
							} else {
								feedbackElement.textContent = '';
							}
						});
					}
				}

				// Add Appointment Form
				addRealTimeValidation(
					form.querySelector('#pname'),
					form.querySelector('#pnameFeedback'),
					value => value.length >= 3,
					'Please enter the channeling name.',
					'Channeling name must be at least 3 characters long.'
				);
				addRealTimeValidation(
					form.querySelector('#age'),
					form.querySelector('#ageFeedback'),
					value => value >= 1 && value <= 150,
					'Please enter the patient age.',
					'Please enter a valid age (1-150).'
				);
				addRealTimeValidation(
					form.querySelector('#date'),
					form.querySelector('#dateFeedback'),
					value => value >= today,
					'Please select a date.',
					'Please select a valid future date.'
				);

				// Request Lab Test Form
				addRealTimeValidation(
					form.querySelector('#testName'),
					form.querySelector('#testNameFeedback'),
					value => value.length >= 3,
					'Please enter the test name.',
					'Test name must be at least 3 characters long.'
				);
				addRealTimeValidation(
					form.querySelector('#phone'),
					form.querySelector('#phoneFeedback'),
					value => /^(\+94)?[0-9]{9,10}$/.test(value),
					'Please enter a contact number.',
					'Please enter a valid phone number (e.g., +94xxxxxxxxx or 10 digits).'
				);

				// Order Medicine Form
				addRealTimeValidation(
					form.querySelector('#receiverName'),
					form.querySelector('#receiverNameFeedback'),
					value => value.length >= 3,
					'Please enter the receiver name.',
					'Receiver name must be at least 3 characters long.'
				);
				addRealTimeValidation(
					form.querySelector('#orderPhone'),
					form.querySelector('#orderPhoneFeedback'),
					value => /^(\+94)?[0-9]{9,10}$/.test(value),
					'Please enter a contact number.',
					'Please enter a valid phone number (e.g., +94xxxxxxxxx or 10 digits).'
				);
				addRealTimeValidation(
					form.querySelector('#address'),
					form.querySelector('#addressFeedback'),
					value => value.length >= 5,
					'Please enter an address.',
					'Address must be at least 5 characters long.'
				);
			});
		})();
	</script>
</body>
</html>