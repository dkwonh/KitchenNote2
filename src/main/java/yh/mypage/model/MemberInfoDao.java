package yh.mypage.model;

import java.util.List;
import java.util.Map;

import yh.mypage.controller.ChefDto;
import yh.mypage.controller.Chef_applyDto;
import yh.mypage.controller.MemberInfoDto;

public interface MemberInfoDao {

	public void submit(Chef_applyDto dto) throws Exception; // 쉐프 신청 양식

	public MemberInfoDto view(String member_id) throws Exception; // 회원 정보 수정 첫 페이지

	public int memUpdate(MemberInfoDto dto) throws Exception; // 회원 정보 변경

	public int chefUpdate(ChefDto dto) throws Exception; // 회원 정보 변경

	public void delete(String member_id) throws Exception; // 회원 탈퇴

	public int checkPwd(String password) throws Exception; // 비밀 번호 확인

	public int pwd(String password) throws Exception; // 비밀 번호 확인

	public int changePwd(Map<String, String> map) throws Exception; // 비밀 번호 변경

}
