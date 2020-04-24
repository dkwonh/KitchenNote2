package yh.admin.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import yh.admin.controller.AdminFaqDto;
import yh.admin.controller.FilterDto;
import yh.admin.model.AdminFaqDao;

// 자주 묻는 질문 관리자
@Service
public class AdminFaqServiceImpl implements AdminFaqService {

	@Autowired
	AdminFaqDao dao;

	@Override
	public void create(AdminFaqDto dto) throws Exception {

		dao.create(dto);
	}// 작성

	@Override
	public AdminFaqDto read(int bno) throws Exception {
		AdminFaqDto dto = dao.read(bno);
		return dto;
	} // 상세 보기

	@Override
	public void update(AdminFaqDto dto) throws Exception {

		dao.update(dto);
	} // 수정

	@Override
	public void delete(int bno) throws Exception {
		dao.delete(bno);
	} // 삭제

	@Override
	public List<AdminFaqDto> listAll(FilterDto dto) throws Exception {
		return dao.listAll(dto);
	} // 리스트

	@Override
	public void increaseViewcnt(int bno, HttpSession session) throws Exception {
		dao.increaseViewcnt(bno);

	} // 조회수

	@Override
	public int count(FilterDto dto) throws Exception {
		return dao.count(dto);
	}
}
