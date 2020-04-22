package yh.mypage.controller;

import java.sql.Timestamp;

public class MemberInfoDto {

	String member_id;
	String password;
	String nickname;
	int fork;
	Timestamp join_date;
	String picture;
	int level;

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

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public int getFork() {
		return fork;
	}

	public void setFork(int fork) {
		this.fork = fork;
	}

	public Timestamp getJoin_date() {
		return join_date;
	}

	public void setJoin_date(Timestamp join_date) {
		this.join_date = join_date;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	@Override
	public String toString() {
		return "MemberInfoDto [member_id=" + member_id + ", password=" + password + ", nickname=" + nickname + ", fork="
				+ fork + ", join_date=" + join_date + ", picture=" + picture + ", level=" + level + "]";
	}

}
