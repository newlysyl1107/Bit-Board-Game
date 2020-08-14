package dto;

/*
CREATE TABLE BG_QNA(
    SEQ NUMBER(8) PRIMARY KEY,            --½ÃÄö½º
    ID VARCHAR2(50) NOT NULL,             --¾ÆÀÌµğ. ¿Ü·¡Å°
    WDATE DATE NOT NULL,                  --ÀÛ¼ºÀÏ
    TITLE VARCHAR2(200) NOT NULL,         --Á¦¸ñ
    CONTENT VARCHAR2(4000) NOT NULL,      --³»¿ë
    READCOUNT NUMBER(8) NOT NULL,         --Á¶È¸¼ö
    IS_SECRET NUMBER(1) NOT NULL,         --ºñ¹Ğ±Û ¿©ºÎ (0 : ¾Æ´Ô / 1 : ºñ¹Ğ±Û)
    THIS_PASSWORD VARCHAR2(50),           --ºñ¹Ğ±ÛÀÏ¶§ ÆĞ½º¿öµå
    DEL NUMBER(1) NOT NULL                --»èÁ¦¿©ºÎ (0 : X / 1 : °èÁ¤ Å»Åğ)
);

CREATE SEQUENCE SEQ_BG_QNA
START WITH 1
INCREMENT BY 1;

ALTER TABLE BG_QNA
ADD CONSTRAINT FK_BG_QNA_ID FOREIGN KEY(ID)
REFERENCES BG_MEMBER(ID);
*/

/*
CREATE TABLE BG_QNA(
    SEQ NUMBER(8) PRIMARY KEY,                --ì‹œí€€ìŠ¤
    ID VARCHAR2(50) NOT NULL,                  --ì•„ì´ë””. ì™¸ë˜í‚¤
    TITLE VARCHAR2(200) NOT NULL,             --ì œëª©
    CONTENT VARCHAR2(4000) NOT NULL,      --ë‚´ìš©
    WDATE DATE NOT NULL,                        --ì‘ì„±ì¼
    READCOUNT NUMBER(8) NOT NULL,          --ì¡°íšŒìˆ˜
    IS_SECRET NUMBER(1) NOT NULL,             --ë¹„ë°€ê¸€ ì—¬ë¶€ (0 : ì•„ë‹˜ / 1 : ë¹„ë°€ê¸€)
    IS_ANSWER NUMBER(1) NOT NULL,			-- ê´€ë¦¬ìì˜ ë‹µë³€ ì—¬ë¶€(0 : ë‹µë³€í•˜ì§€ ì•ŠìŒ / 1 : ë‹µë³€í•¨)
    DEL NUMBER(1) NOT NULL,                     --ì‚­ì œì—¬ë¶€ (0 : X / 1 : ê³„ì • íƒˆí‡´)
    BESTQNA NUMBER(1) NOT NULL				-- ê´€ë¦¬ìê°€ ì§€ì •í•œ ë² ìŠ¤íŠ¸ ì§ˆë¬¸ ì—¬ë¶€ (0 : X / 1 : ë² ìŠ¤íŠ¸ ì§€ì •)
);
*/


public class QnaDto {
	
	/*
	private int seq;
	private String id;
	private String wdate;
	private String title;
	private String content;
	private int readcount;
	private int is_secret;
	private String this_password;
	private int del;	
	*/
	
	private int seq;
	private String id;
	private String title;
	private String content;
	private String wdate;
	private int readcount;
	private int is_secret;
	private int is_answer;
	private int del;
	private int bestqna;
	
	public QnaDto() {
	}
	
	public QnaDto(String id, String title, String content, int is_secret) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.is_secret = is_secret;
	}

	public QnaDto(int seq, String id, String title, String content, String wdate, int readcount, int is_secret,
			int is_answer, int del, int bestqna) {
		super();
		this.seq = seq;
		this.id = id;
		this.title = title;
		this.content = content;
		this.wdate = wdate;
		this.readcount = readcount;
		this.is_secret = is_secret;
		this.is_answer = is_answer;
		this.del = del;
		this.bestqna = bestqna;
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWdate() {
		return wdate;
	}
	public void setWdate(String wdate) {
		this.wdate = wdate;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public int getIs_secret() {
		return is_secret;
	}
	public void setIs_secret(int is_secret) {
		this.is_secret = is_secret;
	}
	public int getIs_answer() {
		return is_answer;
	}
	public void setIs_answer(int is_answer) {
		this.is_answer = is_answer;
	}
	public int getDel() {
		return del;
	}
	public void setDel(int del) {
		this.del = del;
	}
	public int getBestqna() {
		return bestqna;
	}
	public void setBestqna(int bestqna) {
		this.bestqna = bestqna;
	}
	
	
}
