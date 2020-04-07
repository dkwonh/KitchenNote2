package custom.Model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import custom.controller.BoardDto;

public class BoardDaoImpl extends SqlSessionDaoSupport implements BoardDao{
	
	public void create(BoardDto dto) throws Exception{
		System.out.println(dto);
		getSqlSession().insert("customer.insert",dto);
	}
	
	public BoardDto read(int bno) throws Exception{
		return getSqlSession().selectOne("customer.view",bno);
	}
	      
	public int update(BoardDto dto) throws Exception{
		return getSqlSession().update("customer.updateArticle",dto);
	} // 오류 예상       
	
	public void delete(int bno) throws Exception{
		getSqlSession().delete("customer.deleteArticle",bno);
	}
	
	public List<BoardDto> listAll() throws Exception{
		return getSqlSession().selectList("customer.listAll");
	}
	
	public void increaseViewcnt(int bno) throws Exception{
		getSqlSession().update("customer.increaseViewcnt",bno);
	}
	
}
