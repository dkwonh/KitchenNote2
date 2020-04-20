package yh.custom.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import yh.admin.controller.FilterDto;
import yh.custom.controller.BoardDto;

public interface BoardService {

// 게시글 작성
	public void create(BoardDto dto) throws Exception;

// 게시글 상세보기
	public BoardDto read(int bno) throws Exception;

// 게시글 수정
	public void update(BoardDto dto) throws Exception;

// 게시글 삭제
	public void delete(int bno) throws Exception;

// 게시글 전체 목록
	public List<BoardDto> listAll(FilterDto dto) throws Exception;

// 게시글 조회
	public void increaseViewcnt(int bno, HttpSession session) throws Exception;

	public int count(FilterDto dto) throws Exception;


}