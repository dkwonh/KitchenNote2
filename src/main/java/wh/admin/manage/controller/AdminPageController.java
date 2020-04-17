package wh.admin.manage.controller;


import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import wh.admin.manage.model.AdminRecipeDto;
import wh.admin.manage.model.ChefApplyDto;
import wh.admin.manage.model.ChefDto;
import wh.admin.manage.model.CookingClassDto;
import wh.admin.manage.model.DelRecipeDto;
import wh.admin.manage.model.DropMembersDto;
import wh.admin.manage.model.FilterDto;
import wh.admin.manage.model.MemberDto;
import wh.admin.manage.model.PayListDto;
import wh.admin.manage.model.PhotoDto;
import wh.admin.manage.model.PurchaseRecipeDto;
import wh.admin.manage.model.TeacherApply;

@Controller
public class AdminPageController implements ApplicationContextAware {
	// 페이징 변수
	public static final int PAGE_SIZE = 10;
	int startPage=0;
	int endPage=0;
	int pageBlock=0;
	int pageCount=0;
	
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
		int count = 0;
		FilterDto f = new FilterDto();
		f.setFilter(filter);
		f.setSearch(search);
		f.setStart((pageNum - 1) * PAGE_SIZE);
		member = adminPageService.getUserList(f);
		count = adminPageService.getUserCount(f);

		pageCount = count / PAGE_SIZE + (count % PAGE_SIZE == 0 ? 0 : 1);
		model.addAttribute("pageCount", pageCount);
		pageCalc(pageNum,count);

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
	public String adminChef(@RequestParam int pageNum, FilterDto f,
			Model model) {
		int count = 0;
		List<ChefDto> member;
		if (pageNum == 0)
			pageNum = 1;

		f.setStart((pageNum - 1) * PAGE_SIZE);
		member = adminPageService.getChefList(f);
		count = adminPageService.getChefCount(f);

		pageCount = count / PAGE_SIZE + (count % PAGE_SIZE == 0 ? 0 : 1);
		model.addAttribute("pageCount", pageCount);
		pageCalc(pageNum,count);

		model.addAttribute("filter", f.getFilter());
		model.addAttribute("search", f.getSearch());
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
		
		
		return "redirect:admin.do?pageNum=1&&filter=&&search=";
	}
	
	@RequestMapping(value="delete.do",method=RequestMethod.GET)
	public String deleteUser(DropMembersDto drop) {
		int i = adminPageService.deleteUser(drop);
		return "redirect:admin.do?pageNum=1&&filter=&&search=";
	}
	
	@RequestMapping(value="updateChef", method=RequestMethod.GET)
	public String updateChef(@RequestParam String member_id,@RequestParam String nickname,@RequestParam String sns_address, @RequestParam String tel, Model model) {
		Map<String,String> map = new HashMap<>();
		map.put("member_id",member_id);
		map.put("nickname",nickname);
		map.put("sns_address",sns_address);
		map.put("tel",tel);
		int i = adminPageService.updateChef(map);
		
		
		return "redirect:adminChef.do?pageNum=1&&filter=&&search=";
	}
	
	@RequestMapping(value="deleteChef.do",method=RequestMethod.GET)
	public String deleteChef(@RequestParam String member_id, Model model) {
		int i = adminPageService.deleteChef(member_id);
		return "redirect:adminChef.do?pageNum=1&&filter=&&search=";
	}
	
	
	@RequestMapping(value="adminChefUp.do",method=RequestMethod.GET)
	public String chefUp(@RequestParam int pageNum, Model model) {
		List<ChefApplyDto> member;
		if (pageNum == 0)
			pageNum = 1;

		int start = (pageNum - 1) * PAGE_SIZE;
		member = adminPageService.getChefApply(start);
		int count = adminPageService.getChefApplyCount();

		pageCount = count / PAGE_SIZE + (count % PAGE_SIZE == 0 ? 0 : 1);
		model.addAttribute("pageCount", pageCount);
		pageCalc(pageNum,count);
		
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("pageBlock", pageBlock);
		model.addAttribute("userList",member);
		model.addAttribute("pageNum", pageNum);
		
		return "adminPage/adminChefUp";
	}
	
