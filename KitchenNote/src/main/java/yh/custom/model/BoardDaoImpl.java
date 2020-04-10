package yh.custom.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import yh.custom.controller.BoardDto;


public class BoardDaoImpl extends SqlSessionDaoSupport implements BoardDao {

	public void create(BoardDto dto) throws Exception {
		getSqlSession().insert("customer.insert", dto);
	}

	public BoardDto read(int bno) throws Exception {
		return getSqlSession().selectOne("customer.view", bno);
	}

	public int update(BoardDto dto) throws Exception {
		return getSqlSession().update("customer.updateArticle", dto);
	}

	public void delete(int bno) throws Exception {
		getSqlSession().delete("customer.deleteArticle", bno);
	}

	public List<BoardDto> listAll() throws Exception {
		return getSqlSession().selectList("customer.listAll");
	}

	public void increaseViewcnt(int bno) throws Exception {
		getSqlSession().update("customer.increaseViewcnt", bno);
	}

	/*
	 * @Override public List<Map<String,Object>> pageList(Criteria cri){ return
	 * getSqlSession().selectList("customer.pageList", cri); }
	 * 
	 * public int countBoardList() { return
	 * getSqlSession().selectOne("customer.countBoardList"); }
	 */
}
