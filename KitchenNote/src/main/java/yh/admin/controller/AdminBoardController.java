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

import yh.admin.service.AdminBoardService;

@Controller
@RequestMapping(value = "/admin/")
public class AdminBoardController {

	@Autowired
	AdminBoardService adminboardService;

	@RequestMapping("AdminList.do") // 게시글 목록
	public ModelAndView list() throws Exception {

		List<AdminBoardDto> list = adminboardService.listAll();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/AdminList");
		System.out.println(list);
		mav.addObject("AdminList", list);
		return mav;
	}

	@RequestMapping(value = "adminWrite.do", method = RequestMethod.GET)
	public String write() {
		return "admin/AdminWrite";
	} // 게시글 작성화면

	@RequestMapping(value = "adminInsert.do", method = RequestMethod.POST)
	public String insert(@ModelAttribute AdminBoardDto dto) throws Exception {
		adminboardService.create(dto); 
		System.out.println("ADMININSERT:");
		System.out.println(dto);
		return "redirect:AdminList.do";
	} // 게시글 작성 처리

	@RequestMapping(value = "adminView.do", method = RequestMethod.GET)
	public ModelAndView view(@RequestParam int num, HttpSession session) throws Exception {
		adminboardService.increaseViewcnt(num, session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/AdminView");
		mav.addObject("dto", adminboardService.read(num));
		mav.addObject("num", num);
		return mav;
	} // 게시글 상세 내용 조회, 게시글 조회수 증가 처리

	@RequestMapping(value = "adminView.do", method = RequestMethod.POST)
	public ModelAndView cancleView(@RequestParam int num, HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/AdminView");
		mav.addObject("dto", adminboardService.read(num));
		return mav;
	} // 취소 버튼

	@RequestMapping(value = "adminUpdate.do", method = RequestMethod.POST)
	public String update(@ModelAttribute("dto") AdminBoardDto dto) throws Exception {
		return "admin/AdminModifiedView";
	} // 게시글 수정

	@RequestMapping(value = "adminUpdate2.do", method = RequestMethod.GET)
	public String update2(@ModelAttribute("dto") AdminBoardDto dto) throws Exception {
		adminboardService.update(dto);
		return "redirect:AdminList.do";
	} 

	@RequestMapping("adminDelete.do")
	public String delete(@RequestParam int num) throws Exception {
		adminboardService.delete(num);
		return "redirect:AdminList.do";
	}
}
