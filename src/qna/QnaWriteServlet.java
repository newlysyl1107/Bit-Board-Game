package qna;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.QnaDto;

@WebServlet("/qnaWrite")
public class QnaWriteServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.processFunc(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.processFunc(req, resp);
	}

	public void processFunc(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		System.out.println("qnaWrite servlet 호출");
		String action = req.getParameter("action");
		//System.out.println(action);
		
		// 질문 추가 view로 연결
		if(action.equals("write")) {
			resp.sendRedirect("qnaWrite.jsp");
			
		} else if (action.equals("writeAf")) {
			String id = req.getParameter("_id");
			String email = req.getParameter("email");
			String title = req.getParameter("title");
			String content = req.getParameter("content");
			int is_secret = Integer.parseInt(req.getParameter("secret"));
			
			
			System.out.println("id : " + id);
			System.out.println("email : " + email);
			System.out.println("title : " + title);
			System.out.println("content : " + content);
			System.out.println("is_secret : "+ is_secret);
			
			
			QnaService qnaService = new QnaService();
			boolean isS = qnaService.setQnaWrite(new QnaDto(id, title, content, is_secret));
			
			resp.sendRedirect("qnaWriteAf.jsp?isS="+isS);
		}
	}

	public void forward(String link, HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		RequestDispatcher dispatch = req.getRequestDispatcher(link);
		dispatch.forward(req, resp);
	}
}
