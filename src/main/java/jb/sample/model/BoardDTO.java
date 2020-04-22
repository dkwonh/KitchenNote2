package jb.sample.model;

import java.sql.Date;
import java.sql.Timestamp;

public class BoardDTO {
	private int c_num; // 클래스번호
	private String c_name; // 클래스명
	private Timestamp reg_date; // 등록일
	private int price; // 수업료
	private String chef; // 쉐프 아이디
	private Date period_start; // 시작일
	private Date period_end; // 종료일
	private String content; // 내용
	private int personnel; // 모집정원

	public int getPersonnel() {
		return personnel;
	}

	public void setPersonnel(int personnel) {
		this.personnel = personnel;
	}

	public int getC_num() {
		return c_num;
	}

	public void setC_num(int c_num) {
		this.c_num = c_num;
	}

	public String getC_name() {
		return c_name;
	}

	public void setC_name(String c_name) {
		this.c_name = c_name;
	}

	public Timestamp getReg_date() {
		return reg_date;
	}

	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getChef() {
		return chef;
	}

	public void setChef(String chef) {
		this.chef = chef;
	}

	public Date getPeriod_start() {
		return period_start;
	}

	public void setPeriod_start(Date period_start) {
		this.period_start = period_start;
	}

	public Date getPeriod_end() {
		return period_end;
	}

	public void setPeriod_end(Date period_end) {
		this.period_end = period_end;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "BoardDTO [c_num=" + c_num + ", c_name=" + c_name + ", reg_date=" + reg_date + ", price=" + price
				+ ", chef=" + chef + ", period_start=" + period_start + ", period_end=" + period_end + ", content="
				+ content + "]";
	}

}
