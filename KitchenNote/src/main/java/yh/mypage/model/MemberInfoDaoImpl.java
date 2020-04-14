package yh.mypage.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import yh.custom.controller.BoardDto;
import yh.mypage.controller.Chef_applyDto;
import yh.mypage.controller.MemberInfoDto;

public class MemberInfoDaoImpl extends SqlSessionDaoSupport implements MemberInfoDao {

	@Override
	public void submit(Chef_applyDto dto) throws Exception {
		getSqlSession().insert("MemberInfo.submit", dto);
	}

	@Override
	public MemberInfoDto view(String member_id) throws Exception {
		return getSqlSession().selectOne("MemberInfo.view", member_id);
	}

	@Override
	public int update(MemberInfoDto dto) throws Exception {
		return getSqlSession().update("MemberInfo.update");
	}

	@Override
	public void delete(String member_id) throws Exception {
		getSqlSession().delete("MemberInfo.delete", member_id);
	}

	@Override
	public List<MemberInfoDto> listAll() throws Exception {
		return getSqlSession().selectList("MemberInfo.listAll");
	}
	/*
	 * public MemberInfoDto confirmPwd(String password) throws Exception{
	 * getSqlSession().selectOne(password); }
	 */
}
