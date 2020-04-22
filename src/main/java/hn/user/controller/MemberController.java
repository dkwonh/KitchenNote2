package hn.user.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mysql.cj.Session;

import hn.user.model.LoginCommand;
import hn.user.model.MemberDao;
import hn.user.model.MemberDto;
import hn.user.service.memberService;
import hn.user.service.EmailService;
import hn.user.service.EmailServiceCode;
import hn.user.model.EmailVO;

@Controller
public class MemberController {

	@Autowired
	MemberDao dao;
	@Autowired
	memberService msve;
	@Autowired
	private EmailService emailService;
	@Autowired
	private EmailServiceCode emailServiceCode;

	
	public void setDao(MemberDao dao) {
		this.dao = dao;
	}

	public void setMsve(memberService msve) {
		this.msve = msve;
	}
	//메인
	/*
	 * @RequestMapping("/index") public ModelAndView getAll() { ModelAndView mav =
	 * new ModelAndView(); mav.setViewName("index"); List<MemberDto> members =
	 * MemberDao.getAll(); mav.addObject("member", members); return mav; }
	 */
	
	//로그인창
	@RequestMapping(value = "/login/loginForm.do", method = RequestMethod.GET)
	public String form() {
		return "login/loginForm";
	}

	//로그인 실행
	@RequestMapping(value = "/login/login2.do")
	public String loginOk(LoginCommand lc, HttpSession session) {
		List<MemberDto> list= msve.loginOk(lc);
		int i = list.size();
		if (i == 0) {
			session.setAttribute("NOT", 0);
			return "login/loginForm"; //로그인 실패
		}else {
			session.setAttribute("MINFO", lc.getMember_id());
			session.setAttribute("LEVEL", list.get(0).getLevel());
			return "redirect:/index.jsp"; //로그인 성공
		} 
	}
	//로그아웃
	@RequestMapping(value = "/login/logoutOk.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/index.jsp";
	}
	//회원가입창
	@RequestMapping(value = "/login/memberForm.do",method = RequestMethod.GET)
	public String form2() {
		return "login/memberForm";
	}
	//아이디 중복 확인
	@RequestMapping(value = "/login/emChk.do",method = RequestMethod.POST)
	@ResponseBody
	//public int idChk(@RequestParam("member_id")String member_id) {
	public int idChk(LoginCommand lc) {
		int i2 = msve.idChk(lc);
		//System.out.println(lc.getMember_id());
		//System.out.println("id"+i2);
			return i2;
	}
	//이메일 인증 창 열기
		@RequestMapping(value = "/login/emailCode.do")
		public String form3() {
			return "login/emailCodeForm";
		}
	// 인증번호 이메일 보내기
		@RequestMapping(value="/login/sendMail.do", produces = "application/json; charset=utf8")
		@ResponseBody()
		public String sendMail2(@RequestParam() String member_id) throws Exception {
			System.out.println("member_id::"+member_id);
			EmailVO email2 = new EmailVO();

			String receiver = member_id; // Receiver.메일 받을 주소
			String subject = "[KitchenNote]이메일 인증 번호.";
			String content = "";

			email2.setReceiver(receiver);
			email2.setSubject(subject);
			email2.setContent(content);

			int result = emailServiceCode.sendMail2(email2);
			return result+"";

		}
	
	//닉네임 중복확인
	@RequestMapping(value = "/login/nkChk.do",method = RequestMethod.GET)
	@ResponseBody
	public int nChk(LoginCommand lc) {
		int i3 = msve.nChk(lc);
		//System.out.println("nk"+i3);
		return i3;
	}
	//회원가입 실행
	@RequestMapping(value = "/login/mem.do") //회원가입 완료시 가는 폼
	public String insert(MemberDto mdto, HttpSession session) {
		int i4 = msve.insert(mdto);
		if (i4 == 0) {
			session.setAttribute("MSUC", mdto.getMember_id());
			return "login/loginForm"; //회원가입 완료
		} else {
			return "login/memberForm"; //회원가입 실패
		}
	}
	//비밀번호 찾기
	@RequestMapping(value = "/login/pwFind.do",method = RequestMethod.GET)
	public String form4() {
		return "login/pwFind";
	}
	
	//비밀번호 찾기 이메일 보내기
	@RequestMapping(value = "/login/find_pass.do")
	@ResponseBody
	public String sendMail(String member_id) throws Exception {

		EmailVO email = new EmailVO();
		
		//System.out.println(member_id);
		
		//MemberDto members = MemberDao.findByLoginId(member_id);

		String receiver = member_id; // Receiver. //회원 계정 이메일

		String subject = "[KitchenNote] 비밀번호 안내 이메일 입니다."; //제목

		String content = "[KitchenNote]"; //내용
		

		email.setReceiver(receiver);

		email.setSubject(subject);

		email.setContent(content);

		String result = emailService.sendMail(email);

		return /* "이메일이 전송 되었습니다: "*/
				"<link rel=\"stylesheet\" href=\"/KitchenNote2/assets/css/main.css\" />"
				+"<style>@font-face {\r\n" + 
				"	font-family: 'Cafe24Oneprettynight';\r\n" + 
				"	src:\r\n" + 
				"		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.1/Cafe24Oneprettynight.woff')\r\n" + 
				"		format('woff');\r\n" + 
				"	font-weight: normal;\r\n" + 
				"	font-style: normal;\r\n" + 
				"}</style>"
				+ "<div id=\"main\">\r\n" + 
				"<div class=\"inner\" style=\"margin-top: 50px; font-family: 'Cafe24Oneprettynight';\">"
				+result
				+ "<br><br><button type='button'  onclick=\"window.close();\">닫기</button>"
				+ "</div></div>"
				+ "<script src=\"/KitchenNote2/assets/js/jquery.min.js\"></script>\r\n" + 
				"<script src=\"/KitchenNote2/assets/js/skel.min.js\"></script>\r\n" + 
				"<script src=\"/KitchenNote2/assets/js/util.js\"></script>\r\n" + 
				"<script src=\"/KitchenNote2/assets/js/main.js\"></script>";

	}
	
}