	@RequestMapping(value="allow.do", method=RequestMethod.GET)
	public String allowUp(ChefApplyDto cef) {
		adminPageService.allowChefUp(cef);
		
		return "redirect:adminChefUp.do?pageNum=1";
	}
	
	@RequestMapping(value="deny.do", method=RequestMethod.GET)
	public String denyUp(@RequestParam String member_id) {
		adminPageService.denyChefup(member_id);
		
		return "redirect:adminChefUp.do?pageNum=1";
	}
	
	@RequestMapping(value="dropUser.do", method=RequestMethod.GET)
	public String dropUser(@RequestParam int pageNum,FilterDto f, Model model) {
		if(pageNum==0)
			pageNum=1;
		
		f.setStart((pageNum - 1) * PAGE_SIZE);
		
		List<DropMembersDto> list = adminPageService.getDropList(f);
		int count = adminPageService.getDropCount(f);

		pageCount = count / PAGE_SIZE + (count % PAGE_SIZE == 0 ? 0 : 1);
		model.addAttribute("pageCount", pageCount);
		pageCalc(pageNum,count);
		
		model.addAttribute("filter", f.getFilter());
		model.addAttribute("search", f.getSearch());
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("pageBlock", pageBlock);
		model.addAttribute("type",new String[] {"번호","아이디","닉네임","탈퇴일"});
		model.addAttribute("userList",list);
		model.addAttribute("pageNum", pageNum);
		
		return "adminPage/adminDropUser";
	}
	
	@RequestMapping(value="adminRecipe.do",method=RequestMethod.GET)
	public String adminRecipe(@RequestParam int pageNum, FilterDto f, Model model) {

		if(pageNum==0)
			pageNum=1;
		
		f.setStart((pageNum - 1) * PAGE_SIZE);
		
		List<AdminRecipeDto> list = adminPageService.getRecipeList(f);
		int count = adminPageService.getRecipeCount(f);
		
		pageCount = count / PAGE_SIZE + (count % PAGE_SIZE == 0 ? 0 : 1);
		model.addAttribute("pageCount", pageCount);
		pageCalc(pageNum,count);
		
		model.addAttribute("filter", f.getFilter());
		model.addAttribute("search", f.getSearch());
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("pageBlock", pageBlock);
		model.addAttribute("type",new String[] {"레시피 아이디","이미지","레시피 이름","작성자"});
		model.addAttribute("userList",list);
		model.addAttribute("pageNum", pageNum);
		
		return "adminPage/adminRecipe";
		
	}
	
	@RequestMapping(value="deleteRecipe.do",method=RequestMethod.GET)
	public String deleteRecipe( @RequestParam(required=false) String reasonText, DelRecipeDto del) {
		if(del.getReason().equals("기타")) {
			del.setReason(reasonText);
		}
		adminPageService.deleteRecipe(del);
		
		return "redirect:adminRecipe.do?pageNum=1";
	}
	
	@RequestMapping(value="adminPayRecipe.do",method=RequestMethod.GET)
	public String adminPayRecipe(@RequestParam int pageNum, FilterDto f, Model model) {

		if(pageNum==0)
			pageNum=1;
		
		f.setStart((pageNum - 1) * PAGE_SIZE);
		
		List<AdminRecipeDto> list = adminPageService.getPayList(f);
		int count = adminPageService.getPayCount(f);
		
		pageCount = count / PAGE_SIZE + (count % PAGE_SIZE == 0 ? 0 : 1);
		model.addAttribute("pageCount", pageCount);
		pageCalc(pageNum,count);
		
		model.addAttribute("filter", f.getFilter());
		model.addAttribute("search", f.getSearch());
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("pageBlock", pageBlock);
		model.addAttribute("type",new String[] {"레시피 아이디","이미지","레시피 이름","작성자","가격"});
		model.addAttribute("userList",list);
		model.addAttribute("pageNum", pageNum);
		
		return "adminPage/adminPayRecipe";
		
	}
	
