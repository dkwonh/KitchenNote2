package wh.admin.manage.model;

public class ChefApplyDto {
	private String member_id;
	private String nickname;
	private String sns_address;
	private String tel;
	private String content;
	
	
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
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
	
	
}
