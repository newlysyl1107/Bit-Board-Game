package member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;


@WebServlet("/idcheck")
public class idCheckServ extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		MemberService service = new MemberService();
		boolean isS = service.idCheck(id);
		JSONObject obj = new JSONObject();  
		obj.put("result", isS); 
		obj.put("inputId", id);
		
		resp.setContentType("application/x-json); charset=utf-8");
		resp.getWriter().print(obj);
		
		
	}

}
