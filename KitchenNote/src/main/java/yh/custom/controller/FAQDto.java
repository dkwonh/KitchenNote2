package yh.custom.controller;

import java.util.Date;

public class FAQDto {

	int bno;
	String title;
	String content;
	String menu;
	int viewcnt;
	
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getMenu() {
		return menu;
	}
	public void setMenu(String menu) {
		this.menu = menu;
	}
	public int getViewcnt() {
		return viewcnt;
	}
	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}
	@Override
	public String toString() {
		return "FAQDto [bno=" + bno + ", title=" + title + ", content=" + content +
				"menu=" + menu + ", viewcnt=" + viewcnt + "]";
	}

	
}
