package yh.admin.model;

import java.util.List;

import yh.admin.controller.AdminBoardDto;

public interface AdminBoardDao {

	public void create(AdminBoardDto dto) throws Exception;

	public AdminBoardDto read(int num) throws Exception;

	public int update(AdminBoardDto dto) throws Exception;

	public void delete(int num) throws Exception;

	public List<AdminBoardDto> listAll() throws Exception;

	public void increaseViewcnt(int num) throws Exception;
	
	/*
	 * public List<Map<String,Object>> pageList(Criteria cri) throws Exception;
	 * 
	 * public int countBoardList();
	 */
}
