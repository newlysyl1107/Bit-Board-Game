package dto;

/*
CREATE TABLE BG_MEMBER(
	SEQ NUMBER(8) UNIQUE NOT NULL,             --시퀀스. 정렬용.
	ID VARCHAR2(50) PRIMARY KEY,               --아이디
    PW VARCHAR2(50) NOT NULL,                  --패스워드
    CALL_NUMBER VARCHAR2(50) UNIQUE NOT NULL,  --전화번호.
    NAME VARCHAR2(50) NOT NULL,                --이름
    EMAIL VARCHAR2(100) NOT NULL,              --이메일
    BONUSCREDIT NUMBER(8) NOT NULL,            --마일리지
    REGDATE DATE NOT NULL,                     --가입날짜
    AUTH NUMBER(2) NOT NULL,                   --권한 (0 : 사용자 / 1 : 관리자)
    DEL NUMBER(1) NOT NULL                     --삭제 여부 (0 : X / 1 : 계정 탈퇴)
);
    
CREATE SEQUENCE SEQ_BG_MEMBER
START WITH 1
INCREMENT BY 1;
*/
public class MemberDto {

	private int seq;
	private String id;
	private String pw;
	private String call_number;
	private String name;
	private String email;
	private int bonuscredit;
	private String regdate;
	private int auth;
	private int del;
	
	
	public MemberDto() {
		// TODO Auto-generated constructor stub
	}


	public MemberDto(int seq, String id, String pw, String call_number, String name, String email, int bonuscredit,
			String regdate, int auth, int del) {
		super();
		this.seq = seq;
		this.id = id;
		this.pw = pw;
		this.call_number = call_number;
		this.name = name;
		this.email = email;
		this.bonuscredit = bonuscredit;
		this.regdate = regdate;
		this.auth = auth;
		this.del = del;
	}

	public MemberDto(String id, String pw, String call_number, String name, String email, int bonuscredit,
			String regdate, int auth, int del) {
		super();
		this.id = id;
		this.pw = pw;
		this.call_number = call_number;
		this.name = name;
		this.email = email;
		this.bonuscredit = bonuscredit;
		this.regdate = regdate;
		this.auth = auth;
		this.del = del;
	}
	
	public MemberDto(int seq, String id, String call_number, String name, String email, int bonuscredit,
			String regdate, int auth, int del) {
		super();
		this.seq = seq;
		this.id = id;
		this.call_number = call_number;
		this.name = name;
		this.email = email;
		this.bonuscredit = bonuscredit;
		this.regdate = regdate;
		this.auth = auth;
		this.del = del;
	}

	public int getSeq() {
		return seq;
	}


	public void setSeq(int seq) {
		this.seq = seq;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getPw() {
		return pw;
	}


	public void setPw(String pw) {
		this.pw = pw;
	}


	public String getCall_number() {
		return call_number;
	}


	public void setCall_number(String call_number) {
		this.call_number = call_number;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public int getBonuscredit() {
		return bonuscredit;
	}


	public void setBonuscredit(int bonuscredit) {
		this.bonuscredit = bonuscredit;
	}


	public String getRegdate() {
		return regdate;
	}


	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}


	public int getAuth() {
		return auth;
	}


	public void setAuth(int auth) {
		this.auth = auth;
	}


	public int getDel() {
		return del;
	}


	public void setDel(int del) {
		this.del = del;
	}


	@Override
	public String toString() {
		return "MemberDto [seq=" + seq + ", id=" + id + ", pw=" + pw + ", call_number=" + call_number + ", name=" + name
				+ ", email=" + email + ", bonuscredit=" + bonuscredit + ", regdate=" + regdate + ", auth=" + auth
				+ ", del=" + del + "]";
	}
	
	
}
