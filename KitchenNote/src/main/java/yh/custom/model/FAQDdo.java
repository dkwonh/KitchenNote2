package yh.custom.model;

import java.util.List;

import yh.custom.controller.FAQDto;

public interface FAQDdo {

	public FAQDto read(int bno) throws Exception;
	
	public List<FAQDto> listAll() throws Exception;
	
	public void increaseViewcnt(int bno) throws Exception;
}
