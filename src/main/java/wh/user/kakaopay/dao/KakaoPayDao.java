package wh.user.kakaopay.dao;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import wh.admin.manage.model.PayListDto;

public class KakaoPayDao extends SqlSessionDaoSupport{

	public int insertKakaoPay(PayListDto pay) {
		return getSqlSession().insert("kakao.insertKakaoPay",pay);
	}
}
