package com.candidates;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.connection.DatabaseConnection;

/**
 * Servlet implementation class DeclareWinnerCandidate
 */
@WebServlet("/DeclareWinnerCandidate")
public class DeclareWinnerCandidate extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String candidateId=request.getParameter("id");
		
		try {
			int declareResult=DatabaseConnection.insertUpdateFromSqlQuery("update tblcandidate set result=1 where candidate_id='"+candidateId+"'");
			if(declareResult>0) {
				response.sendRedirect("admin-declare-winning-candidate.jsp");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	

}
