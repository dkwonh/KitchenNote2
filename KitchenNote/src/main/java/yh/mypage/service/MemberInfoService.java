package yh.mypage.service;

import yh.mypage.controller.MemberInfoDto;

public interface MemberInfoService {

	public void create(MemberInfoDto dto) throws Exception;
	
	public MemberInfoDto read(String member_id) throws Exception;
	
	public void update(MemberInfoDto dto) throws Exception;
	
	public void delete(String member_id) throws Exception;
}
