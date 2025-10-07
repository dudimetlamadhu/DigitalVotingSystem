<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.connection.*"%>
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
<script>
        function calculateAge(dob) {
            const today = new Date();
            const birthDate = new Date(dob);
            let age = today.getFullYear() - birthDate.getFullYear();
            const monthDifference = today.getMonth() - birthDate.getMonth();

            if (monthDifference < 0 || (monthDifference === 0 && today.getDate() < birthDate.getDate())) {
                age--;
            }

            return age;
        }

        function validateAge() {
            const birthdate = document.getElementById("dob").value;
            const age = calculateAge(birthdate);

            if (age >= 18) {
                //alert("The person is 18 years old or older.");
                return true;
            } else {
                alert("The person is younger than 18 years old.");
                return false;
            }
        }
</script>
</head>
<body class="host_version">
	<jsp:include page="header.jsp"></jsp:include><br>
	<div class="container">
		<div class="row pad-botm">
			<div class="col-md-12">
				<h4 class="header-line">Voter Registration</h4>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6 col-sm-6 col-xs-12">
				<img src="images/registration.png">
			</div>
			<div class="col-md-6 col-sm-6 col-xs-12">
				<%
					String adminRegister = (String) session.getAttribute("success-message");
					if (adminRegister != null) {
					session.removeAttribute("success-message");
				%>
				<div class="alert alert-success" id="success">Voter account
					created successfully.</div>
				<%
					}
				%>
				<div class="panel panel-default">
					<div class="panel-heading">Create Voter Account</div>
					<div class="panel-body">
						<form role="form" action="AccountCreate" method="post"
							name='AccountCreate'>
							<div class="form-group">
								<label>Voter Id</label>
								<%
									String voterId = DatabaseConnection.generateVoterId();
								%>
								<input class="form-control" type="text" value="<%=voterId%>"
									name="voterId" readonly />
							</div>
							<div class="form-group">
								<label>Voter Name</label> <input class="form-control"
									type="text" name="voterName" id="voterName"
									placeholder="Voter Name" required
									onkeypress="return lettersValidate(event)" />
							</div>
							<div class="form-group">
								<label>Gender</label>&nbsp; Male&nbsp;<input type="radio"
									name="optionsRadios" id="" value="Male" checked="">&nbsp;
								Female&nbsp;<input type="radio" name="optionsRadios" id=""
									value="Female">
							</div>
							<div class="form-group">
								<label>Date of Birth</label> <input class="form-control"
									type="date" name="dob" id="dob" onblur="return validateAge()" required />
							</div>
							<div class="form-group">
								<label>Email Id</label> <input class="form-control" type="email"
									name="emailId" placeholder="Email Id" id="emailId" required
									pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" />
							</div>
							<div class="form-group">
								<label>Mobile No</label> <input class="form-control" type="text"
									name="mobile" id="txtMB" placeholder="Mobile No" required
									onkeypress="return numberValidate(event)" maxlength="10" />
							</div>
							<div class="form-group">
								<label>Address</label> <input class="form-control" type="text"
									name="address" id="address" placeholder="Address" required />
							</div>
							<div class="form-group">
								<label>User Name</label> <input class="form-control" type="text"
									name="uname" id="uname" placeholder="User Name" required
									onkeypress="return lettersValidate(event)" />
							</div>
							<div class="form-group">
								<label>Password</label> <input class="form-control"
									type="password" name="upass" id="upass" placeholder="Password"
									required oninput="limitChar(this)" maxlength="12">
							</div>
							<button type="submit" class="btn btn-info" id="btnValidate">Create
								Account</button>
							<a class="for-pwd" href="voter-login.jsp">Already
								registered,Please Login</a>
						</form>
					</div>
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
	<jsp:include page="footer.jsp"></jsp:include>
</body>
<script type="text/javascript">
	$(function() {
		$('#danger').delay(3000).show().fadeOut('slow');
	});

	$(function() {
		$('#success').delay(3000).show().fadeOut('slow');
	});

	$(function() {
		$('#info').delay(3000).show().fadeOut('slow');
	});
</script>
<script type="text/javascript">
		$(function() {
			$('#danger').delay(3000).show().fadeOut('slow');
		});

		$(function() {
			$('#info').delay(3000).show().fadeOut('slow');
		});
		$(function() {
			$('#success').delay(3000).show().fadeOut('slow');
		});
	</script>
<script type="text/javascript">
		let limitChar = (element) => {
	        const maxChar = 12;
	        
	        let ele = document.getElementById(element.id);
	        let charLen = ele.value.length;
	        
	        let p = document.getElementById('charCounter');
	        p.innerHTML = maxChar - charLen + ' characters remaining';
	        
	        if (charLen > maxChar) 
	        {
	            ele.value = ele.value.substring(0, maxChar);
	            p.innerHTML = 0 + ' characters remaining'; 
	        }
	    }
		let limitNumber = (element) => {
	        const maxNumber = 6;
	        
	        let ele = document.getElementById(element.id);
	        let numberLen = ele.value.length;
	        
	        let p = document.getElementById('numberCounter');
	        p.innerHTML = maxNumber - numberLen + ' number remaining';
	        
	        if (numberLen > maxNumber) 
	        {
	            ele.value = ele.value.substring(0, maxNumber);
	            p.innerHTML = 0 + ' number remaining'; 
	        }
	    }
		function lettersValidate(key) {
	    	var keycode = (key.which) ? key.which : key.keyCode;
	   		if ((keycode > 64 && keycode < 91) || (keycode > 96 && keycode < 123) || keycode == 32)  
	    	{     
	           return true;    
	    	}else{
	           return false;
	    	}    
	    }
		function numberValidate(key) {
	    	var keycode = (key.which) ? key.which : key.keyCode;
	   		if ((keycode > 47 && keycode < 58))  
	    	{     
	           return true;    
	    	}else{
	           return false;
	    	} 
	    }
	</script>
<script>
	 $(document).ready(function() {
         $("#btnValidate").click(function() {
             var voterName = $("#voterName").val();
             var dob = $("#dob").val();
             var emailId = $("#emailId").val();
             var txtMB = $("#txtMB").val();
             var address = $("#address").val();
             var uname = $("#uname").val();
             var upass = $("#upass").val();

             if (voterName === "" || dob === "" || emailId === "" || txtMB === "" || address === "" || uname === "" || upass === "")
             {
                 $("#voterName").css("border-color", "red");
                 $("#dob").css("border-color", "red");
                 $("#emailId").css("border-color", "red");
                 $("#txtMB").css("border-color", "red");
                 $("#address").css("border-color", "red");
                 $("#uname").css("border-color", "red");
                 $("#upass").css("border-color", "red");
                 alert("All fields are mandatory.");
                 return false;
             }
         });
     });                                              
	</script>
	<script>
		function myFunction() {
		  var x = document.getElementById("emailId").pattern;
		  document.getElementById("demo").innerHTML = x;
		  
		}
	</script>
</html>