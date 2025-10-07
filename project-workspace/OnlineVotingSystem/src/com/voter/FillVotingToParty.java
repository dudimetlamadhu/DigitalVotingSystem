package com.voter;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.*;
import com.connection.DatabaseConnection;

/**
 * Servlet implementation class FillVotingToParty
 */
@WebServlet("/FillVotingToParty")
public class FillVotingToParty extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = 0;
		int fillVote = 0;
		String voterUname=null;
		String candidateName=null;
		String vote = request.getParameter("vote");
		HttpSession session = request.getSession();
		String uname = (String)session.getAttribute("uname");
		
		try {
			ResultSet rs=DatabaseConnection.getResultFromSqlQuery("select candidate_name from tblcandidate where candidate_party_name='"+vote+"'");
			if(rs.next()) {
				candidateName=rs.getString("candidate_name");
			}
			ResultSet resultset=DatabaseConnection.getResultFromSqlQuery("select * from tblvoting where uname='"+(String)session.getAttribute("uname")+"'");
			if(resultset.next()) {
				voterUname=resultset.getString("uname");
			}
			if(!uname.equals(voterUname)) {
				fillVote = DatabaseConnection.insertUpdateFromSqlQuery("insert into tblvoting(vid,candidate_name,party_name,uname)values('"+ id + "','"+candidateName+"','" + vote + "','" + session.getAttribute("uname") + "')");
				if (fillVote > 0) {
					String message="Voted succesfully.";
					session.setAttribute("voted", message);
					response.sendRedirect("voter-dashboard.jsp");
				}
			}else {
				String message="Already voted";
				session.setAttribute("already-voted", message);
				response.sendRedirect("voter-dashboard.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
