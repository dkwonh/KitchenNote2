package wh.admin.manage.controller;

import java.util.List;

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

import wh.admin.manage.model.MemberDto;

@Controller
public class AdminPageController implements ApplicationContextAware{
	//페이징 변수
	public static final int PAGE_SIZE = 10;
	int startPage;
	int endPage;
	int pageBlock;
	int pageCount;
	//페이징 변수 끝
	
	WebApplicationContext context = null;
	
	@Autowired
	AdminPageService adminPageService;
	
	@RequestMapping(value="admin.do", method=RequestMethod.GET)
	public String adminMain(@RequestParam int pageNum, Model model) {
		int count = adminPageService.getCount();
		if(pageNum==0)
			pageNum=1;
		pageCount = count/PAGE_SIZE + (count%PAGE_SIZE==0?0:1);
		model.addAttribute("pageCount",pageCount);
		pageCalc(pageNum,count);
		
		
		model.addAttribute("startPage",startPage);
		model.addAttribute("endPage",endPage);
		model.addAttribute("pageBlock",pageBlock);
		model.addAttribute("type",new String[] {"번호","닉네임","아이디"});
		model.addAttribute("userList",adminPageService.getUserList((pageNum-1)*PAGE_SIZE));
		model.addAttribute("pageNum",pageNum);
		
		return "adminPage/admin";
	}

	@Override
	public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
		this.context = (WebApplicationContext)applicationContext;
		
	}
	
	public void pageCalc(int pageNum, int count) {
		
		if(count>0) {
			
			startPage = 1;
			if(pageNum%10 !=0) {
				startPage = (int)(pageNum/10)*10 + 1;
			} else {
				startPage = ((int)(pageNum/10)-1)*10 + 1;
			}
			pageBlock = 10;
			endPage = startPage + pageBlock - 1;
			if (endPage > pageCount) endPage = pageCount;

		}
	}
	
}
