package reservation;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.TableDto;

@WebServlet("/ReservationServlet")
public class ReservationServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		processFunc(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		processFunc(req, resp);
	}
	
	protected void processFunc(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String year = req.getParameter("year");
		String month =  req.getParameter("month");
		String day = req.getParameter("day");
		
		req.setAttribute("year", year);
		req.setAttribute("month", month);
		req.setAttribute("day", day);
		
		ReservationService rsv = new ReservationService();
		
		List<TableDto> list = rsv.getReservationTableList();
		System.out.println("tableList :" + list);
		req.setAttribute("ReservationTableList", list);
		
		forward("revWrite.jsp", req, resp);
		
	}
	
	public void forward(String link, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher dispatch = req.getRequestDispatcher(link);
		dispatch.forward(req, resp);
	}

}
