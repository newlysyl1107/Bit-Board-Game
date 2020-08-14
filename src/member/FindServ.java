package member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.google.gson.JsonObject;

@WebServlet("/find")
public class FindServ extends HttpServlet {
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
		
	}
	
	
	public void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String command = req.getParameter("command");
		System.out.println(command);
		MemberService service = new MemberService();
		
		JSONObject obj = new JSONObject();
		
		if(command.equals("toFindPage")) {
			
			resp.sendRedirect("findmember.jsp");
			
		} else if(command.equals("findId")) {
			// req.setCharacterEncoding("utf-8");
			
			String name = req.getParameter("name");
			String email = req.getParameter("email");
			String id = service.findId(name, email);
			
			if(id != "") {
				obj.put("result", true);
				obj.put("id", id);
			}else {
				obj.put("result", false);
			}
			resp.setContentType("application/x-json); charset=utf-8");
			resp.getWriter().print(obj);
		} else if(command.equals("findPw")) {
			
			String id = req.getParameter("id");
			String email = req.getParameter("email");
			boolean existMem = service.findPw(id, email);
			
			obj.put("result", existMem);
			resp.setContentType("application/x-json); charset=utf-8");
			resp.getWriter().print(obj);
		} else if(command.equals("pwUpdate")) {
			String ids = req.getParameter("id");
			String pwd = req.getParameter("pwd");
			System.out.println("아이디 " + ids + "비밀번호 " + pwd );
			boolean isS = service.pwUpdate(ids, pwd);
			
			obj.put("result", isS); 
			
			resp.setContentType("application/x-json); charset=utf-8");
			resp.getWriter().print(obj);
			
			
		
			
		}
			
		
	}

}
