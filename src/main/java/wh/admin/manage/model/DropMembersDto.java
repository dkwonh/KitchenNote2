package wh.admin.manage.model;

import java.sql.Timestamp;

//탈퇴자 정보 
public class DropMembersDto {

	// 회원아이디
	private String member_id;

	// 별명
	private String nickname;

	// 탈퇴일
	private Timestamp drop_date;

	
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

	public Timestamp getDrop_date() {
		return drop_date;
	}

	public void setDrop_date(Timestamp drop_date) {
		this.drop_date = drop_date;
	}

}
