package yh.mypage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import yh.mypage.controller.ChefDto;
import yh.mypage.controller.Chef_applyDto;
import yh.mypage.controller.MemberInfoDto;
import yh.mypage.model.MemberInfoDao;

@Service
public class MemberInfoServiceImpl implements MemberInfoService{

	@Autowired
	MemberInfoDao dao;
	
	/*
	 * public MemberInfoDto checkPwd(String password) throws Exception{
	 * MemberInfoDto dto = dao.checkPwd(password); return dto; }
	 */
	
	public void submit(Chef_applyDto dto) throws Exception {
		dao.submit(dto);
	} // 쉐프 신청서 제출

	public MemberInfoDto view(String member_id) throws Exception {
		MemberInfoDto dto = dao.view(member_id);
		return dto;
	} // 회원 정보 수정 페이지

	public int memUpdate(MemberInfoDto dto) throws Exception{
		return dao.memUpdate(dto);
	} // members 업데이트
	
	public int chefUpdate(ChefDto dto) throws Exception {
		return dao.chefUpdate(dto);
	} // chef 업데이트

	public void delete(String member_id) throws Exception {
		dao.delete(member_id);
	} // 회원 탈퇴
	
	public int checkPwd(MemberInfoDto dto) throws Exception{
		return dao.checkPwd(dto);
	}
	
	public MemberInfoDto pwd(String password) throws Exception{
		MemberInfoDto dto = dao.pwd(password);
		return dto;
	}
	
	public int changePwd(MemberInfoDto dto) throws Exception{
		return dao.changePwd(dto);
	} 
	/*
	 * public MemberInfoDto confirmPwd(String password) throws Exception{ return
	 * dao.confirmPwd(password); }
	 */
}
