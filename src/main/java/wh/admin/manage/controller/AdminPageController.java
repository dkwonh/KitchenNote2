package wh.admin.manage.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.WebApplicationContext;

import com.google.gson.Gson;

import wh.admin.manage.model.ChefDto;
import wh.admin.manage.model.FilterDto;
import wh.admin.manage.model.MemberDto;
import wh.user.home.model.HomePageNangbuDto;

@Controller
public class AdminPageController implements ApplicationContextAware {
	// 페이징 변수
	public static final int PAGE_SIZE = 10;
	int startPage;
	int endPage;
	int pageBlock;
	int pageCount;
	int count;
	// 페이징 변수 끝

	WebApplicationContext context = null;

	@Autowired
	AdminPageService adminPageService;

	// 기본 화면
	@RequestMapping(value = "admin.do", method = RequestMethod.GET)
	public String adminMain(@RequestParam int pageNum, @RequestParam String filter, @RequestParam String search,
			Model model) {

		List<MemberDto> member;
		if (pageNum == 0)
			pageNum = 1;

		FilterDto f = new FilterDto();
		f.setFilter(filter);
		f.setSearch(search);
		f.setStart((pageNum - 1) * PAGE_SIZE);
		member = adminPageService.getUserList(f);
		count = adminPageService.getUserCount(f);

		pageCount = count / PAGE_SIZE + (count % PAGE_SIZE == 0 ? 0 : 1);
		model.addAttribute("pageCount", pageCount);
		pageCalc(pageNum, count);

		model.addAttribute("filter", filter);
		model.addAttribute("search", search);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("pageBlock", pageBlock);
		model.addAttribute("type", new String[] { "번호", "닉네임", "아이디" });
		model.addAttribute("userList", member);
		model.addAttribute("pageNum", pageNum);

		return "adminPage/admin";
	}

	// 셰프 화면
	@RequestMapping(value = "adminChef.do", method = RequestMethod.GET)
	public String adminChef(@RequestParam int pageNum, @RequestParam String filter, @RequestParam String search,
			Model model) {

		List<ChefDto> member;
		if (pageNum == 0)
			pageNum = 1;

		FilterDto f = new FilterDto();
		f.setFilter(filter);
		f.setSearch(search);
		f.setStart((pageNum - 1) * PAGE_SIZE);
		member = adminPageService.getChefList(f);
		count = adminPageService.getChefCount(f);

		pageCount = count / PAGE_SIZE + (count % PAGE_SIZE == 0 ? 0 : 1);
		model.addAttribute("pageCount", pageCount);
		pageCalc(pageNum, count);

		model.addAttribute("filter", filter);
		model.addAttribute("search", search);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("pageBlock", pageBlock);
		model.addAttribute("type", new String[] { "번호", "닉네임", "아이디", "SNS주소", "연락처" });
		model.addAttribute("userList",member);
		model.addAttribute("pageNum", pageNum);

		return "adminPage/adminChef";
	}
	
	@RequestMapping(value="update.do",method=RequestMethod.GET)
	public String updateUser(@RequestParam String member_id,@RequestParam String nickname,Model model) {
		Map<String,String> map = new HashMap<>();
		map.put("member_id",member_id);
		map.put("nickname",nickname);
		int i = adminPageService.updateUser(map);
		
		
		return "adminPage/admin";
	}
	

	/*
	 * //필터사용
	 * 
	 * @RequestMapping(value="admin.do", method=RequestMethod.POST) public String
	 * adminFilter(@RequestParam("filter") String filter, @RequestParam String
	 * search, @RequestParam int pageNum, Model model) throws IOException {
	 * System.out.println(filter+"/"+search); FilterDto f = new FilterDto();
	 * if(pageNum==0) { pageNum=1; } f.setFilter(filter); f.setSearch(search);
	 * List<MemberDto> member = adminPageService.getUserFilter(f);
	 * System.out.println(member); int count = member.size(); if(pageNum==0)
	 * pageNum=1; pageCount = count/PAGE_SIZE + (count%PAGE_SIZE==0?0:1);
	 * model.addAttribute("pageCount",pageCount); pageCalc(pageNum,count);
	 * 
	 * 
	 * model.addAttribute("startPage",startPage);
	 * model.addAttribute("endPage",endPage);
	 * model.addAttribute("pageBlock",pageBlock); model.addAttribute("type",new
	 * String[] {"번호","닉네임","아이디"}); model.addAttribute("userList",member);
	 * model.addAttribute("pageNum",pageNum);
	 * 
	 * return "adminPage/admin"; }
	 */

	@Override
	public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
		this.context = (WebApplicationContext) applicationContext;

	}

	public void pageCalc(int pageNum, int count) {

		if (count > 0) {

			startPage = 1;
			if (pageNum % 10 != 0) {
				startPage = (int) (pageNum / 10) * 10 + 1;
			} else {
				startPage = ((int) (pageNum / 10) - 1) * 10 + 1;
			}
			pageBlock = 10;
			endPage = startPage + pageBlock - 1;
			if (endPage > pageCount)
				endPage = pageCount;

		}
	}

}
