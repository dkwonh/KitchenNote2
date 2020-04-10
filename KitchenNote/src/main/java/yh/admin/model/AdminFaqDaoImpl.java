package yh.admin.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import yh.admin.controller.AdminFaqDto;
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

	public List<AdminFaqDto> listAll() throws Exception {
		return getSqlSession().selectList("admin.listAll");
	}

	public void increaseViewcnt(int bno) throws Exception {
		getSqlSession().update("admin.increaseViewcnt", bno);
	}

	/*
	 * @Override public List<Map<String,Object>> pageList(Criteria cri){ return
	 * getSqlSession().selectList("customer.pageList", cri); }
	 * 
	 * public int countBoardList() { return
	 * getSqlSession().selectOne("customer.countBoardList"); }
	 */
}
