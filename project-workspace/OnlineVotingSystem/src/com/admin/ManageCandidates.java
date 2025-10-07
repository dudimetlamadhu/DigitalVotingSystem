package com.admin;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.connection.DatabaseConnection;

/**
 * Servlet implementation class ManageCandidates
 */
@WebServlet("/ManageCandidates")
public class ManageCandidates extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int statusMode = 0;
			ResultSet rs =DatabaseConnection.getResultFromSqlQuery("select status from tblcandidate where candidate_id='" + request.getParameter("id") + "'");
			while (rs.next()) {
				if (rs.getString("status").equals("Pending")) {
					statusMode = DatabaseConnection.insertUpdateFromSqlQuery("update tblcandidate set status='Approved' where candidate_id='" + request.getParameter("id") + "'");
				} else {
					statusMode = DatabaseConnection.insertUpdateFromSqlQuery("update tblcandidate set status='Pending' where candidate_id='" + request.getParameter("id") + "'");
				}
			}
			if (statusMode > 0) {
				response.sendRedirect("view-candidates.jsp");
			} else {
				response.sendRedirect("view-candidates.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
