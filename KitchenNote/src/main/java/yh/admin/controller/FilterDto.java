package yh.admin.controller;

public class FilterDto {

	String order; // 구분 : 레시피 / 결제 및 환불 등등..
	String search; // 제목 , 조회수
	String content; // 검색 내용
	int start; // 시작 고정
	
	
	public String getOrder() {
		return order;
	}


	public void setOrder(String order) {
		this.order = order;
	}


	public String getSearch() {
		return search;
	}


	public void setSearch(String search) {
		this.search = search;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public int getStart() {
		return start;
	}


	public void setStart(int start) {
		this.start = start;
	}

	@Override
	public String toString() {
		return "FilterDto [order=" + order + ", search=" + search + ", content=" + content + ", start=" + start
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString()
				+ "]";
	}
	
	
}
