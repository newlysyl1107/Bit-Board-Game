package member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PersonalInfoServ
 */
@WebServlet("/personalInfo")
public class PersonalInfoServ extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	public void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String command = req.getParameter("command");
		System.out.println("command: " + command);
		
		if(command.equals("toMyInfoPg")) {
			resp.sendRedirect("personalInfo.jsp");
		}else if (command.equals("memcheck")){
			
			resp.sendRedirect("memCheck.jsp");
		}else if (command.equals("myReserv")) {
			resp.sendRedirect("myReserv.jsp");
		}
		
		
	}
	

}
