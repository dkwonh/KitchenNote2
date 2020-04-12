package yh.admin.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import yh.admin.controller.AdminBoardDto;


public class AdminBoardDaoImpl extends SqlSessionDaoSupport implements AdminBoardDao {

	public void create(AdminBoardDto dto) throws Exception {
		getSqlSession().insert("adminBoard.insert", dto);
	}

	public AdminBoardDto read(int bno) throws Exception {
		return getSqlSession().selectOne("adminBoard.view", bno);
	}

	public int update(AdminBoardDto dto) throws Exception {
		return getSqlSession().update("adminBoard.updateArticle", dto);
	}

	public void delete(int bno) throws Exception {
		getSqlSession().delete("adminBoard.deleteArticle", bno);
	}

	public List<AdminBoardDto> listAll() throws Exception {
		return getSqlSession().selectList("adminBoard.listAll");
	}

	public void increaseViewcnt(int bno) throws Exception {
		getSqlSession().update("adminBoard.increaseViewcnt", bno);
	}

	/*
	 * @Override public List<Map<String,Object>> pageList(Criteria cri){ return
	 * getSqlSession().selectList("customer.pageList", cri); }
	 * 
	 * public int countBoardList() { return
	 * getSqlSession().selectOne("customer.countBoardList"); }
	 */
}
