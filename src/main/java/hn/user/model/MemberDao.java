package hn.user.model;

import java.util.List;
import org.mybatis.spring.support.SqlSessionDaoSupport;

public class MemberDao extends SqlSessionDaoSupport{

	public List<MemberDto> getAll() {
		return getSqlSession().selectList("member.allMember");
	}
	//회원가입 
	public List<MemberDto> insert(MemberDto mdto) {
		return getSqlSession().selectList("member.insert", mdto);
	}
	
	//수정
	public List<MemberDto> update(MemberDto mdto) {
		return getSqlSession().selectList("member.update", mdto);
	}
	//비밀번호 랜덤 생성 저장
	public List<MemberDto> updatePW(MemberDto mdto) {
		return getSqlSession().selectList("member.updatePW", mdto);
	}
	
	//탈퇴
	public List<MemberDto> delete(String mem) {
		return getSqlSession().selectList("member.delete", mem);
	}

	//아이디 중복/회원체크
	public int emChk(LoginCommand lc) {
		return getSqlSession().selectOne("member.emChk", lc);
	}
	//닉네임 중복
	public int nkChk(LoginCommand lc) {
		return getSqlSession().selectOne("member.nkChk", lc);		
	}
	//로그인
	public List<MemberDto> loginOk(LoginCommand lc) {
		return getSqlSession().selectList("member.loginOk", lc);
	}
	
}
