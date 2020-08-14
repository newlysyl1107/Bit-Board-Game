package member;

import java.util.List;

import dto.MemberDto;

public class MemberService {

	MemberDao dao = MemberDao.getInstance();
	
	public boolean addMember(MemberDto dto) {
		
		return dao.addMember(dto);
	}
	
	
	public MemberDto login(String id, String pw) {
		
		return dao.login(id, pw);
	}
	
	public boolean idCheck(String id) {
		return dao.idCheck(id);
	}
	
	
	public boolean pwdCheck(String id, String pwd) {
		
		boolean isS = dao.pwdCheck(id,  pwd);

		return isS;
	}
	
	public boolean callNumUpdate(String id, String phoneNum) {
		
		boolean isS = dao.callNumUpdate(id, phoneNum);
		
		return isS;
	}
	
	public boolean emailUpdate(String id, String email) {
		
		boolean isS = dao.emailUpdate(id, email);
		
		return isS;
	}
	
	public boolean pwUpdate(String id, String pwd) {
	
		boolean isS = dao.pwUpdate(id, pwd);
		
		return isS;
	}	
	
	public String findId(String name, String email) {
		
		String id = dao.findId(name, email);
		
		return id;
	}

	
	public boolean findPw(String id, String email) {
		
		String pw = dao.findPw(id, email);
		
		return pw != null? true:false;
	}
	
	public String getPw(String id, String email) {
		
		return dao.findPw(id, email);
	}
	
	public boolean phoneNumChk(String call_number) {
		
		return dao.phoneNumChk(call_number);
	}
	
	public boolean emailChk (String email) {
		
		return dao.emailChk(email);
	}
	
	public List<MemberDto> getMemList(String item, String sort, int page) {
		
		return dao.getMemList(item, sort, page);
		
	}
	
	public int getAllMem() {
		
		return dao.getAllMem();
	}
	
	public MemberDto getMemDetail(String id) {
		
		return dao.getMemDetail(id);
	}
	
	public List<MemberDto> searchList(String item, String searchWord, int page){
		
		return dao.searchList(item, searchWord, page);
	}
	
	public int getSearchMem(String item, String searchWord) {
		
		return dao.getSearchMem(item, searchWord);
	}
}
