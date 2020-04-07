package custom.Service;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import custom.Model.CustomDto;

public class CustomDao extends SqlSessionDaoSupport{

	public List<CustomDto> selectCustom(){
		return getSqlSession().selectList("kitchennote.custom");
	}
}
