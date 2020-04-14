
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
import org.springframework.web.servlet.ModelAndView;

import yh.mypage.service.MemberInfoService;

@Controller

@RequestMapping(value = "/myPage/")
public class MemberInfoController {

	@Autowired
	MemberInfoService service;

	/*
	 * @RequestMapping(value = "memberInfo.do", method = RequestMethod.POST) public
	 * ModelAndView list() throws Exception { List<MemberInfoDto> list =
	 * service.listAll(); ModelAndView mav = new ModelAndView();
	 * mav.setViewName("mypage/MemberInfo"); mav.addObject("memberInfo", list);
	 * return mav; }
	 */

	@RequestMapping(value = "memberInfo.do", method = RequestMethod.GET)
	public ModelAndView view(@RequestParam(required=false) String member_id, HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("myPage/MemberInfo");
		member_id = "test2@ki.com";
		MemberInfoDto dto = service.view(member_id);
		mav.addObject("dto", dto);
		System.out.println(dto);
		System.out.println(member_id);
		return mav;

	}

	@RequestMapping(value = "chefApply.do", method = RequestMethod.POST)
	public String write() {
		return "myPage/ChefApply";
	}

	@RequestMapping(value = "chefApply_submit.do", method = RequestMethod.POST)
	public String submit(@ModelAttribute Chef_applyDto dto) throws Exception {
		service.submit(dto);
		return "redirect:memberInfo.do";
	}

}
