package yh.mypage.service;

import java.util.List;

import yh.mypage.controller.Chef_applyDto;
import yh.mypage.controller.MemberInfoDto;

public interface MemberInfoService {

	public void submit(Chef_applyDto dto) throws Exception;

	public MemberInfoDto view(String member_id) throws Exception;

	public void update(MemberInfoDto dto) throws Exception;

	public void delete(String member_id) throws Exception;
	
	public List<MemberInfoDto> listAll() throws Exception;
	
	/* public MemberInfoDto confirmPwd(String password) throws Exception; */
}
