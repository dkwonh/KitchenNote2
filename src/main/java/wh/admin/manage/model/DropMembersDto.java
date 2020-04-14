package wh.admin.manage.model;

import java.sql.Timestamp;

//탈퇴자 정보 
public class DropMembersDto {

	// 회원아이디
	private String memberId;

	// 별명
	private String nickname;

	// 가입일
	private Timestamp joinDate;

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public Timestamp getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(Timestamp joinDate) {
		this.joinDate = joinDate;
	}
}
