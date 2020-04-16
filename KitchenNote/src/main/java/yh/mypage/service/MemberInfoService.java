package yh.mypage.service;

import java.util.List;

import yh.mypage.controller.ChefDto;
import yh.mypage.controller.Chef_applyDto;
import yh.mypage.controller.MemberInfoDto;

public interface MemberInfoService {
	
	public void submit(Chef_applyDto dto) throws Exception; // 쉐프 신청
	
	public MemberInfoDto view(String member_id) throws Exception; // 회원 정보

	public int memUpdate(MemberInfoDto dto) throws Exception; // members 업데이트
	
	public int chefUpdate(ChefDto dto) throws Exception; // chef 업데이트

	public void delete(String member_id) throws Exception; // 회원 탈퇴
	
	public MemberInfoDto pwd(String password) throws Exception; // 비밀번호 확인
	
	public int changePwd(MemberInfoDto dto) throws Exception;
	/*
	 * public int checkPwd(MemberInfoDto dto) throws Exception; // 비밀번호 변경
	 */	
	/* public MemberInfoDto confirmPwd(String password) throws Exception; */
}
