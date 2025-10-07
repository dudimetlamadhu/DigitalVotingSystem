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
	<jsp:include page="voter-header.jsp"></jsp:include>
	<div class="content-wrapper">
		<div class="container">
			<div class="row pad-botm">
				<div class="col-md-12">
					<h4 class="header-line">Give Your Vote</h4>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="panel panel-info">
							<div class="panel-heading">Give Your Vote</div>
							<div class="panel-body">
								<%
									String fillVoting = (String) session.getAttribute("voted");
									if (fillVoting != null) {
										session.removeAttribute("voted");
								%>
								<div class="alert alert-info" id="info">You have Voted
									successfully.</div>
								<%
									}
								%>
								<%
									String already = (String) session.getAttribute("already-voted");
									if (already != null) {
										session.removeAttribute("already-voted");
								%>
								<div class="alert alert-danger" id="danger">Already Voted.</div>
								<%
									}
								%>
								<div class="table-responsive">
									<form action="FillVotingToParty" method="post">
										<table class="table">
											<thead>
												<tr>
													<th>Candidate Id</th>
													<th>Candidate Full Name</th>
													<th>Party Name</th>
													<th>Party Logo</th>
													<th>Action</th>
												</tr>
											</thead>
											<%
												ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select * from tblcandidate where status='Approved'");
												while (resultset.next()) {
											%>
											<tbody>
												<tr>
													<td><%=resultset.getString("candidate_id")%></td>
													<td><%=resultset.getString("candidate_name")%></td>
													<td><%=resultset.getString("candidate_party_name")%></td>
													<td><image src="uploads/<%=resultset.getString("candidate_party_logo_name")%>" width="100" height="70"></image></td>
													<td><input type="radio" name="vote" value="<%=resultset.getString("candidate_party_name")%>"></td>
												</tr>
											</tbody>
											<%
												}
											%>
											<tr>
												<td>&nbsp;</td>
												<td>&nbsp;</td>
												<td><input type="submit" value="Give Vote"
													class="btn btn-info"></td>
												<td>&nbsp;</td>
												<td>&nbsp;</td>
											</tr>
										</table>
									</form>
								</div>
							</div>
						</div>
						<!-- End  Basic Table  -->
					</div>
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
<script type="text/javascript">
	$(function() {
		$('#danger').delay(3000).show().fadeOut('slow');
	});

	$(function() {
		$('#info').delay(3000).show().fadeOut('slow');
	});
</script>
</html>