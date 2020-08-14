package reservation;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import dto.ReservationDto;

/**
 * Servlet implementation class myReservServ
 */
@WebServlet("/myReserv")
public class myReservServ extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	public void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String command = req.getParameter("command");
		System.out.println("command: " + command);
		ReservationService service = new ReservationService();
		if(command.equals("myReserv")) {
			
			String id = req.getParameter("id");
			System.out.println("id" + id);
			int page = Integer.parseInt(req.getParameter("page"));
			System.out.println("page" + page);
			List<ReservationDto> myList = service.getMyReserv(id, page);
			System.out.println("myList:" + myList.size());
			
			int len = service.getAllReserv(id);
			System.out.println("len: " + len);
			req.setAttribute("len", len);
			req.setAttribute("myList", myList);
			req.setAttribute("page", page);
			forward("myReserv.jsp", req, resp);
			
		}else if(command.equals("revDel")) {
			int seq = Integer.parseInt(req.getParameter("seq"));
			boolean result = service.revDel(seq);
			System.out.println("result:" + result);
			JSONObject obj = new JSONObject();  
			obj.put("result", result); 
			resp.setContentType("application/x-json); charset=utf-8");
			resp.getWriter().print(obj);
			
		}
		
	}
		public void forward(String link, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			RequestDispatcher dispatch = req.getRequestDispatcher(link);
			dispatch.forward(req, resp);
		}


}
