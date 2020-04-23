package yh.mypage.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import yh.mypage.controller.ChefDto;
import yh.mypage.controller.Chef_applyDto;
import yh.mypage.controller.MemberInfoDto;

public class MemberInfoDaoImpl extends SqlSessionDaoSupport implements MemberInfoDao {

	@Override
	public void submit(Chef_applyDto dto) throws Exception {
		getSqlSession().insert("MemberInfo.submit", dto);
	} // 쉐프 신청서 제출

	@Override
	public ChefDto view(MemberInfoDto mem) throws Exception {
		System.out.println(mem);
		return getSqlSession().selectOne("MemberInfo.view", mem);
	} // 회원정보 출력

	@Override
	public ChefDto chefview(MemberInfoDto mem) throws Exception{
		return getSqlSession().selectOne("MemberInfo.chefview",mem);
	}
	@Override
	public int memUpdate(MemberInfoDto dto) throws Exception {
		return getSqlSession().update("MemberInfo.memupdate", dto);
	} // members 업데이트

	@Override
	public int chefUpdate(ChefDto dto) throws Exception {
		getSqlSession().update("MemberInfo.memupdate", dto);
		return getSqlSession().update("MemberInfo.chefupdate", dto);
	} // chef 업데이트

	@Override
	public void delete(String member_id) throws Exception {
		getSqlSession().delete("MemberInfo.delete", member_id);
	} // 회원 탈퇴

	@Override
	public int checkPwd(String password) throws Exception {
		return getSqlSession().selectOne("MemberInfo.checkPwd",password);
	} // 비밀번호 확인

	public String pwd(String member_id) throws Exception {
		return getSqlSession().selectOne("MemberInfo.pwd", member_id);
	} // 비밀번호 확인
	
	public int changePwd(Map<String,String> map) throws Exception {
		return getSqlSession().update("MemberInfo.changePwd", map);
	} // 비밀번호 변경

}
