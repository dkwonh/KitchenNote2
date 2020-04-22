package yh.admin.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import yh.admin.service.AdminFaqService;

@Controller
@RequestMapping(value = "/admin/")
public class AdminFaqController {

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
	AdminFaqService Service;

	@RequestMapping("AdminFAQ.do") // 게시글 목록
	public ModelAndView list(@RequestParam /* (value="pageNum",required = false) */int pageNum,@RequestParam (value="select1",required = false)String select1
			,@RequestParam (value="select2",required = false)String select2
			,@RequestParam (value="select3",required = false)String select3, Model model) throws Exception {
		List<AdminFaqDto> dto;
		if(pageNum==0)
			pageNum=1;
		int count;
		FilterDto f = new FilterDto();
		f.setSelect1(select1);
		f.setSelect2(select2);
		f.setSelect3(select3);
		f.setStart((pageNum -1)  * PAGE_SIZE);
		count = Service.count(f);
		pageCount = count/PAGE_SIZE + (count%PAGE_SIZE==0?0:1);
		model.addAttribute("pageCount",pageCount);
		pageCalc(pageNum,count);//5번에 선언된 함수
		model.addAttribute("startPage",startPage);
		model.addAttribute("endPage",endPage);
		model.addAttribute("pageBlock",pageBlock);
		model.addAttribute("AdminFAQ",Service.listAll(f)); //가져오고자 하는 리스트를 한페이지에서 보여줄수 있는 만큼만 가져온다.
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("select1",select1);
		model.addAttribute("select2",select2);
		model.addAttribute("select3",select3);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/AdminFAQ");
		return mav;
	}

	@RequestMapping(value = "/AdminFAQWrite.do", method = RequestMethod.GET)
	public String write() {

		return "admin/AdminFAQWrite";
	} // 게시글 작성화면

	@RequestMapping(value = "AdminFAQInsert.do", method = RequestMethod.POST)
	public String insert(@ModelAttribute AdminFaqDto dto) throws Exception {
		Service.create(dto);
		return "redirect:AdminFAQ.do?pageNum=0";
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
		return "redirect:AdminFAQ.do?pageNum=0";
	}

	@RequestMapping("AdminFAQDelete.do")
	public String delete(@RequestParam int bno) throws Exception {
		Service.delete(bno);
		return "redirect:AdminFAQ.do?pageNum=0";
	}
	
}
