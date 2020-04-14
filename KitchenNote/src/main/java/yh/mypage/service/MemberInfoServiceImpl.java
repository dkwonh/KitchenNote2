package yh.mypage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import yh.custom.controller.BoardDto;
import yh.mypage.controller.ChefDto;
import yh.mypage.controller.Chef_applyDto;
import yh.mypage.controller.MemberInfoDto;
import yh.mypage.model.MemberInfoDao;

@Service
public class MemberInfoServiceImpl implements MemberInfoService{

	@Autowired
	MemberInfoDao dao;

	public List<MemberInfoDto> listAll() throws Exception {
		return dao.listAll();
	} // 역할 x
	
	public void submit(Chef_applyDto dto) throws Exception {
		dao.submit(dto);
	} // 쉐프 신청서 제출

	public MemberInfoDto view(String member_id) throws Exception {
		MemberInfoDto dto = dao.view(member_id);
		return dto;
	} // 회원 정보 수정 페이지

	public void update(MemberInfoDto dto) throws Exception {
		dao.update(dto);
	} // 회원정보 변경

	public void delete(String member_id) throws Exception {
		dao.delete(member_id);
	} // 회원 탈퇴
	/*
	 * public MemberInfoDto confirmPwd(String password) throws Exception{ return
	 * dao.confirmPwd(password); }
	 */
}
