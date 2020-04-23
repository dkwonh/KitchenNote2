package wh.user.home.model;

public class HomePageMemberDto {
	String member_id;
	int fork;
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getFork() {
		return fork;
	}
	public void setFork(int fork) {
		this.fork = fork;
	}
	@Override
	public String toString() {
		return "HomePageMemberDto [member_id=" + member_id + ", fork=" + fork + "]";
	}
	
	
}
