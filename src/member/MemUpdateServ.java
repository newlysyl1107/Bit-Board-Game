package member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import dto.MemberDto;

/**
 * Servlet implementation class MemUpdate
 */
@WebServlet("/memUpdate")
public class MemUpdateServ extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	public void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String command = req.getParameter("command");
		System.out.println("command:" + command);
		
		MemberService service = new MemberService();
		
		HttpSession session = req.getSession();
		MemberDto dto = (MemberDto)session.getAttribute("login");	
		String id = dto.getId();
		
		JSONObject obj = new JSONObject(); 
		
		if(command.equals("pwdcheck")) {
			String pwd = req.getParameter("pwd");
			System.out.println(pwd);
			boolean isS = service.pwdCheck(id, pwd);  
				obj.put("result", isS); 
				
				resp.setContentType("application/x-json); charset=utf-8");
				resp.getWriter().print(obj);
		}else if(command.equals("update")) {
			resp.sendRedirect("memUpdate.jsp");
			
		}else if(command.equals("phoneNumChg")) {
			String phoneNum = req.getParameter("phoneNum");
			boolean isS = service.callNumUpdate(id, phoneNum);
		    if(isS) {
		    	dto.setCall_number(phoneNum);
		    	session.setAttribute("login", dto);
		    }
			obj.put("result", isS); 
			
			resp.setContentType("application/x-json); charset=utf-8");
			resp.getWriter().print(obj);
			
		}else if(command.equals("emailUpdate")) {
			String email = req.getParameter("email");
			
			boolean isS = service.emailUpdate(id, email);
		    if(isS) {
		    	dto.setEmail(email);
		    	session.setAttribute("login", dto);
		    }
			obj.put("result", isS); 
			
			resp.setContentType("application/x-json); charset=utf-8");
			resp.getWriter().print(obj);
		}else if(command.equals("pwUpdate")) {
			String pwd = req.getParameter("pwd");
			boolean isS = service.pwUpdate(id, pwd);
		    if(isS) {
		    	dto.setPw(pwd);
		    	session.setAttribute("login", dto);
		    }
			
			obj.put("result", isS); 
			
			resp.setContentType("application/x-json); charset=utf-8");
			resp.getWriter().print(obj);
		}else if(command.equals("phoneNumChk")) {
			String call_number = req.getParameter("phoneNum");
			System.out.println("callnum: " + call_number );

			boolean callChk = service.phoneNumChk(call_number);
			
			System.out.println("callChk" + callChk) ;
			 
			obj.put("callChk", callChk);
			
			resp.setContentType("application/x-json); charset=utf-8");
			resp.getWriter().print(obj);
			
		}else if(command.equals("emailChk")) {
			String email = req.getParameter("email");
			System.out.println( "email:" + email);

			boolean emailChk = service.emailChk(email);
			
			System.out.println("emailChk: " + emailChk ) ;
			obj.put("emailChk", emailChk); 
			
			resp.setContentType("application/x-json); charset=utf-8");
			resp.getWriter().print(obj);
			
		}
			
	}
	

}