	@RequestMapping(value="adminDropRecipe.do", method=RequestMethod.GET)
	public String dropRecipe(@RequestParam int pageNum,FilterDto f, Model model) {
		if(pageNum==0)
			pageNum=1;
		
		f.setStart((pageNum - 1) * PAGE_SIZE);
		
		List<DelRecipeDto> list = adminPageService.getDelRecipeList(f);
		int count = adminPageService.getDelCount(f);

		pageCount = count / PAGE_SIZE + (count % PAGE_SIZE == 0 ? 0 : 1);
		model.addAttribute("pageCount", pageCount);
		pageCalc(pageNum,count);
		
		model.addAttribute("filter", f.getFilter());
		model.addAttribute("search", f.getSearch());
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("pageBlock", pageBlock);
		model.addAttribute("type",new String[] {"번호","이미지","이름","아이디","삭제일","사유"});
		model.addAttribute("userList",list);
		model.addAttribute("pageNum", pageNum);
		
		return "adminPage/adminDropRecipe";
	}
	
	@RequestMapping(value="forkList.do", method=RequestMethod.GET)
	public String payFork(@RequestParam int pageNum,FilterDto f, Model model) {
		if(pageNum==0)
			pageNum=1;
		f.setType("fork");
		f.setStart((pageNum - 1) * PAGE_SIZE);
		
		List<PayListDto> list = adminPageService.getPaymentList(f);
		int count = adminPageService.getPaymentCount(f);

		pageCount = count / PAGE_SIZE + (count % PAGE_SIZE == 0 ? 0 : 1);
		model.addAttribute("pageCount", pageCount);
		pageCalc(pageNum,count);
		
		model.addAttribute("filter", f.getFilter());
		model.addAttribute("search", f.getSearch());
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("pageBlock", pageBlock);
		model.addAttribute("type",new String[] {"번호","아이디","포크 충전 수","충전 가격","충전 날짜"});
		model.addAttribute("userList",list);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("p","fork");
		
		return "adminPage/adminPayList";
	}
	
	@RequestMapping(value="classList.do", method=RequestMethod.GET)
	public String payClass(@RequestParam int pageNum,FilterDto f, Model model) {
		if(pageNum==0)
			pageNum=1;
		f.setType("class");
		f.setStart((pageNum - 1) * PAGE_SIZE);
		
		List<PayListDto> list = adminPageService.getPaymentList(f);
		int count = adminPageService.getPaymentCount(f);

		pageCount = count / PAGE_SIZE + (count % PAGE_SIZE == 0 ? 0 : 1);
		model.addAttribute("pageCount", pageCount);
		pageCalc(pageNum,count);
		
		model.addAttribute("filter", f.getFilter());
		model.addAttribute("search", f.getSearch());
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("pageBlock", pageBlock);
		model.addAttribute("type",new String[] {"번호","신청자 아이디","셰프 닉네임","셰프 아이디","클래스 명", "금액", "결제일"});
		model.addAttribute("userList",list);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("p","class");
		
		return "adminPage/adminPayList";
	}
	
	@RequestMapping(value="purRecipe.do", method=RequestMethod.GET)
	public String purRecipe(int pageNum, FilterDto f, Model model) {
		if(pageNum==0)
			pageNum=1;
		
		f.setStart((pageNum - 1) * PAGE_SIZE);
		
		List<PurchaseRecipeDto> list = adminPageService.getPurRecipeList(f);
		int count = adminPageService.getPurRecipeCount(f);

		pageCount = count / PAGE_SIZE + (count % PAGE_SIZE == 0 ? 0 : 1);
		model.addAttribute("pageCount", pageCount);
		pageCalc(pageNum,count);
		
		model.addAttribute("filter", f.getFilter());
		model.addAttribute("search", f.getSearch());
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("pageBlock", pageBlock);
		model.addAttribute("type",new String[] {"레시피 아이디","닉네임","구매자","레시피 이름","결제일"});
		model.addAttribute("userList",list);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("p","class");
		
		return "adminPage/adminPurRecipe";
	}
	
	@RequestMapping(value="notify.do", method=RequestMethod.GET)
	public String notify(FilterDto f) {
		
	}
	
	/**/
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
		if (count >= 0) {

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
