package wh.user.kakaopay.controller;


import java.net.URI;
import java.net.URISyntaxException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import wh.admin.manage.model.PayListDto;
import wh.user.home.model.HomePageMemberDto;
import wh.user.kakaopay.dao.KakaoPayDao;
import wh.user.kakaopay.model.*;

@Service
public class KakaoPayService {
	private static final String HOST = "https://kapi.kakao.com";
	
	@Autowired
	private KakaoPayReadyDto kakaoPayReadyVO;
	@Autowired
	private KakaoPayApprovalDto kakaoPayApprovalDto;
	@Autowired
	private KakaoPayDao kakaoPayDao;
	
	public String kakaoPayReady(KakaoPayRequestDto req) {
		
		RestTemplate restTemplate = new RestTemplate();
		
		HttpHeaders headers = new HttpHeaders();
		
		headers.add("Authorization", "KakaoAK " + "a2586916fe2d92a859c4f7684b91c6b9");
        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
        
        // 서버로 요청할 Body
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME");
        params.add("partner_order_id", "1001");
        params.add("partner_user_id", "KitchenNote");
        params.add("item_name", req.getItem_name());
        params.add("quantity", req.getQuantity());
        params.add("total_amount", req.getTotal_amount());
        params.add("tax_free_amount", req.getTax_free_amount());
        params.add("approval_url", "http://localhost:8083/KitchenNote2/kakaopay/kakaoPaySuccess.do");
        params.add("cancel_url", "http://localhost:8083/KitchenNote2/kakaopay/kakaoPayCancel.do");
        params.add("fail_url", "http://localhost:8083/KitchenNote2/kakaopay/kakaoPayFail.do");
 
         HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
 
        try {
            kakaoPayReadyVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body, KakaoPayReadyDto.class);
                  
            return kakaoPayReadyVO.getNext_redirect_pc_url();
 
        } catch (RestClientException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (URISyntaxException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
        return "home.do";
        
	}
	
	public KakaoPayApprovalDto kakaoPayInfo(String pg_token) {
		  
        RestTemplate restTemplate = new RestTemplate();
 
        // 서버로 요청할 Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + "a2586916fe2d92a859c4f7684b91c6b9");
        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
 
        // 서버로 요청할 Body
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME");
        params.add("tid", kakaoPayReadyVO.getTid());
        params.add("partner_order_id", "1001");
        params.add("partner_user_id", "KitchenNote");
        params.add("pg_token", pg_token);
        
        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
        
        try {
            kakaoPayApprovalDto = restTemplate.postForObject(new URI(HOST + "/v1/payment/approve"), body, KakaoPayApprovalDto.class);
          
            return kakaoPayApprovalDto;
        
        } catch (RestClientException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (URISyntaxException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
        return null;
    }
	
	public int insertKakaoPay(PayListDto pay) {
		return kakaoPayDao.insertKakaoPay(pay);
	}
	
	public int updateFork(PayListDto pay) {
		return kakaoPayDao.updateFork(pay);
	}
}
