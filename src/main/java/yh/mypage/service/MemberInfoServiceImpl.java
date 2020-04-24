package yh.mypage.service;

import java.util.List;
import java.util.Map;

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
	
	public void submit(Chef_applyDto dto) throws Exception {
		dao.submit(dto);
	} // 쉐프 신청서 제출

	public ChefDto view(MemberInfoDto mem) throws Exception {
		ChefDto dto = new ChefDto();
		if(mem.getLevel() <= 1) {
			dao.view(mem);
			System.out.println("일반회원:::"+dto);
		} else {
		   dao.chefview(mem);
		   System.out.println("쉐프회원:::"+dto);
		}
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
	
	public int checkPwd(String password) throws Exception{
		int a = dao.checkPwd(password);
		return a;
	} // 필요없음
	
	public String pwd(String member_id) throws Exception{
		ChefDto dto = new ChefDto();
		if(dto.getLevel() <= 1) {
			System.out.println("pwd:::"+dao.pwd(member_id));
			return dao.pwd(member_id);
		
		}else {
		System.out.println("chefpwd:::"+dao.chefpwd(member_id));
		return	dao.chefpwd(member_id);
		}
	} // 일반 / 쉐프 비번 확인
	
	public int changePwd(Map<String,String> map) throws Exception{
		return dao.changePwd(map);
	} // 비밀번호 변경

	@Override
	public String chefpwd(String member_id) throws Exception {
		// TODO Auto-generated method stub
		return null;
	} 

}
