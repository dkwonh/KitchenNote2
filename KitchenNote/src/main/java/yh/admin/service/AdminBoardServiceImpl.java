package yh.admin.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import yh.admin.controller.AdminBoardDto;
import yh.admin.model.AdminBoardDao;


@Service
public class AdminBoardServiceImpl implements AdminBoardService {

	@Autowired
	AdminBoardDao dao;

	@Override
	public void create(AdminBoardDto dto) throws Exception {
	System.out.println(dto);
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String to = sdf.format(date);
		dto.setRegdate(date);
		dao.create(dto);
	}

	@Override
	public AdminBoardDto read(int bno) throws Exception {
		AdminBoardDto dto = dao.read(bno);
		return dto;
	}

	@Override
	public void update(AdminBoardDto dto) throws Exception {
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String to = sdf.format(date);
		dto.setRegdate(date);
		dao.update(dto);
	}

	@Override
	public void delete(int bno) throws Exception {
		dao.delete(bno);
	}

	@Override
	public List<AdminBoardDto> listAll() throws Exception {
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
