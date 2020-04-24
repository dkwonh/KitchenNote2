package yh.mypage.controller;

import java.util.Date;

// 쉐프 DTO
public class ChefDto extends MemberInfoDto{

	String chef;
	String tel;
	String sns_address;
	
	public String getChef() {
		return chef;
	}
	public void setChef(String chef) {
		this.chef = chef;
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
	@Override
	public String toString() {
		return "ChefDto [nickname="+nickname+",chef=" + chef +", level"+level+", tel=" + tel + ", sns_address=" + sns_address + "]";
	}
	
	
}
