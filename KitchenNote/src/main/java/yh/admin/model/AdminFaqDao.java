package yh.admin.model;

import java.util.List;
import java.util.Map;

import yh.admin.controller.AdminFaqDto;
import yh.custom.controller.BoardDto;

public interface AdminFaqDao {

	public void create(AdminFaqDto dto) throws Exception;

	public AdminFaqDto read(int bno) throws Exception;

	public int update(AdminFaqDto dto) throws Exception;

	public void delete(int bno) throws Exception;

	public List<AdminFaqDto> listAll() throws Exception;

	public void increaseViewcnt(int bno) throws Exception;
	
	/*
	 * public List<Map<String,Object>> pageList(Criteria cri) throws Exception;
	 * 
	 * public int countBoardList();
	 */
}