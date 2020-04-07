package custom.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import custom.Model.CustomDto;

@Service
public class CustomService {

	@Autowired
	CustomDao dao;

	public void setDao(CustomDao dao) {
		this.dao = dao;
	}
	
	public List<CustomDto> selectCustom(){
		return dao.selectCustom();
	}
}
