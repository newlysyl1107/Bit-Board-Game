package qna;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.QnaCommentDto;
import dto.QnaDto;

@WebServlet("/qnaCommServlet")
public class QnaCommentServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		this.processFunc(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		this.processFunc(req, resp);
	}

	public void processFunc(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		System.out.println("qnaCommentServlet 호출");
		String action = req.getParameter("action");
		
		// Qna List 호출 (Qna 메인 페이지)
		if(action.equals("commDelete")) {
			int commSeq = Integer.parseInt(req.getParameter("commSeq"));
			int qnaSeq = Integer.parseInt(req.getParameter("qnaSeq"));
			int pageNum = Integer.parseInt(req.getParameter("pageNum"));
			String enter = req.getParameter("enter"); 
			req.setAttribute("enter", enter);
			
			
			
			System.out.println("comm서블릿의 commSeq : " + commSeq);
			System.out.println("comm서블릿의 qnaSeq : " + qnaSeq);
			
			QnaCommentService commService = new QnaCommentService();
			boolean commDeleteisS = commService.setCommDelete(commSeq);
			

			QnaService qnaService = new QnaService();
			// 조회수 호출
			qnaService.getReadCount(qnaSeq);
			// 질문글 호출
			QnaDto dto = qnaService.getQnaDetail(qnaSeq);
			// 댓글 호출
			List<QnaCommentDto> commList = qnaService.getComment(qnaSeq);
			
			
			
			req.setAttribute("pageNum", pageNum);
			req.setAttribute("qnaDto", dto);
			req.setAttribute("commList", commList);
			req.setAttribute("commDeleteisS", commDeleteisS);
			forward("qnaDetail.jsp", req, resp);
		}
	}

	public void forward(String link, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher dispatch = req.getRequestDispatcher(link);
		dispatch.forward(req, resp);
	}
}
