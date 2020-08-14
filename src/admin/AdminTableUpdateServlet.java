package admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import auth.AuthService;
import dto.TableDto;

@WebServlet("/AdminTableUpdateServlet")
public class AdminTableUpdateServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		processFunc(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		processFunc(req, resp);
	}

	protected void processFunc(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//String command = req.getParameter("command"); 현재는 수정 적용외에는 없기에 command를 사용하지 않음.	
		
		String[] tnValues = req.getParameterValues("tnValues");
		String[] pnValues = req.getParameterValues("pnValues");
		String[] isRev = req.getParameterValues("isRev");
		String[] originalPk = req.getParameterValues("originalPk");
		
		/*
		System.out.println(tnValues.length);
		System.out.println(pnValues.length);
		System.out.println(isRev.length);
		System.out.println(originalPk.length);
		*/
		
		for(int i = 0; i < tnValues.length; i++) {
			System.out.println("테이블 번호 :" + tnValues[i]);
			System.out.println("인원수 :" + pnValues[i]);
			System.out.println("체크여부 :" + isRev[i]);
			System.out.println("------------------------------");
		}
		
		for(int i = 0; i < originalPk.length; i++) {
			System.out.println(originalPk[i]);
		}
		
		boolean isS = false;
		
		AdminTableUpdateService atus = new AdminTableUpdateService();
		isS = atus.AdminTableUpdateAlter(tnValues, pnValues, isRev, originalPk);
		
		if(isS) {
			resp.setContentType("text/html; charset=UTF-8");
			PrintWriter out = resp.getWriter(); 
			out.println("<script>alert('테이블 수정이 되었습니다.');location.href='main.jsp';</script>"); 
			out.flush();
			
			//forward("main.jsp", req, resp);
		}else {
			resp.setContentType("text/html; charset=UTF-8");
			PrintWriter out = resp.getWriter(); 
			out.println("<script>alert('테이블 수정에 실패했습니다. 다시 시도해주십시오.');location.href='main.jsp';</script>"); 
			out.flush();
			
			//forward("main.jsp", req, resp);
		}
		
	}
	
	public void forward(String link, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher dispatch = req.getRequestDispatcher(link);
		dispatch.forward(req, resp);
	}
	
}

