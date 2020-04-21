package yh.custom.controller;

import java.util.Date;

public class BoardDto {

	int num;
	String subject;
	String content;
	String member_id;
	Date reg_date;
	String answer;
	String status;
	int readcount;
	boolean secret;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public boolean isSecret() {
		return secret;
	}
	public void setSecret(boolean secret) {
		this.secret = secret;
	}
	@Override
	public String toString() {
		return "BoardDto [num=" + num + ", subject=" + subject + ", content=" + content + ", member_id=" + member_id
				+ ", reg_date=" + reg_date + ", answer=" + answer + ", status=" + status + ", readcount=" + readcount
				+ ", secret=" + secret + "]";
	}
	
	
}
