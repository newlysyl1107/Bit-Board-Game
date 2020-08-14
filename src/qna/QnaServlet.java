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

@WebServlet("/qnaServlet")
public class QnaServlet extends HttpServlet {
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
		
		System.out.println("qnaServlet 호출");
		String action = req.getParameter("action");
		//System.out.println(action);
		
		// Qna List 호출 (Qna 메인 페이지)
		if(action.equals("list")) {
			
			String searchWord = req.getParameter("searchWord");
			String choice = req.getParameter("choice");

			System.out.println("서블릿으로 들어온 choice : " + choice + " // searchWord : " + searchWord);
			
			// 검색창 초기화 처리
			if(choice == null || choice.equals("")){
				choice = "sel";
			}
			// 검색어를 지정하지 않고 choice가 넘어 왔을 때
			if(choice.equals("sel")){
				searchWord = "";
			}
			if(searchWord == null){
				searchWord = "";
				choice = "sel";
			}
			
			
			
			
			// 페이징 초기화 처리
			String spageNumber = req.getParameter("pageNumber");
			System.out.println("서블릿으로 들어온 spageNumber : " + spageNumber);
			
			
			int pageNumber = 0;
			if(spageNumber != null && !spageNumber.equals("")){
				pageNumber = Integer.parseInt(spageNumber);
				System.out.println("서블릿에서 dao로 넘어갈 pageNumber : "+ pageNumber);
			}
			
			QnaService qnaService = new QnaService();

			// List<QnaDto> list = qnaService.getQnaList();
			List<QnaDto> list = qnaService.getQnaPagingList(choice, searchWord, pageNumber);
			List<QnaDto> qnaNoticeList = qnaService.getQnaNoticeList();
			
			// int allListCount = qnaService.getQnaListCount();
			
			int allCount = qnaService.getQnaListCount(choice, searchWord);
			System.out.println("총 글의 갯수:" + allCount);
			
			// 총 게시글의 갯수를 10으로 나누어 필요한 페이지의 갯수(qnaListPage)를 찾음
			int qnaPage = allCount / 15;	// 예: 22개의 글 -> 3페이지
			if(allCount % 15 > 0){
				qnaPage = qnaPage + 1;
			}
			System.out.println("qnaPage:" + qnaPage);
			
			// 페이지 클릭에 따른 해당 넘버 
			req.setAttribute("pageNumber", pageNumber);
			// 검색 결과에 따른 리스트 (초기값은 전체)
			req.setAttribute("qnaList", list);
			// 검색 결과에 따른 페이지 갯수 (초기값은 전체 게시물 기준)
			req.setAttribute("qnaPage", qnaPage);
			// 검색시 필터값
			req.setAttribute("choice", choice);
			// 검색시 검색어 값
			req.setAttribute("searchWord", searchWord);
			
			req.setAttribute("qnaNoticeList", qnaNoticeList);
			//req.setAttribute("allListCount", allListCount);
			forward("qna.jsp", req, resp); // 전송
			
		} 
		// Qna 검색 후 목록 ========================  삭제 예정 ===================
		else if(action.equals("searchList")) {
			String choice = req.getParameter("choice");
			String searchWord = req.getParameter("searchWord");
			
			System.out.println("choice 서블릿 : " + choice);
			System.out.println("searchWord 서블릿 : " + searchWord);
			
			QnaService qnaService = new QnaService();
			List<QnaDto> list = qnaService.getQnaSearchList(choice, searchWord);
			
			req.setAttribute("searchList", list);
			forward("qnaSerchList.jsp", req, resp); // 전송
		}
		// Qna 작성 페이지
		else if(action.equals("write")) {
			//resp.setContentType("text/html;charset=utf-8");   
			resp.sendRedirect("qnaWrite.jsp");
		} 
		// Qna 작성 완료/실패 처리
		else if (action.equals("writeAf")) {
			//resp.setContentType("text/html;charset=utf-8");
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
		// Qna 상세보기 페이지
		else if (action.equals("detail")) {
			int seq = Integer.parseInt(req.getParameter("seq"));
			int pageNum = Integer.parseInt(req.getParameter("pageNum"));
			String enter = req.getParameter("enter"); 
			/* System.out.println("enter : "+ enter); */

			System.out.println("seq : "+seq);
			System.out.println("pageNum ★★★ : " + pageNum);
			
			
			
			
			QnaService qnaService = new QnaService();
			// 조회수 호출
			qnaService.getReadCount(seq);
			// 질문글 호출
			QnaDto dto = qnaService.getQnaDetail(seq);
			// 댓글 호출
			List<QnaCommentDto> commList = qnaService.getComment(seq);
			
			req.setAttribute("qnaDto", dto);
			req.setAttribute("commList", commList);
			req.setAttribute("pageNum", pageNum);
			
			req.setAttribute("enter", enter); 
			forward("qnaDetail.jsp", req, resp);
		}
		// Qna 댓글 처리
		else if (action.equals("commentAf")) {
			String commId = req.getParameter("commId");
			String comment = req.getParameter("comment");
			int qnaSeq = Integer.parseInt(req.getParameter("seq"));
			int pageNum = Integer.parseInt(req.getParameter("pageNum")); 
			String enter = req.getParameter("enter"); 
			req.setAttribute("enter", enter);
			
			System.out.println("==== enter : " + enter);
			System.out.println("==== commId : " + commId);
			System.out.println("==== comment : " + comment);
			System.out.println("==== seq : " + qnaSeq);
			System.out.println("==== pageNum : " + pageNum);
						
			QnaService qnaService = new QnaService();
			boolean isS = qnaService.setQnaComment(new QnaCommentDto(commId, comment, qnaSeq));
						
			
			// 조회수 호출
			qnaService.getReadCount(qnaSeq);
			// 질문글 호출
			QnaDto dto = qnaService.getQnaDetail(qnaSeq);
			// 댓글 호출
			List<QnaCommentDto> commList = qnaService.getComment(qnaSeq);
			
			
			
			
			
			req.setAttribute("qnaDto", dto);
			req.setAttribute("commList", commList);
			req.setAttribute("isS", isS);
			req.setAttribute("pageNum", pageNum); 
			forward("qnaDetail.jsp", req, resp);

			//resp.sendRedirect("qnaDetail.jsp?isS="+isS);
			//resp.sendRedirect("qnaCommentAf.jsp?isS="+isS);
			//req.setAttribute("isS", isS);
			//forward("qnaCommentAf.jsp", req, resp);
		} 

		
		// Qna 수정 페이지
		else if (action.equals("update")) {
			int seq = Integer.parseInt(req.getParameter("seq"));
			System.out.println("update seq : "+seq);
			
			QnaService qnaService = new QnaService();
			QnaDto dto = qnaService.getQnaDetail(seq);
			
			req.setAttribute("qnaDto", dto);
			forward("qnaUpdate.jsp", req, resp);
		}
		// QnA 수정 완료/실패
		else if (action.equals("updateAf")) {
			int seq = Integer.parseInt(req.getParameter("seq"));
			String title = req.getParameter("title");
			String content = req.getParameter("content");
			int is_secret = Integer.parseInt(req.getParameter("secret"));
			
			System.out.println("updateAf seq : "+seq);
			System.out.println("title : " + title);
			System.out.println("content : " + content);
			System.out.println("is_secret : "+ is_secret);
			
			QnaService qnaService = new QnaService();
			boolean isS = qnaService.setQnaUpdate(seq, title, content, is_secret);
			
			resp.sendRedirect("qnaUpdateAf.jsp?isS="+isS);
		}
		// QnA 삭제
		else if (action.equals("delete")) {
			int seq = Integer.parseInt(req.getParameter("seq"));
			System.out.println("delete seq : "+seq);
			
			QnaService qnaService = new QnaService();
			boolean isS = qnaService.setQnaDelete(seq);
			
			resp.sendRedirect("qnaDelete.jsp?isS="+isS);
		}
		
		// Qna 답변 완료 처리
	      else if (action.equals("answerEnd")) {
	         int qnaSeq = Integer.parseInt(req.getParameter("seq"));
	         int pageNum = Integer.parseInt(req.getParameter("pageNum"));
	         String enter = req.getParameter("enter");
	         req.setAttribute("enter", enter);
	         
	         
	         QnaService qnaService = new QnaService();
	         boolean isS = qnaService.setQnaAnswerEnd(qnaSeq);
	         
	         
	         QnaDto dto = qnaService.getQnaDetail(qnaSeq);
	         // 댓글 호출
	         List<QnaCommentDto> commList = qnaService.getComment(qnaSeq);
	         
	         req.setAttribute("qnaDto", dto);
	         req.setAttribute("commList", commList);
	         req.setAttribute("qnaAnswerisS", isS);
	         req.setAttribute("pageNum", pageNum); 
	         forward("qnaDetail.jsp", req, resp);
	      
	      
	      }
	      // Qna 답변 대기 처리
	      else if (action.equals("answerWait")) {
	         int qnaSeq = Integer.parseInt(req.getParameter("seq"));
	         int pageNum = Integer.parseInt(req.getParameter("pageNum"));
	         String enter = req.getParameter("enter");
	         req.setAttribute("enter", enter);
	         
	         QnaService qnaService = new QnaService();
	         boolean isS = qnaService.setQnaAnswerWait(qnaSeq);
	         
	         
	         QnaDto dto = qnaService.getQnaDetail(qnaSeq);
	         // 댓글 호출
	         List<QnaCommentDto> commList = qnaService.getComment(qnaSeq);
	         
	         req.setAttribute("qnaDto", dto);
	         req.setAttribute("commList", commList);
	         req.setAttribute("qnaAnswerisS", isS);
	         req.setAttribute("pageNum", pageNum);
	         forward("qnaDetail.jsp", req, resp);
	      
	      
	      }
		
		
		
		/*
		 * else if (action.equals("allListCount")) { QnaService qnaService = new
		 * QnaService(); int allCount = qnaService.getQnaListCount();
		 * 
		 * resp.sendRedirect("qna.jsp?allCount="+allCount); }
		 */
	}

	public void forward(String link, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher dispatch = req.getRequestDispatcher(link);
		dispatch.forward(req, resp);
	}
}
