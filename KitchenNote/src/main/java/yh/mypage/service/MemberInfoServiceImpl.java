package yh.mypage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import yh.mypage.controller.MemberInfoDto;
import yh.mypage.model.MemberInfoDao;

@Service
public class MemberInfoServiceImpl {

	@Autowired
	MemberInfoDao dao;
	
	public void create(MemberInfoDto dto) throws Exception{
		dao.create(dto);
	}
	
	public MemberInfoDto read(String member_id) throws Exception{
		MemberInfoDto dto = dao.read(member_id);
		return dto;
	}
	
	public void update(MemberInfoDto dto) throws Exception{
		dao.update(dto);
	}
	public void delete(String member_id) throws Exception{
		dao.delete(member_id);
	}
}
