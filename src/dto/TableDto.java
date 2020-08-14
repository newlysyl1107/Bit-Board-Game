package dto;

/*
CREATE TABLE  BG_TABLE(
    TABLENUMBER NUMBER(4) PRIMARY KEY,     --테이블 번호
    NUMBERPEOPLE NUMBER(4) NOT NULL,       --최대 이용 가능 인원수
    ISRESERVAITONTABLE NUMBER(1) NOT NULL  --예약전용 테이블인가? (0 : 아님 / 1 : 맞음)
);
*/
public class TableDto {
	private int tablenumber;
	private int numberpeople;
	private int isreserbaitiontable;
	
	public TableDto() {
		// TODO Auto-generated constructor stub
	}

	public TableDto(int tablenumber, int numberpeople, int isreserbaitiontable) {
		super();
		this.tablenumber = tablenumber;
		this.numberpeople = numberpeople;
		this.isreserbaitiontable = isreserbaitiontable;
	}

	public int getTablenumber() {
		return tablenumber;
	}

	public void setTablenumber(int tablenumber) {
		this.tablenumber = tablenumber;
	}

	public int getNumberpeople() {
		return numberpeople;
	}

	public void setNumberpeople(int numberpeople) {
		this.numberpeople = numberpeople;
	}

	public int getIsreserbaitiontable() {
		return isreserbaitiontable;
	}

	public void setIsreserbaitiontable(int isreserbaitiontable) {
		this.isreserbaitiontable = isreserbaitiontable;
	}
	
}
