
package yh.mypage.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import yh.mypage.service.MemberInfoService;

@Controller
@RequestMapping(value = "/myPage/")
public class MemberInfoController {

	@Autowired
	MemberInfoService service;

	@RequestMapping(value = "memberInfo.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView view(ChefDto chef, HttpSession session) throws Exception {

		String member_id = (String)session.getAttribute("MINFO");
		Integer level = (Integer)session.getAttribute("LEVEL");
		ChefDto mem = new ChefDto();
		mem.setMember_id(member_id);
		mem.setLevel(level);
		session.getAttribute("NICK");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("myPage/MemberInfo");
		ChefDto dto = new ChefDto();
		dto = service.view(mem);
		System.out.println("회원 정보:::"+service.view(mem));
		mav.addObject("dto",dto);

		return mav;
	} // 회원 정보

	@RequestMapping(value = "chefApply.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String write(@ModelAttribute Chef_applyDto dto) {
		return "myPage/ChefApply";
	} // 쉐프 신청 작성 페이지

	@RequestMapping(value = "chefApply_submit.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String submit(@ModelAttribute Chef_applyDto dto) throws Exception {
		service.submit(dto);
		return "redirect:memberInfo.do";
	} // 쉐프 신청서 제출

	@RequestMapping(value = "changeUser.do", method = RequestMethod.POST)
	public String update(@ModelAttribute("dto") ChefDto dto, HttpSession session) throws Exception {
		service.chefUpdate(dto);
		ChefDto chef = service.view(dto);
		return "redirect:memberInfo.do";
	} // 회원 정보 수정

	@RequestMapping(value = "changePwd.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String changePwd(String pwdcheck1, HttpSession session)
			throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("member_id", (String)session.getAttribute("MINFO"));
		map.put("pwdcheck1", pwdcheck1);
		service.changePwd(map);
		System.out.println("pwdcheck1:::"+pwdcheck1);
		return "redirect:memberInfo.do";
	} // 비밀 번호 변경

	@RequestMapping(value = "changePwdView.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String changePwdView(@ModelAttribute MemberInfoDto dto) throws Exception {
		return "myPage/ChangePwd";
	} // 비밀 번호 변경 페이지

	@RequestMapping(value = "pwd.do", method = { RequestMethod.POST, RequestMethod.GET })
	@ResponseBody
	public String Pwd(String member_id, HttpSession session) throws Exception {
		String member = (String)session.getAttribute("MINFO");
		Integer level = (Integer)session.getAttribute("LEVEL");
		MemberInfoDto mem = new MemberInfoDto();
		mem.setMember_id(member);
		mem.setLevel(level);
		ChefDto dto =  service.view(mem);
		String a = service.pwd(member);
		Gson json = new Gson();
		System.out.println("mem:::"+mem);
		return json.toJson(a);
	} // 비밀 번호 확인

	@RequestMapping(value = "pwdCheck.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String deletePwdCheck(@ModelAttribute ChefDto dto) {
		return "myPage/DeletePwdCheck";
	} // 회원 탈퇴 전 비밀 번호 확인

	@RequestMapping(value = "deleteForm.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String memberWithdrawalView(@ModelAttribute ChefDto dto) {
		return "myPage/MemberWithdrawal";
	} // 회원 탈퇴 창

	@RequestMapping(value = "delete.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String delete(HttpSession session) throws Exception {
		String member_id = (String)session.getAttribute("MINFO");
		service.delete(member_id);
		return "redirect:memberInfo.do";
	} // 회원 탈퇴

}
