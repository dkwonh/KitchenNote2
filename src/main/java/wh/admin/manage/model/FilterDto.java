package wh.admin.manage.model;

public class FilterDto {
	String filter;//구분자 닉네임 아이디 제목 내용
	String search;//검색 내용 
	int start;//시작페이지
	
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public String getFilter() {
		return filter;
	}
	public void setFilter(String filter) {
		this.filter = filter;
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
}
