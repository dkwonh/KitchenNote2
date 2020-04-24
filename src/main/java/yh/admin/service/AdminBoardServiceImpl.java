package yh.admin.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import yh.admin.controller.AdminBoardDto;
import yh.admin.controller.FilterDto;
import yh.admin.model.AdminBoardDao;

// 1:1 문의 관리자 페이지
@Service
public class AdminBoardServiceImpl implements AdminBoardService {

	@Autowired
	AdminBoardDao dao;

	@Override
	public void create(AdminBoardDto dto) throws Exception {
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String to = sdf.format(date);
		dto.setReg_date(date);
		dao.create(dto);
	} // 조회  - 날짜 형식 포맷

	@Override
	public AdminBoardDto read(int num) throws Exception {
		AdminBoardDto dto = dao.read(num);
		return dto;
	} // 상세 보기

	@Override
	public void update(AdminBoardDto dto) throws Exception {
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String to = sdf.format(date);
		dto.setReg_date(date);
		dao.update(dto);
	}// 수정

	@Override
	public void delete(int num) throws Exception {
		dao.delete(num);
	} // 삭제

	@Override
	public List<AdminBoardDto> listAll(FilterDto dto) throws Exception {
		return dao.listAll(dto);
	} // 리스트

	@Override
	public void increaseViewcnt(int num, HttpSession session) throws Exception {
		dao.increaseViewcnt(num);
	} // 조회수
	
	@Override
	public int count(FilterDto dto) throws Exception{
		return dao.count(dto);
	}
}
