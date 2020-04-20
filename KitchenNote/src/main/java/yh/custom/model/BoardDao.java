package yh.custom.model;

import java.util.List;
import java.util.Map;

import yh.admin.controller.FilterDto;
import yh.custom.controller.BoardDto;

public interface BoardDao {

	public void create(BoardDto dto) throws Exception;

	public BoardDto read(int bno) throws Exception;

	public int update(BoardDto dto) throws Exception;

	public void delete(int bno) throws Exception;

	public List<BoardDto> listAll(FilterDto dto) throws Exception;

	public void increaseViewcnt(int bno) throws Exception;
	
	public int count(FilterDto dto) throws Exception;
}
