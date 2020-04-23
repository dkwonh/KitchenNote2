package yh.mypage.service;

import java.util.List;
import java.util.Map;

import yh.mypage.controller.ChefDto;
import yh.mypage.controller.Chef_applyDto;
import yh.mypage.controller.MemberInfoDto;

public interface MemberInfoService {

	public void submit(Chef_applyDto dto) throws Exception; // 쉐프 신청

	public ChefDto view(MemberInfoDto mem) throws Exception; // 회원 정보
	
	public int memUpdate(MemberInfoDto dto) throws Exception; // members 업데이트

	public int chefUpdate(ChefDto dto) throws Exception; // chef 업데이트

	public void delete(String member_id) throws Exception; // 회원 탈퇴

	public String pwd(String member_id) throws Exception; // 비밀번호 확인

	public int changePwd(Map<String,String> map) throws Exception;

	public int checkPwd(String password) throws Exception; // 비밀번호 변경

}
