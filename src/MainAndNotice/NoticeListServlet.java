package MainAndNotice;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.NoticeDto;

@WebServlet("/noticeList")
public class NoticeListServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		processFunction(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		processFunction(req, resp);
	}
	
	
	public void processFunction(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		NoticeService service = new NoticeService();
		
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		String command = req.getParameter("command");
		System.out.println("NoticeListServlet command = " + command);
	
		if(command == null || command.equals("")) {
			resp.sendRedirect("notice.jsp");
			
			
		// 검색으로 들어오면, noticeSearch.jsp 로 이동시킨다.	
		} else if (command.equals("search")) {
			
			int pageNumber = Integer.parseInt(req.getParameter("pageNumber"));
			String choice = req.getParameter("choice");
			String searchWord = req.getParameter("searchWord");
			
			System.out.println("검색 pageNumber=" + pageNumber + " 검색 choice = " + choice + " 검색 searchWord = " + searchWord);
			
			List<NoticeDto> searchList = service.getSearchAllList(choice, searchWord, pageNumber);
			
			int length = service.getSearchCount(choice, searchWord);
			
			req.setAttribute("choice", choice);
			req.setAttribute("searchWord", searchWord);
			req.setAttribute("searchList", searchList);
			req.setAttribute("pageNumber", pageNumber);
			req.setAttribute("length", length);
			
			RequestDispatcher dispatcher = req.getRequestDispatcher("noticeSearch.jsp");
			dispatcher.forward(req, resp);
			
			
//			String searchWord = req.getParameter("searchWord");
//			String choice = req.getParameter("choice");
//			System.out.println("검색어 = " + searchWord);
//			
//			searchWord = URLEncoder.encode(searchWord);
//
//			resp.sendRedirect("noticeSearch.jsp?searchWord=" + searchWord + "&choice=" + choice);

			
		
			
			
		// paging 으로 들어온 경우
		} else if (command.equals("page")) {
			
			int pageNumber = Integer.parseInt(req.getParameter("pageNumber"));
			
			System.out.println("페이징 pageNumber = " + pageNumber);
			
			List<NoticeDto> allNoticeList = service.showAllNotice(pageNumber);
			int length = service.getAllcount();
			
			req.setAttribute("pageNumber", pageNumber);
			req.setAttribute("allNoticeList", allNoticeList);
			req.setAttribute("length", length);
			
			RequestDispatcher dispatcher = req.getRequestDispatcher("notice.jsp");
			dispatcher.forward(req, resp);
			
/*			String pageNumber = req.getParameter("pageNumber");
			String searchWord = req.getParameter("searchWord");
			String choice = req.getParameter("choice");
			
			System.out.println("ListServlet pageNumber = " + pageNumber);
			System.out.println("ListServlet searchWord = " + searchWord);
			System.out.println("ListServlet choice = " + choice);
			
			Parameter 방식 외에 setAttribute 로 보내기
			
			req.setAttribute("pageNumber", pageNumber);
			req.setAttribute("searchWord", searchWord);
			forward("notice.jsp", req, resp);
			
			searchWord = URLEncoder.encode(searchWord);
			choice = URLEncoder.encode(choice);
			
			if(choice == null || searchWord == null) {
				resp.sendRedirect("notice.jsp?pageNumber=" + pageNumber);
			} else if(!choice.equals("sel") && !searchWord.equals("")) {
				resp.sendRedirect("notice.jsp?pageNumber=" + pageNumber + "&searchWord=" + searchWord + "&choice=" + choice);
			} */
		}
	}
}
