package yh.admin.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import yh.admin.controller.AdminFaqDto;
import yh.admin.controller.AdminFaqService;
import yh.admin.model.AdminFaqDao;

@Service
public class AdminFaqServiceImpl implements AdminFaqService {

	@Autowired
	AdminFaqDao dao;

	@Override
	public void create(AdminFaqDto dto) throws Exception {
	
		dao.create(dto);
	}

	@Override
	public AdminFaqDto read(int bno) throws Exception {
		AdminFaqDto dto = dao.read(bno);
		return dto;
	}

	@Override
	public void update(AdminFaqDto dto) throws Exception {
	
		dao.update(dto);
	}

	@Override
	public void delete(int bno) throws Exception {
		dao.delete(bno);
	}

	@Override
	public List<AdminFaqDto> listAll() throws Exception {
		return dao.listAll();
	}

	@Override
	public void increaseViewcnt(int bno, HttpSession session) throws Exception {
		dao.increaseViewcnt(bno);

	}
	/*
	 * @Override public List<Map<String,Object>> pageList(Criteria cri) throws
	 * Exception{ return dao.pageList(cri); }
	 * 
	 * @Override public int countBoardList() throws Exception {
	 * 
	 * return dao.countBoardList(); }
	 */
}
