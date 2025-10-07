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
	<jsp:include page="header.jsp"></jsp:include>
	<div class="content-wrapper">
		<div class="container-fluid">
			<div class="row pad-botm">
				<div class="col-md-12">
					<h4 class="header-line">Winner Candidate</h4>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<!--   Basic Table  -->
					<div class="panel panel-default">
						<div class="panel-heading">Winner Candidate</div>
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
										</tr>
									</thead>
									<%
										ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select * from tblcandidate where result=1");
										while (resultset.next()) {
									%>
									<tbody>
										<tr>
											<td><%=resultset.getString("candidate_id")%></td>
											<td><%=resultset.getString("candidate_name")%></td>
											<td><%=resultset.getString("candidate_email")%></td>
											<td><%=resultset.getString("candidate_mobile")%></td>
											<td><%=resultset.getString("candidate_party_name")%></td>
											<td><image src="uploads/<%=resultset.getString("candidate_party_logo_name")%>" width="100" height="70"></image></td>
											<%
												if (resultset.getInt("result")==0) {
											%>
											<td><span class="label label-danger">Not Declare</span></td>

											<%
												} else {
											%><td><span class="label label-success">Winner</span></td>

											<%
												}
											%>
											<%
												if (resultset.getInt("result")==0) {
											%>
											<td><a href="DeclareWinnerCandidate?id=<%=resultset.getString("candidate_id")%>"><button class="btn btn-info" onClick="return confirm('Are you sure, you want to declare winning candidate?');">Declare Winner</button></a></td>
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
</body>
</html>