package com.voter;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.DatabaseConnection;


@WebServlet("/AccountCreate")
public class AccountCreate extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String voterId=request.getParameter("voterId");
		String voterName = request.getParameter("voterName");
		String gender=request.getParameter("optionsRadios");
		String dob=request.getParameter("dob");
		String vemail = request.getParameter("emailId");
		String vmobile = request.getParameter("mobile");
		String vaddress = request.getParameter("address");
		String uname = request.getParameter("uname");
		String upass = request.getParameter("upass");
		HttpSession hs = request.getSession();
		
		try {
			int patientAccount=DatabaseConnection.insertUpdateFromSqlQuery("insert into tblvoter(voter_id,voter_name,voter_gender,voter_dob,voter_email,voter_mobile,voter_address,uname,upass) values('"+voterId+"','"+voterName+"','"+gender+"','"+dob+"','"+vemail+"','"+vmobile+"','"+vaddress+"','"+uname+"','"+upass+"')");
			if(patientAccount>0) {
				String message="Voter account created successfully.";
				hs.setAttribute("success-message", message);
				response.sendRedirect("voter-registration.jsp");
			}else {
				response.sendRedirect("voter-registration.jsp");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}
