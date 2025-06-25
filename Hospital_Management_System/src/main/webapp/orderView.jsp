<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Your Orders</title>

<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">

<!-- Bootstrap Icons CDN -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css"
	rel="stylesheet">

<!-- JavaScript Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
	crossorigin="anonymous">
</script>

<style>
	.search-container {
		margin-bottom: 15px;
		display: flex;
		gap: 10px;
	}
	.search-container input {
		max-width: 400px; /* Longer search bar */
	}
	.btn i {
		margin-right: 5px; /* Space between icon and text */
	}
</style>
</head>
<body>

	<%@page import="java.sql.DriverManager"%>
	<%@page import="java.sql.ResultSet"%>
	<%@page import="java.sql.Statement"%>
	<%@page import="java.sql.Connection"%>

	<%
	String pid = request.getParameter("pid");
	String driverName = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/hospital";
	String user = "root";
	String pass = "1234";
	Connection con;

	try {
		Class.forName(driverName);
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	}

	Connection connection = null;
	Statement statement = null;
	Statement statement2 = null;
	ResultSet resultSet = null;
	ResultSet resultSet2 = null;
	%>
	
	<div class="px-4 py-5 text-center">
		<img class="d-block mx-auto mb-4" src="images/icons8-tasklist-96.png" alt="">
		<h1 class="display-5 fw-bold">YOUR ORDERS</h1>
		<div class="col-lg-6 mx-auto">
			<p class="lead mb-4">Here you can edit the order details, add tasks to the order, and you can edit or remove orders.</p>
		</div>
	</div>
	
	<div id="mmenu_screen" class="container-fluid main_container d-flex">
		<div class="row flex-fill">
			<div class="col-sm-2 h-100">
			</div>
			<div class="col-sm-8 h-100">
				<div class="card">
					<div class="card-body">
						<div class="search-container">
							<input type="text" id="searchInput" class="form-control" placeholder="Search by Patient Name or Medicine Name">
							<button id="searchButton" class="btn btn-primary btn-sm">Search</button>
						</div>

						<table class="table table-striped pb-5" id="orderTable">	
							<thead>
								<tr>
									<th scope="col">Order ID</th>
									<th style="display:none;" scope="col">Medicine ID</th>
									<th style="display:none;" scope="col">Patient ID</th>
									<th scope="col">Patient Name</th>
									<th scope="col">Address</th>
									<th scope="col">Contact Number</th>
									<th scope="col">Medicine Name</th>
									<th scope="col">Price</th>
									<th scope="col"></th>
									<th scope="col"></th>
								</tr>
							</thead>
							<tbody>
								<%
								try {
									connection = DriverManager.getConnection(url, user, pass);
									statement = connection.createStatement();
									statement2 = connection.createStatement();
									
									String sql = "select * from hospital.order where idpatient='" + pid + "'";
									resultSet = statement.executeQuery(sql);
									while (resultSet.next()) {
								%>
								<tr>
									<td class="align-middle"><%=resultSet.getString("idorder")%></td>
									<td style="display:none;" class="align-middle"><%=resultSet.getString("idmedicine")%></td>
									<td style="display:none;" class="align-middle"><%=resultSet.getString("idpatient")%></td>
									<td class="align-middle"><%=resultSet.getString("name")%></td>
									<td class="align-middle"><%=resultSet.getString("address")%></td>
									<td class="align-middle"><%=resultSet.getString("phone")%></td>
									
									<%
									try {
										String mid = resultSet.getString("idmedicine");
										String sql2 = "select * from medicine where idmedicine='" + mid + "'";
										resultSet2 = statement2.executeQuery(sql2);
										
										if (resultSet2.next()) {
									%>
									<td class="align-middle"><%=resultSet2.getString("mname")%></td>
									<td class="align-middle"><%=resultSet2.getString("price")%></td>
									<%
										}
									} catch (Exception e) {
										e.printStackTrace();
									}
									%>
									
									<td class="align-middle">
										<c:url value="orderUpdate.jsp" var="orderUpdate">
											<c:param name="oid" value='<%=resultSet.getString("idorder")%>'></c:param>
											<c:param name="mid" value='<%=resultSet.getString("idmedicine")%>'></c:param>
											<c:param name="pid" value='<%=resultSet.getString("idpatient")%>'></c:param>
											<c:param name="name" value='<%=resultSet.getString("name")%>'></c:param>
											<c:param name="address" value='<%=resultSet.getString("address")%>'></c:param>
											<c:param name="phone" value='<%=resultSet.getString("phone")%>'></c:param>
										</c:url>
										<a href="${orderUpdate}">
											<button class="btn btn-primary btn-icon" type="button" name="update"><i class="bi bi-pencil"></i></button>
										</a>
									</td>
									
									<td class="align-middle">
										<form action="orderDelete" method="POST">
											<div class="mb-3" style="display:none;">
												<label for="oidInput" class="form-label">Order ID</label><br>
												<input class="form-control" type="text" value='<%=resultSet.getString("idorder")%>' name="oid" id="oidInput" readonly>
											</div>
											<div class="mb-3" style="display:none;">
												<label for="pidInput" class="form-label">Patient ID</label><br>
												<input class="form-control" type="text" value='<%=resultSet.getString("idpatient")%>' name="pid" id="pidInput" readonly>
											</div>
											<button class="btn btn-outline-danger btn-icon" type="submit" name="submit"><i class="bi bi-trash"></i></button>
										</form>
									</td>
								</tr>
								<%
									}
								} catch (Exception e) {
									e.printStackTrace();
								}
								%>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="col-sm-2 mmenu_screen--direktaction flex-fill">
			</div>
		</div>
	</div>

	<script>
		(function () {
			'use strict';
			const searchInput = document.getElementById('searchInput');
			const searchButton = document.getElementById('searchButton');
			const table = document.getElementById('orderTable');
			const rows = table.querySelectorAll('tbody tr');

			searchButton.addEventListener('click', function () {
				const searchTerm = searchInput.value.toLowerCase();

				rows.forEach(row => {
					const patientName = row.cells[3].textContent.toLowerCase(); // Patient Name column
					const medicineName = row.cells[6].textContent.toLowerCase(); // Medicine Name column

					if (patientName.includes(searchTerm) || medicineName.includes(searchTerm)) {
						row.style.display = '';
					} else {
						row.style.display = 'none';
					}
				});
			});

			// Clear search and show all rows when input is cleared
			searchInput.addEventListener('input', function () {
				if (searchInput.value === '') {
					rows.forEach(row => {
						row.style.display = '';
					});
				}
			});
		})();
	</script>

</body>
</html>