package yh.admin.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import yh.admin.controller.AdminFaqDto;

public interface AdminFaqService {

// 게시글 작성
	public void create(AdminFaqDto dto) throws Exception;

// 게시글 상세보기
	public AdminFaqDto read(int bno) throws Exception;

// 게시글 수정
	public void update(AdminFaqDto dto) throws Exception;

// 게시글 삭제
	public void delete(int bno) throws Exception;

// 게시글 전체 목록
	public List<AdminFaqDto> listAll(int start) throws Exception;

// 게시글 조회
	public void increaseViewcnt(int bno, HttpSession session) throws Exception;

	public int count() throws Exception;


}