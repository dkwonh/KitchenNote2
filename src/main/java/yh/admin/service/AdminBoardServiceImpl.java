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
		dto.setReg_date(date);
		dao.create(dto);
	}

	@Override
	public AdminBoardDto read(int num) throws Exception {
		AdminBoardDto dto = dao.read(num);
		return dto;
	}

	@Override
	public void update(AdminBoardDto dto) throws Exception {
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String to = sdf.format(date);
		dto.setReg_date(date);
		dao.update(dto);
	}

	@Override
	public void delete(int num) throws Exception {
		dao.delete(num);
	}

	@Override
	public List<AdminBoardDto> listAll(FilterDto dto) throws Exception {
		return dao.listAll(dto);
	}

	@Override
	public void increaseViewcnt(int num, HttpSession session) throws Exception {
		dao.increaseViewcnt(num);
	}
	
	@Override
	public int count(FilterDto dto) throws Exception{
		return dao.count(dto);
	}
}
