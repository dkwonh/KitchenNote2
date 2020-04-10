package yh.custom.controller;

import java.util.List;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import yh.custom.service.FAQService;

@Controller
@RequestMapping(value="/customer/")
public class FAQController {

	@Autowired
	FAQService service;

	@RequestMapping("FAQ.do")
	public ModelAndView list() throws Exception {
		List<FAQDto> list = service.listAll();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("customer/FAQ");
		mav.addObject("FAQ", list);
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
