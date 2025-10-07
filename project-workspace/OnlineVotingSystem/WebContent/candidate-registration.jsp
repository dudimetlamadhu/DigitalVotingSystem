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

</head>
<body class="host_version">
	<jsp:include page="header.jsp"></jsp:include><br>
	<div class="container">
		<div class="row pad-botm">
			<div class="col-md-12">
				<h4 class="header-line">Candidate Registration</h4>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6 col-sm-6 col-xs-12">
				<img src="images/registration.png">
			</div>
			<div class="col-md-6 col-sm-6 col-xs-12">
				<%
					String candidateRegister = (String) session.getAttribute("success-message");
				if (candidateRegister != null) {
					session.removeAttribute("success-message");
				%>
				<div class="alert alert-success" id="success">Candidate
					registration successfully.</div>
				<%
					}
				%>
				<div class="panel panel-info">
					<div class="panel-heading">Candidate Account</div>
					<div class="panel-body">
						<form role="form" action="CandidateRegistration" method="post"
							enctype="multipart/form-data">
							<div class="form-group">
								<label>Candidate Id</label>
								<%
									String candidateId = DatabaseConnection.generateCandidateId();
								%>
								<input class="form-control" type="text" value="<%=candidateId%>"
									name="candidateId" readonly />
							</div>
							<div class="form-group">
								<label>Candidate Name</label> <input class="form-control"
									type="text" name="candidateName" id="candidateName" placeholder="Candidate Name"
									required onkeypress="return lettersValidate(event)" />
							</div>
							<div class="form-group">
								<label>Email Id</label> <input class="form-control" type="text"
									name="emailId" id="emailId"
									pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$"
									placeholder="Email Id" required />
							</div>
							<div class="form-group">
								<label>Mobile No</label> <input class="form-control" type="text"
									name="mobile" id="txtMB" maxlength="10" placeholder="Mobile No"
									required onkeypress="return numberValidate(event)" maxlength="10"/>
							</div>
							<div class="form-group">
								<label>Candidate Party Name</label> <input class="form-control"
									type="text" name="cpname" id="cpname" placeholder="Candidate Party Name"
									required onkeypress="return lettersValidate(event)"/>
							</div>
							<div class="form-group">
								<label>Candidate Party Logo</label> <input class="form-control"
									type="file" name="logo" id="logo" required/>
							</div>
							<button type="submit" class="btn btn-info" id="btnValidate">Send
								Request To Admin For Registration</button>
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
             var candidateName = $("#candidateName").val();
             var emailId = $("#emailId").val();
             var txtMB = $("#txtMB").val();
             var cpname = $("#cpname").val();
             var logo = $("#logo").val();
            

             if (candidateName === "" || emailId === "" || txtMB === "" || cpname === "" || logo === "")
             {
                 $("#candidateName").css("border-color", "red");
                 $("#emailId").css("border-color", "red");
                 $("#txtMB").css("border-color", "red");
                 $("#cpname").css("border-color", "red");
                 $("#logo").css("border-color", "red");
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
<script>
	//This function will validate Email.
	function ValidateEmail() {
		var uemail = document.patientRegister.emailId;
		var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
		if (uemail.value.match(mailformat)) {
			document.patientRegister.desc.focus();
			return true;
		} else {
			alert("Please enter valid email id.!");
			uemail.focus();
			return false;
		}
	}

	function ValidateMobNumber(txtMobId) {
		var fld = document.getElementById(txtMobId);
		if (fld.value == "") {
			alert("You didn't enter a phone number.");
			fld.value = "";
			fld.focus();
			return false;
		} else if (isNaN(fld.value)) {
			alert("The phone number contains illegal characters.");
			fld.value = "";
			fld.focus();
			return false;
		} else if (!(fld.value.length == 10)) {
			alert("The phone number is the wrong length. \nPlease enter 10 digit mobile no.");
			fld.value = "";
			fld.focus();
			return false;
		}

	}
</script>

</html>