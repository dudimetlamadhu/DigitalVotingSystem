package com.candidates;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.connection.DatabaseConnection;

/**
 * Servlet implementation class CandidateRegistration
 */
@WebServlet("/CandidateRegistration")
public class CandidateRegistration extends HttpServlet {
	private final String UPLOAD_DIRECTORY = "C:/Users/91868/project-workspace/OnlineVotingSystem/WebContent/uploads/";

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (ServletFileUpload.isMultipartContent(request)) {
			try {
				List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
				String imageName = null;
				String id = null;
				String cname = null;
				String email = null;
				String mobile = null;
				String partyName = null;

				for (FileItem item : multiparts) {
					if (!item.isFormField()) {
						imageName = new File(item.getName()).getName();
						item.write(new File(UPLOAD_DIRECTORY + File.separator + imageName));

						FileItem cid = (FileItem) multiparts.get(0);
						id = cid.getString();

						FileItem name = (FileItem) multiparts.get(1);
						cname = name.getString();

						FileItem cemail = (FileItem) multiparts.get(2);
						email = cemail.getString();

						FileItem cmobile = (FileItem) multiparts.get(3);
						mobile = cmobile.getString();

						FileItem cpartyName = (FileItem) multiparts.get(4);
						partyName = cpartyName.getString();
					}
				}
				try {
					String imagePath = UPLOAD_DIRECTORY + imageName;
					String status = "Pending";
					int result = 0;
					int i = DatabaseConnection.insertUpdateFromSqlQuery("insert into tblcandidate(candidate_id,candidate_name,candidate_email,candidate_mobile,candidate_party_name,candidate_party_logo_name,candidate_party_logo,status,result)values('"
									+ id + "','" + cname + "','" + email + "','" + mobile + "','" + partyName + "','"
									+ imageName + "','" + imagePath + "','" + status + "','" + result + "')");
					if (i > 0) {
						String success = "Candidate resitration successfully.";
						session.setAttribute("success-message", success);
						response.sendRedirect("candidate-registration.jsp");
					}

				} catch (Exception e) {
					e.printStackTrace();
				}
			} catch (Exception ex) {
				request.setAttribute("message", "Medical Prescription Upload Failed due to " + ex);
			}

		} else {
			request.setAttribute("message", "Sorry this code only handles file upload request");
		}

	}
}
