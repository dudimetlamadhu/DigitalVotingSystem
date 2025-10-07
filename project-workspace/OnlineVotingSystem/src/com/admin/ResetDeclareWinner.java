package com.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.connection.DatabaseConnection;

/**
 * Servlet implementation class ResetDeclareWinner
 */
@WebServlet("/ResetDeclareWinner")
public class ResetDeclareWinner extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			int i = DatabaseConnection.insertUpdateFromSqlQuery("update tblcandidate set result=0");
			if (i > 0) {
				response.sendRedirect("admin-declare-winning-candidate.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
