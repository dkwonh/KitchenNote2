package wh.user.kakaopay.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import wh.admin.manage.model.PayListDto;
import wh.user.kakaopay.model.*;

@Controller
public class KakaoPayController {
	
	@Autowired
	private KakaoPayService kakaoPayService;
	
	
	@RequestMapping(value = "kakaoPay.do", method = RequestMethod.GET)
	public String kakaoGet() {
		return "kakaopay/kakaoPayFork";
	}
	
	@RequestMapping(value = "kakaoPay.do",method = RequestMethod.POST)
	public String kakaoPost(@RequestParam("fork")String fork) {
		KakaoPayRequestDto req = new KakaoPayRequestDto();
		int amount = Integer.parseInt(fork)*200;
		req.setItem_name("fork"+fork+"개");
		req.setQuantity(fork);
		String total_amount = String.valueOf(amount);
		req.setTotal_amount(total_amount);
		String tax_free_amount = String.valueOf(amount/10);
		req.setTax_free_amount(tax_free_amount);

		return "redirect:"+ kakaoPayService.kakaoPayReady(req);
	}
		
	@RequestMapping(value = "kakaopay/kakaoPaySuccess.do",method=RequestMethod.GET)
	public String kakaoSuccess(@RequestParam("pg_token") String pg_token, HttpSession session, Model model) {	
		KakaoPayApprovalDto dto = kakaoPayService.kakaoPayInfo(pg_token);
		model.addAttribute("item",dto);
		
		String member_id = (String)session.getAttribute("MINFO");
		PayListDto pay = new PayListDto();
		pay.setMember_id(member_id);
		pay.setFork(dto.getQuantity());
		pay.setPurchase_amount(dto.getAmount().getTotal());
		System.out.println(pay);
		
		//세션 연결하고 테스트할것
		//kakaoPayService.insertKakaoPay(pay);
		return "kakaopay/kakaoPaySuccess";
	}
	
	@RequestMapping(value = "kakaopay/kakaoPayFail.do",method=RequestMethod.GET)
	public void kakaoFail(@RequestParam("pg_token") String pg_token, Model model) {
		System.out.println("Fail");
	}
	
	@RequestMapping(value = "kakaopay/kakaoPayCancel.do",method=RequestMethod.GET)
	public void kakaoCancel(@RequestParam("pg_token") String pg_token, Model model) {
		System.out.println("cancel");
	}
	
	
	
	

}
