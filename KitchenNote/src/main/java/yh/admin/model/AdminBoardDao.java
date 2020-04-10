package yh.admin.model;

import java.util.List;
import java.util.Map;

import yh.custom.controller.BoardDto;

public interface AdminBoardDao {

	public void create(BoardDto dto) throws Exception;

	public BoardDto read(int bno) throws Exception;

	public int update(BoardDto dto) throws Exception;

	public void delete(int bno) throws Exception;

	public List<BoardDto> listAll() throws Exception;

	public void increaseViewcnt(int bno) throws Exception;
	
	/*
	 * public List<Map<String,Object>> pageList(Criteria cri) throws Exception;
	 * 
	 * public int countBoardList();
	 */
}