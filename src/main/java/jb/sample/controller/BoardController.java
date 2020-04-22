package jb.sample.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import jb.sample.model.RecipeDTO;
import jb.sample.service.BoardService;

@Controller("mypageController")
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Inject
	private BoardService service;

	// 상품목록 + 팔로워 팔로잉 수
		@RequestMapping(value = "/mypage/mypagefirst.do", method = RequestMethod.GET)
		public void getRecipelist(Model model, HttpSession session) throws Exception {
			logger.info("get recipelist");
			session.setAttribute("member_id", "member_id");
			
			List<RecipeDTO> list = service.recipelist();
			model.addAttribute("list", list);

			List<RecipeDTO> follower, following = null;
			follower = service.followerlist();
			model.addAttribute("followerlist", follower);
			following = service.followinglist();
			model.addAttribute("followinglist", following);

			int getFollower = 0;
			getFollower = service.getFollower();
			model.addAttribute("followersize", getFollower);
			int getFollowing = 0;
			getFollowing = service.getFollowing();
			model.addAttribute("followingsize", getFollowing);
			/*
			 * System.out.println(getFollower); System.out.println(getFollowing);
			 */
		}

	// 팔로워, 팔로우 리스트
	@RequestMapping(value = "/mypage/followlist.do")
	public String getFollowlist(Model model) throws Exception {
		List<RecipeDTO> follower, following = null;
		follower = service.followerlist();
		model.addAttribute("followerlist", follower);
		following = service.followinglist();
		model.addAttribute("followinglist", following);
		System.out.println(follower);
		System.out.println(following);
		return "mypage/followlist";
	}

	// 내가 구매한 레시피
	@RequestMapping(value = "/mypage/paidlist.do")
	public String paidlist(Model model) throws Exception {
		List<RecipeDTO> paidlist = null;
		paidlist = service.paidlist();
		model.addAttribute("paidlist", paidlist);
		System.out.println(paidlist);
		return "mypage/paidlist";

	}

	// 마이페이지/스크랩-리스트
	@RequestMapping(value = "/mypage/scraplist.do")
	public String scraplist(Model model, HttpSession session) throws Exception {
		session.setAttribute("member_id", "member_id");
		List<RecipeDTO> scraplist = null;
		scraplist = service.scraplist();
		model.addAttribute("scraplist", scraplist);
		return "mypage/scraplist";
	}

	// 마이페이지/댓글-리스트
	@RequestMapping(value = "/mypage/commentlist.do")
	public String getComment(Model model, HttpSession session) throws Exception {
		session.setAttribute("member_id", "member_id");
		List<RecipeDTO> getComment = null;
		getComment = service.commentlist();
		model.addAttribute("commentlist", getComment);
		return "mypage/commentlist";
	}
}