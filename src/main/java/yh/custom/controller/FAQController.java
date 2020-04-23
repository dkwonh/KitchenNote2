package yh.custom.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import wh.user.home.controller.HomePageService;
import wh.user.home.model.HomePageCategoryName;
import wh.user.home.model.HomePageNangbuDto;
import yh.admin.controller.AdminFaqDto;
import yh.admin.controller.FilterDto;
import yh.custom.service.FAQService;

@Controller
public class FAQController {

	public static final int PAGE_SIZE = 10;
	int startPage;
	int endPage;
	int pageBlock;
	int pageCount;

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
	
	@Autowired
	FAQService service;
	
	@Autowired
	HomePageService homePageService;
	

	@RequestMapping("customer/FAQ.do")
	public ModelAndView list(@RequestParam /* (value="pageNum",required = false) */int pageNum,@RequestParam (value="select1",required = false)String select1
			,@RequestParam (value="select2",required = false)String select2
			,@RequestParam (value="select3",required = false)String select3, Model model) throws Exception {
		
		List<HomePageCategoryName> categoryList = homePageService.categoryName();
		List<HomePageNangbuDto> nangbuList = homePageService.nangbuList(1);
		Map<Integer, String> nangbuCategory = homePageService.nangbuCategoryList();

		model.addAttribute("nangbuList", nangbuList);
		model.addAttribute("nangbuCategory", nangbuCategory);

		model.addAttribute("category1", categoryList.subList(0, 8));
		model.addAttribute("category2", categoryList.subList(8, 16));
		model.addAttribute("category3", categoryList.subList(16, 26));
		model.addAttribute("category4", categoryList.subList(26, 36));
		
		List<AdminFaqDto> dto;
		int count;
		if(pageNum==0)
			pageNum=1;
		FilterDto f = new FilterDto();
		f.setSelect1(select1);
		f.setSelect2(select2);
		f.setSelect3(select3);
		f.setStart((pageNum -1)  * PAGE_SIZE);
		count = service.count(f);
		pageCount = count/PAGE_SIZE + (count%PAGE_SIZE==0?0:1);
		model.addAttribute("pageCount",pageCount);
		pageCalc(pageNum,count);//5번에 선언된 함수
		model.addAttribute("startPage",startPage);
		model.addAttribute("endPage",endPage);
		model.addAttribute("pageBlock",pageBlock);
		model.addAttribute("FAQ",service.listAll(f));//가져오고자 하는 리스트를 한페이지에서 보여줄수 있는 만큼만 가져온다.
		model.addAttribute("pageNum",pageNum);	
		model.addAttribute("select1",select1);
		model.addAttribute("select2",select2);
		model.addAttribute("select3",select3);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("customer/FAQ");
		return mav;
	} // 게시글 리스트

	@RequestMapping(value = "customer/FAQView.do", method = RequestMethod.GET)
	public ModelAndView view(@RequestParam int bno, HttpSession session) throws Exception {
		service.increaseViewcnt(bno, session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("customer/FAQView");
		mav.addObject("dto", service.read(bno));
		mav.addObject("bno", bno);
		return mav;
	} // 게시글 상세 조회 , 게시글 조회수 증가

	@RequestMapping(value = "customer/FAQView.do", method = RequestMethod.POST)
	public ModelAndView cancleView(@RequestParam int bno, HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("customer/FAQView");
		mav.addObject("dto", service.read(bno));
		return mav;
	} // 취소

	public HomePageService getHomePageService() {
		return homePageService;
	}

	public void setHomePageService(HomePageService homePageService) {
		this.homePageService = homePageService;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
}
