package wh.admin.manage.model;

import java.sql.Timestamp;

public class ChefDto extends MemberDto{
	private String chef;
	private Timestamp date;
	private String tel;
	private String sns_address;
	public String getChef() {
		return chef;
	}
	public void setChef(String chef) {
		this.chef = chef;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getSns_address() {
		return sns_address;
	}
	public void setSns_address(String sns_address) {
		this.sns_address = sns_address;
	}
	
	
}
