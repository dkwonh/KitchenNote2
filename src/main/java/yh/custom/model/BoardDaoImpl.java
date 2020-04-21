package yh.custom.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import yh.admin.controller.FilterDto;
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

	public List<BoardDto> listAll(FilterDto dto) throws Exception {
		return getSqlSession().selectList("customer.listAll",dto);
	}

	public void increaseViewcnt(int bno) throws Exception {
		getSqlSession().update("customer.increaseViewcnt", bno);
	}

	public int count(FilterDto dto) throws Exception {
		return getSqlSession().selectOne("adminBoard.count",dto);
	}
}
