package hn.user.model;

public class LoginCommand {

	private String member_id;
	private String password;
	private int Level;
	private String nickname;
	
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getLevel() {
		return Level;
	}
	public void setLevel(int level) {
		Level = level;
	}
	
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
	@Override
	public String toString() {
		return "LoginCommand [member_id=" + member_id + ", password=" + password + ", Level=" + Level + ", nickname="
				+ nickname + "]";
	}
	
}
