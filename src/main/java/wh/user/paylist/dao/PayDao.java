package wh.user.paylist.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import wh.admin.manage.model.FilterDto;
import wh.admin.manage.model.PayListDto;

public class PayDao extends SqlSessionDaoSupport{
	
	public List<PayListDto> getPayList(FilterDto f){
		return getSqlSession().selectList("home.getPayList",f);
	}
	
	public int getPayCount(FilterDto f) {
		return getSqlSession().selectOne("home.getPayCount",f);
	}
}
