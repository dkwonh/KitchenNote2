package yh.custom.controller;

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

import yh.custom.service.BoardService;

@Controller
@RequestMapping(value = "/customer/")
public class BoardController {
	
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
	BoardService boardService;

	@RequestMapping("list.do") // 게시글 목록
	public ModelAndView list(@RequestParam int pageNum,Model model) throws Exception {

		int count = boardService.count();//맵퍼 파일에 선언해둔 count(*) sql
		if(pageNum==0)
			pageNum=1;
		pageCount = count/PAGE_SIZE + (count%PAGE_SIZE==0?0:1);
		model.addAttribute("pageCount",pageCount);
		pageCalc(pageNum,count);//5번에 선언된 함수
		model.addAttribute("startPage",startPage);
		model.addAttribute("endPage",endPage);
		model.addAttribute("pageBlock",pageBlock);
		model.addAttribute("list",boardService.listAll((pageNum-1)*PAGE_SIZE));//가져오고자 하는 리스트를 한페이지에서 보여줄수 있는 만큼만 가져온다.
		model.addAttribute("pageNum",pageNum);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("customer/list");
	
		return mav;
	}

	@RequestMapping(value = "write.do", method = RequestMethod.GET)
	public String write() {
		return "customer/write";
	} // 게시글 작성화면

	@RequestMapping(value = "insert.do", method = RequestMethod.POST)
	public String insert(@ModelAttribute BoardDto dto) throws Exception {
		 boardService.create(dto); 
		return "redirect:list.do?pageNum=0";
	} // 게시글 작성 처리

	@RequestMapping(value = "view.do", method = RequestMethod.GET)
	public ModelAndView view(@RequestParam int num, HttpSession session) throws Exception {
		boardService.increaseViewcnt(num, session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("customer/view");
		mav.addObject("dto", boardService.read(num));
		mav.addObject("num", num);
		return mav;
	} // 게시글 상세 내용 조회, 게시글 조회수 증가 처리

	@RequestMapping(value = "view.do", method = RequestMethod.POST)
	public ModelAndView cancleView(@RequestParam int num, HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("customer/view");
		mav.addObject("dto", boardService.read(num));
		return mav;
	} // 취소 버튼

	@RequestMapping(value = "update.do", method = RequestMethod.POST)
	public String update(@ModelAttribute("dto") BoardDto dto) throws Exception {
		System.out.println(dto);
		return "customer/modifiedView";
		
	} // 게시글 수정

	@RequestMapping(value = "update2.do", method = RequestMethod.GET)
	public String update2(@ModelAttribute("dto") BoardDto dto) throws Exception {
		System.out.println(dto);
		boardService.update(dto);
		return "redirect:list.do?pageNum=0";
	} 

	@RequestMapping("delete.do")
	public String delete(@RequestParam int num) throws Exception {
		boardService.delete(num);
		return "redirect:list.do?pageNum=0";
	}
	
}
