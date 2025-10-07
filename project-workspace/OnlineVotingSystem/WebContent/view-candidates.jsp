<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.connection.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">

<!-- Basic -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- Mobile Metas -->
<meta name="viewport"
	content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

<!-- Site Metas -->
<title>Online Voting System</title>
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="author" content="">

<!-- Site Icons -->
<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />
<link rel="apple-touch-icon" href="images/apple-touch-icon.png">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- Site CSS -->
<link rel="stylesheet" href="style.css">
<!-- Colors CSS -->
<link rel="stylesheet" href="css/colors.css">
<!-- ALL VERSION CSS -->
<link rel="stylesheet" href="css/versions.css">
<!-- Responsive CSS -->
<link rel="stylesheet" href="css/responsive.css">
<!-- Custom CSS -->
<link rel="stylesheet" href="css/custom.css">

<!-- Modernizer for Portfolio -->
<script src="js/modernizer.js"></script>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>
<body class="host_version">
	<%
		if (session.getAttribute("uname") != null && session.getAttribute("uname") != "") {
	%>
	<jsp:include page="admin-header.jsp"></jsp:include>
	<div class="content-wrapper">
		<div class="container-fluid">
			<div class="row pad-botm">
				<div class="col-md-12">
					<h4 class="header-line">View Candidates</h4>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<!--   Basic Table  -->
					<div class="panel panel-default">
						<div class="panel-heading">View Candidates</div>
						<div class="panel-body">
							<div class="table-responsive">
								<table class="table">
									<thead>
										<tr>
											<th>Candidate Id</th>
											<th>Full Name</th>
											<th>Email Id</th>
											<th>Mobile No</th>
											<th>Party Name</th>
											<th>Party Logo</th>
											<th>Status</th>
											<th>Created At</th>
											<th>Updated At</th>
											<th>Action</th>
										</tr>
									</thead>
									<%
										ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select * from tblcandidate");
										while (resultset.next()) {
									%>
									<tbody>
										<tr>
											<td><%=resultset.getString("candidate_id")%></td>
											<td><%=resultset.getString("candidate_name")%></td>
											<td><%=resultset.getString("candidate_email")%></td>
											<td><%=resultset.getString("candidate_mobile")%></td>
											<td><%=resultset.getString("candidate_party_name")%></td>
											<td><image src="uploads/<%=resultset.getString("candidate_party_logo_name")%>"
													width="100" height="70"></image></td>
											<%
												if (resultset.getString("status").equals("Pending")) {
											%>
											<td><span class="label label-danger"><%=resultset.getString("status")%></span></td>

											<%
												} else {
											%><td><span class="label label-success"><%=resultset.getString("status")%></span></td>

											<%
												}
											%>
											<td><%=resultset.getString("created_at")%></td>
											<td><%=resultset.getString("updated_at")%></td>
											<%
												if (resultset.getString("status").equals("Approved")) {
											%>
											<td><a href="ManageCandidates?id=<%=resultset.getString("candidate_id")%>"><button class="btn btn-danger" onClick="return confirm('Are you sure, you want to cancel candidate?');">Cancel</button></a></td>
											<%
												} else {
											%>
											<td><a href="ManageCandidates?id=<%=resultset.getString("candidate_id")%>"><button class="btn btn-primary" onClick="return confirm('Are you sure, you want to approve candidate?');">Approve</button></a></td>
											<%
												}
											%>
										</tr>
									</tbody>
									<%
										}
									%>
								</table>
							</div>
						</div>
					</div>
					<!-- End  Basic Table  -->
				</div>
			</div>
		</div>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<jsp:include page="footer.jsp"></jsp:include>
	<%
		} else {
	response.sendRedirect("index.jsp");
	}
	%>
</body>
</html>