package auth;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import dto.MemberDto;
import dto.QnaDto;
import dto.ReservationDto;
import dto.TableDto;
import member.MemberService;
import qna.QnaService;
import reservation.ReservationService;

/**
 * Servlet implementation class AuthServ
 */
@WebServlet("/auth")
public class AuthServ extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		doProcess(req, resp);
	}

	public void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String command = req.getParameter("command");
		System.out.println("command:" + command);
		
		ReservationService revService = new ReservationService();
		MemberService memService = new MemberService();
		QnaService qnaService = new QnaService();
		
		
		if(command.equals("getMemlist")) {
			int pageNum = Integer.parseInt(req.getParameter("pageNum"));
			String item = req.getParameter("item");
			String sort = req.getParameter("sort");
			System.out.println("item:" + item+ " sort: " + sort + " pageNum: " + pageNum);
			
			List<MemberDto> memList = memService.getMemList(item, sort, pageNum);
			int len = memService.getAllMem();
			req.setAttribute("item", item);
			req.setAttribute("sort", sort);
			req.setAttribute("page", pageNum);	
			req.setAttribute("memList", memList);
			req.setAttribute("len", len);	
			RequestDispatcher dispatcher = req.getRequestDispatcher("memberList.jsp");
			dispatcher.forward(req, resp);

		}else if(command.equals("getMemDetail")) {
			String id = req.getParameter("id");
			MemberDto dto = memService.getMemDetail(id);
			
			int page = Integer.parseInt(req.getParameter("page"));
			System.out.println("page" + page);
			List<ReservationDto> myList = revService.getMyReserv(id, page);
			
			int len = revService.getAllReserv(id);
			System.out.println("len: " + len);
			
			req.setAttribute("len", len);
			req.setAttribute("myList", myList);
			req.setAttribute("page", page);
			req.setAttribute("dto", dto);
			forward("memDetail.jsp", req, resp);

		}else if(command.equals("searchList")) {
			int page = Integer.parseInt(req.getParameter("page"));
			String item = req.getParameter("item");
			String searchWord = req.getParameter("searchWord");
			System.out.println("item:" + item+ "searchWord: " + searchWord + " page: " + page);
			System.out.println("확인합니다.");
			List<MemberDto> memList = memService.searchList(item, searchWord, page);
			int len = memService.getSearchMem(item, searchWord);
			
			
			req.setAttribute("searchWord", searchWord);
			req.setAttribute("item", item);	
			req.setAttribute("memList", memList);
			req.setAttribute("page", page);	
			req.setAttribute("len", len);	
		
			forward("memSearchList.jsp",req, resp);
		
		}else if (command.equals("noAnswer")) {
			int pageNum = 0;
			String sPageNum = req.getParameter("pageNum");
			if(sPageNum != null) {
			   pageNum = Integer.parseInt(sPageNum);	
			}
			
			List<QnaDto> list = qnaService.getNoAnsList(pageNum);
			int allCount =  qnaService.getNoAnsCount();
			
			System.out.println("listSize: " + list.size());
			System.out.println("pageNum : " + pageNum);
			System.out.println("allCount : " + allCount);
			req.setAttribute("pageNum", pageNum);
			req.setAttribute("allCount", allCount);
			req.setAttribute("noAnswerList", list);
			forward("qnaNoAnswer.jsp", req, resp);
			
		}else if (command.equals("adminMain")){
			// 회원 수 구하기 
			int memNum = memService.getAllMem(); 
			System.out.println("memNum: " + memNum);
			// 금일 예약 건수 구하기  
			List<ReservationDto> revList = revService.getAllCurRev();
			int revNum = 0;
			Calendar cal = Calendar.getInstance();
			int todayDate = cal.get(Calendar.DATE);
			for (int i = 0; i < revList.size(); i++) {
				int rDate = Integer.parseInt(revList.get(i).getRdate().substring(8, 10));
				if(rDate == todayDate) {
					revNum++;
				}
			}
			System.out.println("revNum: " +revNum);
			// 미응답 QnA 건수 구하기 
			int noAnswerNum = qnaService.getNoAnsCount();
			System.out.println("noAnswerNum: " + noAnswerNum);
			
			// 테이블 갯수 구하기 
			int tableNum = revService.tableCount();
			
			// 차트용 month 값 구하기 
			int originalMonth = cal.get(Calendar.MONTH);
			int todayYear = cal.get(Calendar.YEAR);
			int month = originalMonth + 1;
			int year = todayYear - 1;
			String date = ""; 
			System.out.println(originalMonth);
			
			
			int[] revMonth = new int[12];
			String[] rdate = new String[12];
			
			//rdate = revService.revMonthCount("201903");
			
			//for (int i = 0; i < rdate.length; i++) {
			//	System.out.println("rdate: " + rdate[i]);
			//}
			
			
			for (int i = 0; i < 12; i++) {
				if(month < 13) {
					if(month < 10) {
						String mth = "0" + month + "";
						date = year + mth + "";
						System.out.println("month 10이하: " + i + "는 " + date);
						revMonth[i] = revService.revMonthCount(date);
						rdate[i] = dateSplit(date);
						month ++;
					
					}else if (month >= 10 ){
						date = year + "" +  month;
						System.out.println("month 10이상: " + i + "는 " + date);
						revMonth[i] = revService.revMonthCount(date);
						rdate[i] = dateSplit(date);
						month ++;
					}
					
				}else if(month >= 13) {
					month = month - 12;
					year = year + 1;
					
					String mth = "0" + month + "";
					date = year + mth + "";

					System.out.println("month 13이상: " + i + "는 " + date);
					revMonth[i] = revService.revMonthCount(date);
					rdate[i] = dateSplit(date);
					month ++;
				}
				
				
			}
			
			// System.out.println("2019. 03 예약건수: " + revMonth[0]);
			System.out.println("rdate: " + rdate[0]);
			
			req.setAttribute("tableNum", tableNum);
			req.setAttribute("memNum", memNum);
			req.setAttribute("revNUm", revNum);
			req.setAttribute("noAnswerNum", noAnswerNum);
			req.setAttribute("revMonth", revMonth);
			req.setAttribute("rdate", rdate);
			forward("admin.jsp", req, resp);
			/**/
			
		} else if(command.equals("tableCheck")) {	//tableCheck 관리자 페이지에서 테이블 리스트를 보러 들어갔을때.
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
	
	public String dateSplit(String date) {
		
		String result = date.substring(0, 4) + "_" + date.substring(4) ;
		return result;
	}
	
}
