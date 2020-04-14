package yh.custom.controller;

import java.util.List;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import yh.custom.service.FAQService;

@Controller
@RequestMapping(value="/customer/")
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

	@RequestMapping("FAQ.do")
	public ModelAndView list(@RequestParam int pageNum,Model model) throws Exception {
		
		int count = service.count();//맵퍼 파일에 선언해둔 count(*) sql
		if(pageNum==0)
			pageNum=1;
		pageCount = count/PAGE_SIZE + (count%PAGE_SIZE==0?0:1);
		model.addAttribute("pageCount",pageCount);
		pageCalc(pageNum,count);//5번에 선언된 함수
		model.addAttribute("startPage",startPage);
		model.addAttribute("endPage",endPage);
		model.addAttribute("pageBlock",pageBlock);
		model.addAttribute("FAQ",service.listAll((pageNum-1)*PAGE_SIZE));//가져오고자 하는 리스트를 한페이지에서 보여줄수 있는 만큼만 가져온다.
		model.addAttribute("pageNum",pageNum);	
		ModelAndView mav = new ModelAndView();
		mav.setViewName("customer/FAQ");
		return mav;
	} // 게시글 리스트

	@RequestMapping(value = "FAQView.do", method = RequestMethod.GET)
	public ModelAndView view(@RequestParam int bno, HttpSession session) throws Exception {
		service.increaseViewcnt(bno, session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("customer/FAQView");
		mav.addObject("dto", service.read(bno));
		mav.addObject("bno", bno);
		return mav;
	} // 게시글 상세 조회 , 게시글 조회수 증가

	@RequestMapping(value = "FAQView.do", method = RequestMethod.POST)
	public ModelAndView cancleView(@RequestParam int bno, HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("customer/FAQView");
		mav.addObject("dto", service.read(bno));
		return mav;
	} // 취소
}
