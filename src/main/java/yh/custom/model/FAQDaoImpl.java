package yh.custom.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import yh.admin.controller.FilterDto;
import yh.custom.controller.FAQDto;


public class FAQDaoImpl extends SqlSessionDaoSupport implements FAQDao{

	public FAQDto read(int bno) throws Exception{
		return getSqlSession().selectOne("FAQ.FAQView", bno );
	}
	public List<FAQDto> listAll(FilterDto dto) throws Exception {
		return getSqlSession().selectList("FAQ.listAll", dto);
	}

	public void increaseViewcnt(int bno) throws Exception {
		getSqlSession().update("FAQ.increaseViewcnt", bno);
	}
	
	public int count(FilterDto dto) throws Exception {
		return getSqlSession().selectOne("FAQ.count",dto);
	}
}
