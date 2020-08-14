package admin;

import java.io.IOException;
import java.util.Calendar;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.ReservationDto;
import auth.AuthService;
import dto.TableDto;
import member.MemberService;
import qna.QnaService;
import reservation.ReservationService;

@WebServlet("/adminServlet")
public class AdminServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		processFunc(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		processFunc(req, resp);
	}

	protected void processFunc(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {		
		String command = req.getParameter("command");	
		
		if(command.equals("tableCheck")) {	//tableCheck 관리자 페이지에서 테이블 리스트를 보러 들어갔을때.
			AuthService as = new AuthService();
			List<TableDto> list = as.getAllTableList();
			
			req.setAttribute("TableList", list);
			forward("adminTableList.jsp", req, resp);
		}else {
			//그 외
		}
		
	}
	
	public void forward(String link, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher dispatch = req.getRequestDispatcher(link);
		dispatch.forward(req, resp);
	}
	
}

