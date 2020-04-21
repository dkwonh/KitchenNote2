package yh.admin.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.support.SqlSessionDaoSupport;

import yh.admin.controller.AdminFaqDto;
import yh.admin.controller.FilterDto;
import yh.custom.controller.BoardDto;


public class AdminFaqDaoImpl extends SqlSessionDaoSupport implements AdminFaqDao {

	public void create(AdminFaqDto dto) throws Exception {
		getSqlSession().insert("admin.insert", dto);
	}

	public AdminFaqDto read(int bno) throws Exception {
		return getSqlSession().selectOne("admin.view", bno);
	}

	public int update(AdminFaqDto dto) throws Exception {
		return getSqlSession().update("admin.updateArticle", dto);
	}

	public void delete(int bno) throws Exception {
		getSqlSession().delete("admin.deleteArticle", bno);
	}

	public List<AdminFaqDto> listAll(FilterDto dto) throws Exception {
		return getSqlSession().selectList("admin.listAll",dto);
	}

	public void increaseViewcnt(int bno) throws Exception {
		getSqlSession().update("admin.increaseViewcnt", bno);
	}
	public int count(FilterDto dto) throws Exception {
		return getSqlSession().selectOne("admin.count",dto);
	}

	
}