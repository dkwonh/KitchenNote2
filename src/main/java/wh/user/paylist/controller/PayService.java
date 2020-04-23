package wh.user.paylist.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import wh.admin.manage.model.FilterDto;
import wh.admin.manage.model.PayListDto;
import wh.user.paylist.dao.PayDao;

@Service
public class PayService {
	@Autowired
	PayDao dao;

	public PayDao getDao() {
		return dao;
	}

	public void setDao(PayDao dao) {
		this.dao = dao;
	}
	
	public List<PayListDto> getPayList(FilterDto f){
		return dao.getPayList(f);
	}
	
	public int getPayCount(FilterDto f){
		return dao.getPayCount(f);
	}
	
}
