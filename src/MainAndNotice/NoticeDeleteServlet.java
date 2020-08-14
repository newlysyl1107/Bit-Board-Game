package MainAndNotice;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/noticeDelete")
public class NoticeDeleteServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		processFunction(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		processFunction(req, resp);
	}
	
	public void processFunction(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// delete 에 필요한 seq 가져오기!
		String sseq = req.getParameter("seq");
		int seq = Integer.parseInt(sseq);
		
		// singleton
		NoticeDAO dao = NoticeDAO.getInstance();
		
		boolean isS = dao.deleteNotice(seq);
		
		System.out.println("삭제서블릿 isS = " + isS);
		resp.sendRedirect("noticeDelete.jsp?command=deleteAf&isS="+isS);
	}

}