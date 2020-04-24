package yh.admin.controller;

// 회원 가입자 수
public class AdminUserDto {

	int userCount;
	int monthUser;
	int yearUser;
	
	public int getUserCount() {
		return userCount;
	}
	public void setUserCount(int userCount) {
		this.userCount = userCount;
	}
	public int getMonthUser() {
		return monthUser;
	}
	public void setMonthUser(int monthUser) {
		this.monthUser = monthUser;
	}
	public int getYearUser() {
		return yearUser;
	}
	public void setYearUser(int yearUser) {
		this.yearUser = yearUser;
	}
	@Override
	public String toString() {
		return "AdminUserDto [userCount=" + userCount + ", monthUser=" + monthUser + ", yearUser=" + yearUser + "]";
	}
	
	
}
