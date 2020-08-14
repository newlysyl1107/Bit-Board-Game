package MainAndNotice;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.MemberDto;
import dto.NoticeDto;


@WebServlet("/noticeWrite")
public class NoticeWriteServlet extends HttpServlet {

	
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
		System.out.println("command = " + command);
		
		if(command.equals("write")) {
			resp.sendRedirect("noticeWrite.jsp");
			
			
		// NoticeWrite.jsp 에서 글 작성을 완료하고 Notice.jsp 로 넘어간다.
		} else if(command.equals("writeAf")) {
			NoticeDAO dao = NoticeDAO.getInstance();
			
			HttpSession session = req.getSession();
			MemberDto sDto = (MemberDto)session.getAttribute("login");
			
			
			// write.jsp 에서 보낸 name = id, (제목) name = title, (textarea)name = ir1 받아들이기 
			String id = sDto.getId();
			String title = req.getParameter("title");
			String content = req.getParameter("ir1");
			NoticeDto dto = new NoticeDto(id, title, content);
			boolean isS = dao.writeNotice(dto);
			
			if(isS) {
				resp.sendRedirect("noticeWriteAf.jsp?command=writeAf&isS="+isS);
			}
			
		}
	}
	
}
