package MainAndNotice;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.NoticeDto;

@WebServlet("/noticeDetail")
public class NoticeDetailServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		processFunction(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		processFunction(req, resp);
	}
	
	public void processFunction(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String command = req.getParameter("command");
		// singleton
		NoticeDAO dao = NoticeDAO.getInstance();
		
		
		if(command.equals("detail")) {
		
		// noticeDetail.jsp ���� ���� seq �� �޾Ƶ��δ�.
		String sseq = req.getParameter("seq");
		int seq = Integer.parseInt(sseq);
		
		
		dao.viewCount(seq);
		
		// seq �� ���� dto �� �������� �޼ҵ� ȣ��
		NoticeDto dto = dao.noticeDetail(seq);
		
		// setAttribute �� dto �� packing �Ͽ� forward �� ���� noticeDetail.jsp �� ������.
		req.setAttribute("dto", dto);
		forward("noticeDetail.jsp", req, resp);
		
		
		
		
		} else if(command.equals("pre")) {
			String sseq = req.getParameter("seq");
			System.out.println("detail previous seq = " + sseq);
			int seq = Integer.parseInt(sseq);
			
			NoticeDto dto = dao.preNotice(seq);
			System.out.println("dto asfdsd = " + dto);
			req.setAttribute("dto", dto);
			
			forward("noticeDetail.jsp", req, resp);
			
		} else if(command.equals("post")) {
			String sseq = req.getParameter("seq");
			System.out.println("detail post seq = " + sseq);
			int seq = Integer.parseInt(sseq);
			
			NoticeDto dto = dao.postNotice(seq);
			System.out.println("dto asfdsd = " + dto);
			req.setAttribute("dto", dto);
			
			forward("noticeDetail.jsp", req, resp);
		}
	}
	
	public void forward(String link, HttpServletRequest req, HttpServletResponse resp) 
						throws ServletException, IOException {
		RequestDispatcher dispatch = req.getRequestDispatcher(link);
		dispatch.forward(req, resp);
		
	}
}
