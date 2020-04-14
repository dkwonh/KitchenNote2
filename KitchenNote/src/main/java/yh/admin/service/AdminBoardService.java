package yh.admin.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import yh.admin.controller.AdminBoardDto;

public interface AdminBoardService {

// 게시글 작성
	public void create(AdminBoardDto dto) throws Exception;

// 게시글 상세보기
	public AdminBoardDto read(int num) throws Exception;

// 게시글 수정
	public void update(AdminBoardDto dto) throws Exception;

// 게시글 삭제
	public void delete(int num) throws Exception;

// 게시글 전체 목록
	public List<AdminBoardDto> listAll(int start) throws Exception;

// 게시글 조회
	public void increaseViewcnt(int num, HttpSession session) throws Exception;

	public int count() throws Exception;


}