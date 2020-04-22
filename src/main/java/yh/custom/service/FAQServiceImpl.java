package yh.custom.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import yh.admin.controller.FilterDto;
import yh.custom.controller.FAQDto;
import yh.custom.model.FAQDao;

@Service
public class FAQServiceImpl implements FAQService {

	@Autowired
	FAQDao dao;

	@Override
	public FAQDto read(int bno) throws Exception {
		FAQDto dto = dao.read(bno);
		return dto;
	}

	@Override
	public List<FAQDto> listAll(FilterDto dto) throws Exception {
		return dao.listAll(dto);
	}

	@Override
	public void increaseViewcnt(int bno, HttpSession session) throws Exception {
		dao.increaseViewcnt(bno);

	}
	
	@Override
	public int count(FilterDto dto) throws Exception {
		return dao.count(dto);
	}
}
