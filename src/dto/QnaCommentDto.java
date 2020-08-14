package dto;

/*
CREATE TABLE BG_QNA_COMMENTS(
    SEQ NUMBER(8) PRIMARY KEY,            --½ÃÄö½º
    ID VARCHAR2(50) NOT NULL,             --¾ÆÀÌµð. ¿Ü·¡Å° ÇØ´ç À¯Àú°¡ °ü¸®ÀÚÀÎÁö À¯ÀúÀÎÁö Ã£¾Æ³¾ °Í.
    WDATE DATE NOT NULL,                  --ÀÛ¼º ³¯Â¥   
    QNANUMBER NUMBER(8) NOT NULL,         --QNA Å×ÀÌºíÀÇ ¾î¶² ±Û¿¡ ´ñ±ÛÀÎÁö. ¿Ü·¡Å°
    CONTENT VARCHAR2(500) NOT NULL,       --´ñ±Û ³»¿ë.
    DEL NUMBER(1) NOT NULL                --»èÁ¦¿©ºÎ (0 : X / 1 : »èÁ¦)
);

CREATE SEQUENCE SEQ_BG_QNA_COMMENTS
START WITH 1
INCREMENT BY 1;

ALTER TABLE BG_QNA_COMMENTS
ADD CONSTRAINT FK_BG_QNA_COMMENTS_ID FOREIGN KEY(ID)
REFERENCES BG_MEMBER(ID);

ALTER TABLE BG_QNA_COMMENTS
ADD CONSTRAINT FK_BG_QNA_COMMENTS_QNANUMBER FOREIGN KEY(QNANUMBER)
REFERENCES BG_QNA(SEQ);
*/


public class QnaCommentDto {

	int seq;
	String id;
	String wdate;
	int qnamumber;
	String content;
	int del;
	
	public QnaCommentDto() {
		// TODO Auto-generated constructor stub
	}

	// ëŒ“ê¸€ ì €ìž¥ìš©
	public QnaCommentDto(String id, String content, int qnamumber) {
		super();
		this.id = id;
		this.content = content;
		this.qnamumber = qnamumber;
	}


	public QnaCommentDto(int seq, String id, String wdate, int qnamumber, String content, int del) {
		super();
		this.seq = seq;
		this.id = id;
		this.wdate = wdate;
		this.qnamumber = qnamumber;
		this.content = content;
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

	public int getQnamumber() {
		return qnamumber;
	}

	public void setQnamumber(int qnamumber) {
		this.qnamumber = qnamumber;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getDel() {
		return del;
	}

	public void setDel(int del) {
		this.del = del;
	}
}
