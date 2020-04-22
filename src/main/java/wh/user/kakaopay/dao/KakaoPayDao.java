package wh.user.kakaopay.dao;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import wh.admin.manage.model.PayListDto;
import wh.user.home.model.HomePageMemberDto;

public class KakaoPayDao extends SqlSessionDaoSupport{

	public int insertKakaoPay(PayListDto pay) {
		return getSqlSession().insert("kakao.insertKakaoPay",pay);
	}
	
	public int updateFork(PayListDto pay) {
		return getSqlSession().update("kakao.updateFork",pay);
	}
}
