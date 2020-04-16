
package yh.mypage.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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

	/*
	 * @RequestMapping(value="checkPwd.do", method= RequestMethod.POST) public
	 * ModelAndView checkPwd(@RequestParam String password,HttpSession session)
	 * throws Exception{ ModelAndView mav = new ModelAndView();
	 * mav.setViewName("mypage/CheckPwd"); MemberInfoDto dto =
	 * service.checkPwd(password); mav.addObject("password",dto.password);
	 * System.out.println(""); }
	 */
	@RequestMapping(value = "memberInfo.do", method = {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView view(@RequestParam(required=false) String member_id, HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("myPage/MemberInfo");
		member_id = "test2@ki.com";
		MemberInfoDto dto = service.view(member_id);
		mav.addObject("dto", dto);
		System.out.println("getNickname:::"+dto.getNickname());
		return mav;
	}

	@RequestMapping(value = "chefApply.do", method = {RequestMethod.POST,RequestMethod.GET})
	public String write(@ModelAttribute Chef_applyDto dto) {
		System.out.println("클릭");
		return "myPage/ChefApply";
	}

	@RequestMapping(value = "chefApply_submit.do", method = {RequestMethod.POST,RequestMethod.GET})
	public String submit(@ModelAttribute Chef_applyDto dto) throws Exception {
		service.submit(dto);
		System.out.println(dto);
		return "redirect:memberInfo.do";
	}
	
	@RequestMapping(value="changeUser.do", method = RequestMethod.POST)
	public String update(@ModelAttribute("dto") ChefDto dto, HttpSession session) throws Exception{
		try {
			service.chefUpdate(dto);
			ChefDto chef = (ChefDto)service.view(dto.getChef());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:memberInfo.do";		
	}
	
	@RequestMapping(value="changePwdView.do",method = {RequestMethod.POST,RequestMethod.GET})
	public String changePwdView(@ModelAttribute MemberInfoDto dto) throws Exception{
		return "myPage/ChangePwd";
	}
	
	@RequestMapping(value="pwd.do", method = {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public int Pwd(String password) throws Exception{
		System.out.println("입력");
		int dto = service.pwd(password);
		return dto;
	}
	
	@RequestMapping(value="changePwd", method = {RequestMethod.POST,RequestMethod.GET})
	public String changePwd(@ModelAttribute("dto") MemberInfoDto dto, HttpSession session) throws Exception{
		service.changePwd(dto);
		return "redirect:memberInfo.do";
	}
	
	@RequestMapping(value="memberWithdrawal.do", method = {RequestMethod.POST,RequestMethod.GET} )
	public String memberWithdrawalView(@ModelAttribute ChefDto dto) {
		return "myPage/MemberWithdrawal";
	}
	/*
	 * @RequestMapping(value="Withdrawal.do", method =
	 * {RequestMethod.POST,RequestMethod.GET} ) public String delete(@RequestParam
	 * String member_id) throws Exception{ service.delete(member_id); return
	 * "redirect:checkPwd.do"; }
	 */

}
