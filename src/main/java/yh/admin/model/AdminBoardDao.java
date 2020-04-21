package yh.admin.model;

import java.util.List;

import yh.admin.controller.AdminBoardDto;
import yh.admin.controller.FilterDto;

public interface AdminBoardDao {

	public void create(AdminBoardDto dto) throws Exception;

	public AdminBoardDto read(int num) throws Exception;

	public int update(AdminBoardDto dto) throws Exception;

	public void delete(int num) throws Exception;

	public List<AdminBoardDto> listAll(FilterDto dto) throws Exception;

	public void increaseViewcnt(int num) throws Exception;
	
	public int count(FilterDto dto) throws Exception;
	
}
