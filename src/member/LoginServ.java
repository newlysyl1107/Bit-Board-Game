package member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.MemberDto;


@WebServlet("/login")
public class LoginServ extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("doGet");
		login(req, resp);
	}


	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("doPost");
		login(req, resp);
	}
	

	public void login(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String command = req.getParameter("command");
		System.out.println("command" + command);
		HttpSession session = req.getSession();
		if(command.equals("login")) {
			resp.sendRedirect("login.jsp");
		}else if(command.equals("toMain")) {
			String id = req.getParameter("id");
			String pw = req.getParameter("pw");
			MemberService service = new MemberService();
			MemberDto dto = service.login(id, pw);
			
			if(dto != null) {
				
				session.setAttribute("login", dto);
				resp.sendRedirect("main.jsp");
			}else if(dto == null) {
				req.setAttribute("loginFail", "0");
				RequestDispatcher dispatcher = req.getRequestDispatcher("login.jsp");
				dispatcher.forward(req,  resp);

			}
			
		}else if(command.equals("logout")) {
			session.invalidate();
			resp.sendRedirect("main.jsp");
		}else if(command.equals("toLoginPg")) {
			
			resp.sendRedirect("login.jsp");
		}
	}
}
