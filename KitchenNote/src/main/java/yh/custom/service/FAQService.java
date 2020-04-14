package yh.custom.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import yh.custom.controller.FAQDto;

public interface FAQService {

	public FAQDto read(int bno) throws Exception;
	
	public List<FAQDto> listAll(int start) throws Exception;
	
	public void increaseViewcnt(int bno, HttpSession session) throws Exception;
	
	public int count() throws Exception;
}
