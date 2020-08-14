package reservation;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.ReservationDto;

@WebServlet("/RevWriteServlet")
public class RevWriteServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.processFunc(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.processFunc(req, resp);
	}
	
	private void processFunc(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		String command = req.getParameter("command");
		
		if(command.equals("tableSet")) {	//테이블 정보를 위한 Ajax 요청 
			String year = req.getParameter("year");
			String month =  req.getParameter("month");
			String day = req.getParameter("day");
			String tableNumber = req.getParameter("tableNumber");
			
			System.out.println("command : " + command);
			System.out.println(year + "," + month + "," + day + "," + tableNumber);

			resp.setContentType("application/json");	//json 형식으로 변환
			resp.setCharacterEncoding("utf-8");			//한글 인코딩 설정. 이 setCharEncoding은 req에도 있고, resp에도 있음. 차이 구분.
			RevWriteService rws = new RevWriteService();
			String gson = rws.getTodayReservationList(year, month, day, tableNumber);
			resp.getWriter().write(gson);
		}else if(command.equals("revGo")) {	//예약시도.
			String year = req.getParameter("year");
			String month =  req.getParameter("month");
			String day = req.getParameter("day");
			String tableSelect = req.getParameter("tableSelect");
			String startTime = req.getParameter("startTime");
			String endTime = req.getParameter("endTime");
			String memo = req.getParameter("memo");
			String peopleNumber = req.getParameter("peopleNumber");
			String id = req.getParameter("id");
			
			RevWriteService rws = new RevWriteService();
			boolean isS = rws.insertRev(year, month, day, tableSelect, startTime, endTime, memo, peopleNumber, id);
			
			if(isS) {
				resp.setContentType("text/html; charset=UTF-8");
				PrintWriter out = resp.getWriter(); 
				out.println("<script>alert('예약이 성공적으로 등록 되었습니다');location.href='main.jsp';</script>"); 
				out.flush();
				
				//forward("main.jsp", req, resp);
			}else {
				resp.setContentType("text/html; charset=UTF-8");
				PrintWriter out = resp.getWriter(); 
				out.println("<script>alert('예약 등록에 실패했습니다.');location.href='main.jsp';</script>"); 
				out.flush();
				
				//forward("main.jsp", req, resp);
			}

		}else { //뭔가 다른 접근
			
			
		}
		

		
		/*
		req.setAttribute("year", year);
		req.setAttribute("month", month);
		req.setAttribute("day", day);
		forward("revWrite.jsp", req, resp);
		*/
		
	}
	
	public void forward(String link, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher dispatch = req.getRequestDispatcher(link);
		dispatch.forward(req, resp);
	}
	

	
	
	
	
}
