package hn.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hn.user.model.LoginCommand;
import hn.user.model.MemberDao;
import hn.user.model.MemberDto;

@Service
public class memberService {
	@Autowired
	MemberDao dao;

	public void setDao(MemberDao dao) {
		this.dao = dao;
	}

	public List<MemberDto> getAll() {
		return dao.getAll();
	}
	//회원가입 
	public int insert(MemberDto mdto) {
		List<MemberDto> inOk =  dao.insert(mdto);
		return inOk.size();
	}
	//수정
	public List<MemberDto> update(MemberDto mdto) {
		return dao.update(mdto);
	}

	// 비밀번호 찾기 서비스
	public List<MemberDto> updatePW(MemberDto mdto) {
		return dao.updatePW(mdto);
	}

	//탈퇴
	public List<MemberDto> delete(String mem) {
		return dao.delete(mem);
	}
	//아이디 중복 //String
	public int idChk(LoginCommand lc) {
        return dao.emChk(lc);
	}
	//닉네임 중복
	public int nChk(LoginCommand lc) {
		return dao.nkChk(lc);
	}

	//로그인
	public List<MemberDto> loginOk(LoginCommand lc){
			 List<MemberDto> list =  dao.loginOk(lc);
			 return list;
			
	}

}
