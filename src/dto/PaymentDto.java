package dto;

/*
CREATE TABLE  BG_PAYMENT_RECORD(
    SEQ NUMBER(8) PRIMARY KEY,          --시퀀스
    ID VARCHAR2(50) NOT NULL,           --아이디. 외래키
    USETIME NUMBER(4) NOT NULL,         --사용시간 (분단위로 측정)
    USEDATE DATE NOT NULL,              --이용날자
    PRICE NUMBER(8) NOT NULL,           --총 가격
    BONUSCREDIT NUMBER(8) NOT NULL      --이 결제로 마일리지가 얼마나 적용되는지.
);

CREATE SEQUENCE SEQ_BG_PAYMENT_RECORD
START WITH 1
INCREMENT BY 1;

ALTER TABLE BG_PAYMENT_RECORD
ADD CONSTRAINT FK_BG_PAYMENT_RECORD_ID FOREIGN KEY(ID)
REFERENCES BG_MEMBER(ID);
*/
public class PaymentDto {

	int seq;
	String id;
	int usetime;
	String usedate;
	int price;
	int bonuscredit;
	
	public PaymentDto() {
		// TODO Auto-generated constructor stub
	}

	public PaymentDto(int seq, String id, int usetime, String usedate, int price, int bonuscredit) {
		super();
		this.seq = seq;
		this.id = id;
		this.usetime = usetime;
		this.usedate = usedate;
		this.price = price;
		this.bonuscredit = bonuscredit;
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

	public int getUsetime() {
		return usetime;
	}

	public void setUsetime(int usetime) {
		this.usetime = usetime;
	}

	public String getUsedate() {
		return usedate;
	}

	public void setUsedate(String usedate) {
		this.usedate = usedate;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getBonuscredit() {
		return bonuscredit;
	}

	public void setBonuscredit(int bonuscredit) {
		this.bonuscredit = bonuscredit;
	}
	
	
}
