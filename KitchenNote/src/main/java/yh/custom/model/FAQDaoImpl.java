package yh.custom.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import yh.custom.controller.FAQDto;


public class FAQDaoImpl extends SqlSessionDaoSupport implements FAQDdo{

	public FAQDto read(int bno) throws Exception{
		return getSqlSession().selectOne("FAQ.FAQView", bno );
	}
	public List<FAQDto> listAll(int start) throws Exception {
		return getSqlSession().selectList("FAQ.listAll", start);
	}

	public void increaseViewcnt(int bno) throws Exception {
		getSqlSession().update("FAQ.increaseViewcnt", bno);
	}
	
	public int count() throws Exception {
		return getSqlSession().selectOne("FAQ.count");
	}
}
