package custom.Model;

import java.util.List;

import custom.controller.BoardDto;

public interface BoardDao {

	public void create(BoardDto dto) throws Exception;

	public BoardDto read(int bno) throws Exception;

	public int update(BoardDto dto) throws Exception;

	public void delete(int bno) throws Exception;

	public List<BoardDto> listAll() throws Exception;

	public void increaseViewcnt(int bno) throws Exception;
}
