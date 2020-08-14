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

@WebServlet("/addmember")
public class AddMemberServ extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req,resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req,resp);
	}
	
	public void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		MemberService memService = new MemberService();
		req.setCharacterEncoding("utf-8");
		
		String command = req.getParameter("command");
		System.out.println("command: " + command);
		
		if(command.equals("add")) { // 로그인페이지에서 회원가입요청한경우, 회원가입 페이지로
			
			resp.sendRedirect("register.jsp");
		}else if(command.equals("addAf")) {
			
			String id = req.getParameter("id");
			String pwd = req.getParameter("password");
			String name = req.getParameter("name");
			String call_number = req.getParameter("call_number");
			String email = req.getParameter("emailFront")+ "@" + req.getParameter("emailBack");
			System.out.println(id);
			System.out.println(email);
			System.out.println("비밀번호"+pwd);
			MemberDto dto = new MemberDto(id, pwd, call_number, name, email, 0, " ", 0, 0);
			
			boolean isS = memService.addMember(dto);
			
			if(isS) {
				
				resp.sendRedirect("regiAf.jsp");
			}
			
		}else if(command.equals("emailCallNumChk"))	{
			
			String call_number = req.getParameter("call_number");
			String email = req.getParameter("emailFront")+ "@" + req.getParameter("emailBack");
			System.out.println("callnum: " + call_number + ", email:" + email);

			boolean emailChk = memService.emailChk(email);
			boolean callChk = memService.phoneNumChk(call_number);
			
			System.out.println("emailChk: " + emailChk + "callChk" + callChk) ;
			JSONObject obj = new JSONObject();  
			obj.put("emailChk", emailChk); 
			obj.put("callChk", callChk);
			
			resp.setContentType("application/x-json); charset=utf-8");
			resp.getWriter().print(obj);
		}
		
	}
}
