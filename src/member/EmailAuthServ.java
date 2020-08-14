package member;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionActivationListener;

import com.sun.net.httpserver.HttpExchange;

@WebServlet("/emailauth")
public class EmailAuthServ extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	

	public void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String command = req.getParameter("command");
		System.out.println("commandEA: " + command);
		MemberService service = new MemberService();
		if(command.equals("emailAuth")) {
			String id = req.getParameter("id");
			String email = req.getParameter("email");
			
			// mail server설정 
			String host = "smtp.naver.com";
			String user = "bitbg@naver.com"; // 메일보낼 주소 
			String password = "bitcamp1104"; // 네이버 비밀번호 
			
			// 메일 받을 주소 
			String to_email = email;
			
			// SMTP 서버 정보를 설정한다
			Properties props = new Properties();
			props.put("mail.smtp.host", host);//SMTP 서버주소 
			props.put("mail.smtp.user", user); 
			props.put("mail.smtp.port", 465); //SMTP 서버 포트번호 
			props.put("mail.smtp.auth", true);
			props.put("mail.smtp.debug", true);
			props.put("mail.smtp.ssl.enable", true);
			
			// 인증번호 생성
			String authNum = "";
			for(int i = 0; i < 6; i ++) {
				
				int temp = (int)(Math.random()*10);
				authNum += temp + "";
			}
			
			// System.out.println(authNum);
			
			Authenticator authenticator = new Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(user, password); //SMTP 서버 회원(보내는 사람) 메일주소, 패스워드 
				
				}
			};
			
			Session session = Session.getDefaultInstance(props, authenticator);
			
			// 이메일 전송
			
			try {
				MimeMessage msg = new MimeMessage(session);
				InternetAddress from = new InternetAddress(user, "비트 보드게임");//보내는 사람 메일주소 
				msg.setFrom(from); // 보낼 메세지 세팅
				
				InternetAddress to = new InternetAddress(to_email);
				msg.addRecipient(Message.RecipientType.TO, to); // 받는 사람 메일주소 	
				
				// 메일 제목
				msg.setSubject("[인증메일]비트 보드게임 인증메일입니다");
			
				// 메일 내용

				Multipart multi = new MimeMultipart();    

				MimeBodyPart mbp = new MimeBodyPart();
				  
			    mbp.setContent("<h2>안녕하세요. 비트 보드게임 입니다</h2>"
			    			+ "<hr> "
			    			+ "<p>인증번호는 "+ authNum + "입니다. 30분이내로 인증번호를 입력해주세요.<p>", 
			    				"text/html; charset=KSC5601");
				  
				multi.addBodyPart(mbp);
				msg.setContent(multi);
/*
				String htmlStr = "<h2>안녕하세요. 비트 보드게임 입니다</h2>";
							//	+ "<hr> "
							//	+ "<p>인증번호는 "+ authNum + "입니다. 30분이내로 인증번호를 입력해주세요.<p>";
				
				
				msg.setText(htmlStr, "utf-8", "text/html");/**/
				Transport.send(msg);
				System.out.println("이메일 전송");
			} catch (Exception e) {
				System.out.println("이메일 전송 실패");
				e.printStackTrace();
			}
			
			HttpSession savekey = req.getSession();
			savekey.setAttribute("authNum", authNum);
			
			String pw = service.getPw(id, email);
			System.out.println("비밀번호:" + pw);
			// 패스워드 바꿀 아이디 저장
			
			req.setAttribute("pw", pw);
			HashMap<String, String> pInfo = new HashMap<String, String>();
			pInfo.put("id", id);
			pInfo.put("pw", pw);
			req.setAttribute("pInfo", pInfo);
			req.getRequestDispatcher("setnewpw.jsp").forward(req, resp);
			
		}
	} 
}
