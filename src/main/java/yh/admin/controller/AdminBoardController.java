package yh.admin.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import yh.admin.service.AdminBoardService;

@Controller
public class AdminBoardController {

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
	AdminBoardService adminboardService;

	@RequestMapping("admin/AdminList.do") // 게시글 목록
	public ModelAndView list(@RequestParam  (value="pageNum",required = false) int pageNum,@RequestParam (value="select1",required = false)String select1
			,@RequestParam (value="select2",required = false)String select2
			,@RequestParam (value="select3",required = false)String select3, Model model) throws Exception {

		List<AdminFaqDto> dto;
		int count;//맵퍼 파일에 선언해둔 count(*) sql
		if(pageNum==0)
			pageNum=1;
		FilterDto f = new FilterDto();
		f.setSelect1(select1);
		f.setSelect2(select2);
		f.setSelect3(select3);
		f.setStart((pageNum -1)  * PAGE_SIZE);
		count = adminboardService.count(f);
		pageCount = count/PAGE_SIZE + (count%PAGE_SIZE==0?0:1);
		model.addAttribute("pageCount",pageCount);
		pageCalc(pageNum,count);//5번에 선언된 함수
		model.addAttribute("startPage",startPage);
		model.addAttribute("endPage",endPage);
		model.addAttribute("pageBlock",pageBlock);
		model.addAttribute("AdminList",adminboardService.listAll(f));//가져오고자 하는 리스트를 한페이지에서 보여줄수 있는 만큼만 가져온다.
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("select1",select1);
		model.addAttribute("select2",select2);
		model.addAttribute("select3",select3);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/AdminList");
		return mav;
	}

	@RequestMapping(value = "admin/adminWrite.do", method = RequestMethod.GET)
	public String write() {
		return "admin/AdminWrite";
	} // 게시글 작성화면

	@RequestMapping(value = "admin/adminInsert.do", method = RequestMethod.POST)
	public String insert(@ModelAttribute AdminBoardDto dto) throws Exception {
		adminboardService.create(dto);
		return "redirect:AdminList.do?pageNum=0";
	} // 게시글 작성 처리

	@RequestMapping(value = "admin/adminView.do", method = RequestMethod.GET)
	public ModelAndView view(@RequestParam int num, HttpSession session) throws Exception {
		adminboardService.increaseViewcnt(num, session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/AdminView");
		mav.addObject("dto", adminboardService.read(num));
		mav.addObject("num", num);
		return mav;
	} // 게시글 상세 내용 조회, 게시글 조회수 증가 처리

	@RequestMapping(value = "admin/adminView.do", method = RequestMethod.POST)
	public ModelAndView cancleView(@RequestParam int num, HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/AdminView");
		mav.addObject("dto", adminboardService.read(num));
		return mav;
	} // 취소 버튼

	@RequestMapping(value = "admin/adminUpdate.do", method = RequestMethod.POST)
	public String update(@ModelAttribute("dto") AdminBoardDto dto) throws Exception {
		return "admin/AdminModifiedView";
	} // 게시글 수정 폼

	@RequestMapping(value = "admin/adminUpdate2.do", method = RequestMethod.GET)
	public String update2(@ModelAttribute("dto") AdminBoardDto dto) throws Exception {
		adminboardService.update(dto);
		return "redirect:AdminList.do?pageNum=0";
	}// 게시글 수정

	@RequestMapping("admin/adminDelete.do")
	public String delete(@RequestParam int num) throws Exception {
		adminboardService.delete(num);
		return "redirect:AdminList.do?pageNum=0";
	} // 게시글 삭제
}
