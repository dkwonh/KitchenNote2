package wh.admin.manage.model;

import java.sql.Timestamp;
import java.util.Date;

public class CookingClassDto {
	private String c_num;
	
	// 클래스명
	private String c_name;

	// 등록일
	private Timestamp reg_date;

	// 수업료
	private Integer price;

	// 셰프아이디
	private String chef;

	// 시작일
	private Date period_start;

	// 종료일
	private Date period_end;

	// 내용
	private String content;

	// 모집 정원
	private Integer personnel;

	// 강사모집 상태 트루:모집완료
	private Boolean recruit;
	
	private String nickname;


	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
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

	

	public String getC_num() {
		return c_num;
	}

	public void setC_num(String c_num) {
		this.c_num = c_num;
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

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}




	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Integer getPersonnel() {
		return personnel;
	}

	public void setPersonnel(Integer personnel) {
		this.personnel = personnel;
	}

	public Boolean getRecruit() {
		return recruit;
	}

	public void setRecruit(Boolean recruit) {
		this.recruit = recruit;
	}
}
