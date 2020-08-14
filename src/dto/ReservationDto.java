package dto;

/*	오타나있음. 나중에 수정할 것.
CREATE TABLE BG_RESERVATION(
    SEQ NUMBER(8) PRIMARY KEY,            --������
    ID VARCHAR2(50) NOT NULL,             --���̵�. �ܷ�Ű
    WDATE DATE NOT NULL,                  --������ �ۼ��� ��¥   
    RDATE DATE NOT NULL,                  --���೯¥ �⵵, ��, �ϱ����� ������ �� ������ �ȴ�.
    STARTTIME NUMBER(2) NOT NULL,         --�ش� ��¥�� ���� ���� �ð�.
    ENDTIME NUMBER(2) NOT NULL,           --�ش� ��¥ ���� ���� �ð�
    TABLENUMBER NUMBER(4),                --������ ���̺� ��ȣ. �ܷ�Ű.
    MEMO VARCHAR2(500) NOT NULL,          --©���ϰ� ��û�ϴ� �޸�
    NUMBERPEOPLE NUMBER(4) NOT NULL,      --������ �ο���.
    DEL NUMBER(1) NOT NULL                --�������� (0 : X / 1 : ���� Ż�� (���� ��� or �Ⱓ �ʰ�)
);

CREATE SEQUENCE SEQ_BG_RESERVAITON
START WITH 1
INCREMENT BY 1;

ALTER TABLE BG_RESERVAITONr
ADD CONSTRAINT FK_BG_RESERVAITON_ID FOREIGN KEY(ID)
REFERENCES BG_MEMBER(ID);

ALTER TABLE BG_RESERVAITON
ADD CONSTRAINT FK_BG_RESERVAITON_TABLENUMBER FOREIGN KEY(TABLENUMBER)
REFERENCES BG_TABLE(TABLENUMBER);
*/
public class ReservationDto {

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
	
	public ReservationDto() {

	}

	public ReservationDto(int seq, String id, String wdate, String rdate, int starttime, int endtime, int tablenumber,
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
