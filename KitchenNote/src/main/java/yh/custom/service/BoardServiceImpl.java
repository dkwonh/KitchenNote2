package yh.custom.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import yh.custom.controller.BoardDto;
import yh.custom.model.BoardDao;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardDao dao;

	@Override
	public void create(BoardDto dto) throws Exception {

		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String to = sdf.format(date);
		dto.setReg_date(date);
		dao.create(dto);
	}

	@Override
	public BoardDto read(int bno) throws Exception {
		BoardDto dto = dao.read(bno);
		return dto;
	}

	@Override
	public void update(BoardDto dto) throws Exception {
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String to = sdf.format(date);
		dto.setReg_date(date);
		dao.update(dto);
	}

	@Override
	public void delete(int bno) throws Exception {
		dao.delete(bno);
	}

	@Override
	public List<BoardDto> listAll(int start) throws Exception {
		return dao.listAll(start);
	}

	@Override
	public void increaseViewcnt(int bno, HttpSession session) throws Exception {
		dao.increaseViewcnt(bno);

	}

	@Override
	public int count() throws Exception {
		return dao.count();
	}
}
