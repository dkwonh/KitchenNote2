package wh.user.paylist.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import wh.admin.manage.model.FilterDto;
import wh.admin.manage.model.PayListDto;

@Controller
public class PayListController {
	public static final int PAGE_SIZE = 10;
	int startPage=0;
	int endPage=0;
	int pageBlock=0;
	int pageCount=0;
	@Autowired
	PayService pay;

	public PayService getPay() {
		return pay;
	}

	public void setPay(PayService pay) {
		this.pay = pay;
	}
	
	@RequestMapping(value="pageMine/payList.do", method=RequestMethod.GET)
	public String payList(Integer pageNum, FilterDto f, Model model, HttpSession session) {
		
		String member_id = (String)session.getAttribute("MINFO");
		if (pageNum == null)
			pageNum = 1;
		int count = 0;
		f.setSearch(member_id);
		f.setStart((pageNum - 1) * PAGE_SIZE);
		if(member_id==null) {
			return "redirect:login/loginForm.do";
		}
		List<PayListDto> list = pay.getPayList(f); 
		count = pay.getPayCount(f);

		pageCount = count / PAGE_SIZE + (count % PAGE_SIZE == 0 ? 0 : 1);
		model.addAttribute("pageCount", pageCount);
		pageCalc(pageNum,count);

		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("pageBlock", pageBlock);
		
		model.addAttribute("type", new String[] { "번호", "구매내역","가격" ,"날짜" });
		model.addAttribute("userList", list);
		model.addAttribute("pageNum", pageNum);

		
		model.addAttribute("dto",list);
		
		
		
		return "myPay/myPayList";
	}
	
	public void pageCalc(int pageNum, int count) {
		if (count >= 0) {

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
	
}
