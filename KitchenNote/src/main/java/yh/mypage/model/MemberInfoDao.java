package yh.mypage.model;

import java.util.List;

import yh.mypage.controller.MemberInfoDto;

public interface MemberInfoDao {
	
	public void create(MemberInfoDto dto) throws Exception;
	
	public MemberInfoDto read(String member_id ) throws Exception;
	
	public String update(MemberInfoDto dto) throws Exception;
	
	public void delete(String member_id) throws Exception;
	
	public List<MemberInfoDto> listAll() throws Exception;
	
}
