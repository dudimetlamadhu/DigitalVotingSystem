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
		<div class="container">
			<div class="row pad-botm">
				<div class="col-md-12">
					<h4 class="header-line">ADMIN DASHBOARD</h4>
				</div>
				<div class="row">

					<div class="col-md-4 col-sm-4 col-xs-6">
						<div class="alert alert-info back-widget-set text-center">
							<%
								ResultSet rs = DatabaseConnection.getResultFromSqlQuery("select count(*) from tblcandidate");
								rs.next();
								int candidate = rs.getInt(1);
							%>
							<i class="fa fa-history fa-5x"></i>
							
							<h3>
								<%=candidate %>
							</h3>
							Total Candidates
						</div>
					</div>
					<div class="col-md-4 col-sm-4 col-xs-6">
						<div class="alert alert-success back-widget-set text-center">
							<%
								ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select count(*) from tblvoter");
								resultset.next();
								int voters = resultset.getInt(1);
							%>
							<i class="fa fa-bars fa-5x"></i>
							<h3><%=voters %></h3>
							Total Voters
						</div>
					</div>
					
					<div class="col-md-4 col-sm-4 col-xs-6">
						<div class="alert alert-danger back-widget-set text-center">
							<%
								ResultSet resultsetAll = DatabaseConnection.getResultFromSqlQuery("select count(*) from tblvoting");
								resultsetAll.next();
								int totalVoting = resultsetAll.getInt(1);
							%>
							<i class="fa fa-briefcase fa-5x"></i>
							<h3><%=totalVoting %></h3>
							All Voting
						</div>
					</div>
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="alert alert-warning back-widget-set text-center">
							<a href="view-results.jsp">Click Here To Check Voting Result Party Wise</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div><br><br><br><br><br><br><br><br><br>
	<jsp:include page="footer.jsp"></jsp:include>
	<%
		} else {
	response.sendRedirect("index.jsp");
	}
	%>
</body>
</html>