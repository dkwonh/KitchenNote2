package yh.admin.controller;

// 상세 검색 DTO
public class FilterDto {

	String select1; // 구분 : 레시피 / 결제 및 환불 등등..
	String select2; // 제목 , 내용
	String select3; // 검색 내용
	int start; // 시작 고정
	String member_id;

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getSelect1() {
		return select1;
	}

	public void setSelect1(String select1) {
		this.select1 = select1;
	}

	public String getSelect2() {
		return select2;
	}

	public void setSelect2(String select2) {
		this.select2 = select2;
	}

	public String getSelect3() {
		return select3;
	}

	public void setSelect3(String select3) {
		this.select3 = select3;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	@Override
	public String toString() {
		return "FilterDto [select1=" + select1 + ", select2=" + select2 + ", select3=" + select3 + ", start=" + start
				+ "]";
	}

}
