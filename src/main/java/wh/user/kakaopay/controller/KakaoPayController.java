package wh.user.kakaopay.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
		KakaoPayRequestVO req = new KakaoPayRequestVO();
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
	public void kakaoSuccess(@RequestParam("pg_token") String pg_token, Model model) {
		System.out.println("success");
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
