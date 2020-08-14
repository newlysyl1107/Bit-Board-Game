package dto;

/*
CREATE TABLE BG_RESERVAITON(
    SEQ NUMBER(8) PRIMARY KEY,            --시퀀스
    ID VARCHAR2(50) NOT NULL,             --아이디. 외래키
    WDATE DATE NOT NULL,                  --예약을 작성한 날짜   
    RDATE DATE NOT NULL,                  --예약날짜 년도, 월, 일까지만 꺼내올 수 있으면 된다.
    STARTTIME NUMBER(2) NOT NULL,         --해당 날짜의 예약 시작 시간.
    ENDTIME NUMBER(2) NOT NULL,           --해당 날짜 예약 종료 시간
    TABLENUMBER NUMBER(4),                --예약한 테이블 번호. 외래키.
    MEMO VARCHAR2(500) NOT NULL,          --짤막하게 요청하는 메모
    NUMBERPEOPLE NUMBER(4) NOT NULL,      --예약한 인원수.
    DEL NUMBER(1) NOT NULL                --삭제여부 (0 : X / 1 : 계정 탈퇴 (예약 취소 or 기간 초과)
);

CREATE SEQUENCE SEQ_BG_RESERVAITON
START WITH 1
INCREMENT BY 1;

ALTER TABLE BG_RESERVAITON
ADD CONSTRAINT FK_BG_RESERVAITON_ID FOREIGN KEY(ID)
REFERENCES BG_MEMBER(ID);

ALTER TABLE BG_RESERVAITON
ADD CONSTRAINT FK_BG_RESERVAITON_TABLENUMBER FOREIGN KEY(TABLENUMBER)
REFERENCES BG_TABLE(TABLENUMBER);
*/
public class RegervationDto {

	private int seq;
	private String id;
	private String wdate;
	private String rdate;
	private int starttime;
	private int endtime;
	private int tablenumber;
	private String memo;
	private int numberpeople;
	private int del;
	
	public RegervationDto() {
		// TODO Auto-generated constructor stub
	}

	public RegervationDto(int seq, String id, String wdate, String rdate, int starttime, int endtime, int tablenumber,
			String memo, int numberpeople, int del) {
		super();
		this.seq = seq;
		this.id = id;
		this.wdate = wdate;
		this.rdate = rdate;
		this.starttime = starttime;
		this.endtime = endtime;
		this.tablenumber = tablenumber;
		this.memo = memo;
		this.numberpeople = numberpeople;
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

	public String getWdate() {
		return wdate;
	}

	public void setWdate(String wdate) {
		this.wdate = wdate;
	}

	public String getRdate() {
		return rdate;
	}

	public void setRdate(String rdate) {
		this.rdate = rdate;
	}

	public int getStarttime() {
		return starttime;
	}

	public void setStarttime(int starttime) {
		this.starttime = starttime;
	}

	public int getEndtime() {
		return endtime;
	}

	public void setEndtime(int endtime) {
		this.endtime = endtime;
	}

	public int getTablenumber() {
		return tablenumber;
	}

	public void setTablenumber(int tablenumber) {
		this.tablenumber = tablenumber;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public int getNumberpeople() {
		return numberpeople;
	}

	public void setNumberpeople(int numberpeople) {
		this.numberpeople = numberpeople;
	}

	public int getDel() {
		return del;
	}

	public void setDel(int del) {
		this.del = del;
	}
	
}
