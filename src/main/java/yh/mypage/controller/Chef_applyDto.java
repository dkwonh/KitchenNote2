package yh.mypage.controller;

public class Chef_applyDto {

	String member_id;
	String sns_address;
	String tel;
	String content;
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getSns_address() {
		return sns_address;
	}
	public void setSns_address(String sns_address) {
		this.sns_address = sns_address;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Override
	public String toString() {
		return "Chef_applyDto [member_id=" + member_id + ", sns_address=" + sns_address + ", tel=" + tel + ", content="
				+ content + "]";
	}
	
	
}
