package hn.user.service;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import hn.user.model.EmailVO;
import hn.user.model.MemberDao;
import hn.user.model.MemberDto;

@Service("emailService")
	public class EmailService {

		@Autowired
		protected JavaMailSender mailSender;
		
		MemberDao dao;

		@Autowired
		public void setDao(MemberDao dao) {
			this.dao = dao;
		}

		public String sendMail(EmailVO email) throws Exception {

			try {
				MemberDto dto = new MemberDto();
				dto.setMember_id(email.getReceiver());
				String ranPw =pwRandom();
				dto.setPassword(ranPw);
				dao.updatePW(dto);
				
			
				MimeMessage msg = mailSender.createMimeMessage();

				msg.setSubject(email.getSubject());

				// 일반 텍스트만 전송하려는 경우
				msg.setText(email.getContent());

				// HTML 컨텐츠를 전송하려면.
				msg.setContent("<p>안녕하세요. 최고의 레시피 [KitchenNote] 입니다.<br> "
						+ "회원님의 임시 비밀번호는 " + ranPw + " 입니다.<br>"
						+ "로그인 후 보안을 위해 꼭 비밀번호를 변경해주세요.^^<br>"
						+ "<a href='http://localhost:8080/Login/login/loginForm.do'>변경하러 가기</a></p>" 
						//마이페이지 비밀번호 변경
						, "text/html;charset=utf-8");
			
			
			
			//System.out.println("랜덤값"+pwRandom());
			/*
			 * + "본 사이트에 가입하신 적이 없으시면 javahell09@gmail.com 으로 해당 메일 캡처해서 보내주세요.</p>" +
			 * "<a href='http://localhost:8080/Login/login/loginForm.do'>계정인증</a>"
			 */
		
			msg.setRecipient(RecipientType.TO, new InternetAddress(email.getReceiver()));// 수신자 setting

				mailSender.send(msg);

				return "메일을 발송을 완료했습니다. 확인해주세요.";

			} catch (Exception ex) {

				ex.printStackTrace();

			}

			return "보내기에 실패했습니다. 다시 입력해 주세요.";

 
		}
		//랜덤값 생성
		private String pwRandom() {
			char passwd[] = new char[] {
                    '1','2','3','4','5','6','7','8','9','0',
                    'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z',
                    'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z',
                    '!','@','#','$','%','^','&','*','(',')'};
			
			String randomPw = "";
			
			for(int i =0; i<10; i++) {
				int ran = (int)(Math.random()*(passwd.length));
				
				randomPw += passwd[ran];
			}
			return randomPw;

		}
}
