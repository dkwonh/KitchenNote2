package custom.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="/customer/")
public class BoardController {

	@Autowired
	BoardService boardService;
	
	@RequestMapping("list.do") // 게시글 목록
	public ModelAndView list() throws Exception{
		List<BoardDto> list = boardService.listAll();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("customer/list");
		mav.addObject("list",list);
		System.out.println(list);
		return mav;
	}
	@RequestMapping(value="write.do", method=RequestMethod.GET)
	public String write() {
		return "customer/write";
	} // 게시글 작성화면
	
	@RequestMapping(value="insert.do",method=RequestMethod.POST)
	public String insert(@ModelAttribute BoardDto dto) throws Exception{
		boardService.create(dto);
		return "redirect:list.do";
	} // 게시글 작성 처리
	@RequestMapping(value="view.do",method=RequestMethod.GET)
	public ModelAndView view(@RequestParam int bno, HttpSession session) throws Exception{
		boardService.increaseViewcnt(bno,session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("customer/view");
		mav.addObject("dto",boardService.read(bno));
		return mav;
	} // 게시글 상세 내용 조회, 게시글 조회수 증가 처리
	@RequestMapping(value="update.do",method=RequestMethod.POST)
	public String update(@ModelAttribute BoardDto dto) throws Exception{
		return "redirect:list.do";
	} // 게시글 수정
	@RequestMapping("delete.do")
	public String delete(@RequestParam int bno) throws Exception{
		boardService.delete(bno);
		return "redirect:list.do";
	}
}
