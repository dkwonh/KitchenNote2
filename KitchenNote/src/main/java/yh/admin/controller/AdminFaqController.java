package yh.admin.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import yh.admin.service.AdminFaqService;

@Controller
 @RequestMapping(value = "/admin/") 
public class AdminFaqController {

	@Autowired
	AdminFaqService Service;

	@RequestMapping("AdminFAQ.do") // 게시글 목록
	public ModelAndView list() throws Exception {

		List<AdminFaqDto> list = Service.listAll();
		ModelAndView mav = new ModelAndView();
		System.out.println(list);
		mav.setViewName("admin/AdminFAQ");
		mav.addObject("AdminFAQ", list);
		
		/*
		 * Criteria cri = new Criteria(); ModelAndView mav = new
		 * ModelAndView("customer/list.do"); PageMaker pageMaker = new PageMaker();
		 * pageMaker.setCri(cri);
		 * pageMaker.setTotalCount(boardService.countBoardList());
		 * List<Map<String,Object>> list = boardService.pageList(cri);
		 * mav.addObject("list", list); mav.addObject("pageMaker",pageMaker);
		 */
		return mav;
	}

	@RequestMapping(value = "/AdminFAQWrite.do", method = RequestMethod.GET)
	public String write() {
		
		return "admin/AdminFAQWrite";
	} // 게시글 작성화면

	@RequestMapping(value = "AdminFAQInsert.do", method = RequestMethod.POST)
	public String insert(@ModelAttribute AdminFaqDto dto) throws Exception {
		System.out.println(dto);
		 Service.create(dto); 
		return "redirect:AdminFAQ.do";
	} // 게시글 작성 처리

	@RequestMapping(value = "AdminFAQView.do", method = RequestMethod.GET)
	public ModelAndView view(@RequestParam int bno, HttpSession session) throws Exception {
		Service.increaseViewcnt(bno, session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/AdminFAQView");
		mav.addObject("dto", Service.read(bno));
		mav.addObject("bno", bno);
		return mav;
	} // 게시글 상세 내용 조회, 게시글 조회수 증가 처리

	@RequestMapping(value = "AdminFAQView.do", method = RequestMethod.POST)
	public ModelAndView cancleView(@RequestParam int bno, HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/AdminFAQView");
		mav.addObject("dto", Service.read(bno));
		return mav;
	} // 취소 버튼

	@RequestMapping(value = "AdminFAQUpdate.do", method = RequestMethod.POST)
	public String update(@ModelAttribute("dto") AdminFaqDto dto) throws Exception {
		return "admin/AdminFAQmodifiedView";
	} // 게시글 수정

	@RequestMapping(value = "AdminFAQUpdate2.do", method = RequestMethod.GET)
	public String update2(@ModelAttribute("dto") AdminFaqDto dto) throws Exception {
		Service.update(dto);
		return "redirect:AdminFAQ.do";
	} 

	@RequestMapping("AdminFAQDelete.do")
	public String delete(@RequestParam int bno) throws Exception {
		Service.delete(bno);
		return "redirect:AdminFAQ.do";
	}
	/*
	 * @RequestMapping(value="/boardPageList") public ModelAndView
	 * boardPageList(Criteria cri, HttpSession session) throws Exception {
	 * ModelAndView mav = null; if(session.getAttribute("id") == null) { mav = new
	 * ModelAndView("redirect"); mav.addObject("msg", "잘못된 접근 입니다.");
	 * mav.addObject("url", "login"); return mav; } else { mav = new
	 * ModelAndView("/boardPageList"); PageMaker pageMaker = new PageMaker();
	 * pageMaker.setCri(cri);
	 * pageMaker.setTotalCount(boardService.countBoardList());
	 * List<Map<String,Object>> list = boardService.pageList(cri);
	 * mav.addObject("list", list); mav.addObject("pageMaker",pageMaker); return
	 * mav;
	 * 
	 * } }
	 */
}
