package yh.mypage.model;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import yh.mypage.controller.MemberInfoDto;

public class MemberInfoDaoImpl extends SqlSessionDaoSupport implements MemberInfoDao {

	public void create(MemberInfoDto dto) throws Exception{
	getSqlSession().insert("memberinfo.insert",dto);
	}
	public MemberInfoDto read(String member_id) throws Exception{
		return getSqlSession().selectOne("memberinfo.view", member_id);
	}
	 public String update(MemberInfoDto dto) throws Exception{
		return getSqlSession().update("memberinfo.update");
	}
	
	public void delete(String member_id) throws Exception{
		getSqlSession().delete("memberinfo.delete",member_id);
	}
}

