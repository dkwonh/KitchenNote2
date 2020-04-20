package yh.custom.model;

import java.util.List;

import yh.admin.controller.FilterDto;
import yh.custom.controller.FAQDto;

public interface FAQDao {

	public FAQDto read(int bno) throws Exception;
	
	public List<FAQDto> listAll(FilterDto dto) throws Exception;
	
	public void increaseViewcnt(int bno) throws Exception;
	
	public int count(FilterDto dto) throws Exception;
}
