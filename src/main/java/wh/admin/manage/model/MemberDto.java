package wh.admin.manage.model;

import java.sql.Timestamp;

public class MemberDto {
	// 회원아이디
	private String member_id;

	// 비밀번호
	private String password;

	// 별명
	private String nickname;

	// 소지포크
	private Integer fork;

	// 회원 프로필사진
	private String picture;

	// 회원등급
	private Integer level;

	// 가입일
	private Timestamp join_date;
	
	

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public Timestamp getJoin_date() {
		return join_date;
	}

	public void setJoin_date(Timestamp join_date) {
		this.join_date = join_date;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public Integer getFork() {
		return fork;
	}

	public void setFork(Integer fork) {
		this.fork = fork;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public Integer getLevel() {
		return level;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}

	@Override
	public String toString() {
		return "MemberDto [memberId=" + member_id + ", password=" + password + ", nickname=" + nickname + ", fork="
				+ fork + ", picture=" + picture + ", level=" + level + ", join_date=" + join_date + "]";
	}
	
	
}
