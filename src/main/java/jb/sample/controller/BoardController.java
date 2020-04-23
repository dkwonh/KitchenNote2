package jb.sample.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.gson.Gson;

import jb.sample.model.RecipeDTO;
import jb.sample.service.BoardService;

@Controller("mypageController")
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Inject
	private BoardService service;

	// 상품목록 + 팔로워 팔로잉 수
		@RequestMapping(value = "/pageMine/mypagefirst.do", method = RequestMethod.GET)
		public void getRecipelist(Model model, HttpSession session) throws Exception {
			logger.info("get recipelist");
			String member_id = (String)session.getAttribute("MINFO");
			
			List<RecipeDTO> list = service.recipelist(member_id);
			model.addAttribute("list", list);
			
			
			List<RecipeDTO> follower, following = null;
			follower = service.followerlist(member_id);
			model.addAttribute("followerlist", follower);
			following = service.followinglist(member_id);
			model.addAttribute("followinglist", following);

			int getFollower = 0;
			getFollower = service.getFollower(member_id);
			model.addAttribute("followersize", getFollower);
			int getFollowing = 0;
			getFollowing = service.getFollowing(member_id);
			model.addAttribute("followingsize", getFollowing);
			
			
			System.out.println(getFollower);
			System.out.println(getFollowing);
		}
		
		//ajaxMyrecipe
		@RequestMapping(value = "/pageMine/myRecipe.do", method = RequestMethod.GET)
		public void getMyRecipelist(Model model, HttpSession session, HttpServletResponse response) throws Exception {
			logger.info("get recipelist");
			String member_id = (String)session.getAttribute("MINFO");
			
			List<RecipeDTO> list = service.recipelist(member_id);
			Gson json = new Gson();
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print(json.toJson(list));
			List<RecipeDTO> follower, following = null;
			follower = service.followerlist(member_id);
			model.addAttribute("followerlist", follower);
			following = service.followinglist(member_id);
			model.addAttribute("followinglist", following);

			int getFollower = 0;
			getFollower = service.getFollower(member_id);
			model.addAttribute("followersize", getFollower);
			int getFollowing = 0;
			getFollowing = service.getFollowing(member_id);
			model.addAttribute("followingsize", getFollowing);
			
		}
		
		//ajaxMyPurrecipe
				@RequestMapping(value = "/pageMine/myPurRecipe.do", method = RequestMethod.GET)
				public void getMyPurlist(Model model, HttpSession session, HttpServletResponse response) throws Exception {
					logger.info("get recipelist");
					String member_id = (String)session.getAttribute("MINFO");
					
					List<RecipeDTO> list = service.paidlist(member_id);
					Gson json = new Gson();
					response.setContentType("text/html;charset=utf-8");
					PrintWriter out = response.getWriter();
					out.print(json.toJson(list));
					List<RecipeDTO> follower, following = null;
					follower = service.followerlist(member_id);
					model.addAttribute("followerlist", follower);
					following = service.followinglist(member_id);
					model.addAttribute("followinglist", following);

					int getFollower = 0;
					getFollower = service.getFollower(member_id);
					model.addAttribute("followersize", getFollower);
					int getFollowing = 0;
					getFollowing = service.getFollowing(member_id);
					model.addAttribute("followingsize", getFollowing);
					
				}
		

	// 팔로워, 팔로우 리스트
	@RequestMapping(value = "/pageMine/followlist.do")
	public String getFollowlist(Model model, HttpSession session) throws Exception {
		String member_id = (String)session.getAttribute("MINFO");
		List<RecipeDTO> follower, following = null;
		follower = service.followerlist(member_id);
		model.addAttribute("followerlist", follower);
		following = service.followinglist(member_id);
		model.addAttribute("followinglist", following);
		return "pageMine/followlist";
	}

	// 내가 구매한 레시피
	@RequestMapping(value = "/pageMine/paidlist.do")
	public String paidlist(Model model, HttpSession session) throws Exception {
		String member_id = (String)session.getAttribute("MINFO");
		List<RecipeDTO> paidlist = null;
		paidlist = service.paidlist(member_id);
		model.addAttribute("paidlist", paidlist);
		List<RecipeDTO> follower, following = null;
		follower = service.followerlist(member_id);
		model.addAttribute("followerlist", follower);
		following = service.followinglist(member_id);
		model.addAttribute("followinglist", following);

		int getFollower = 0;
		getFollower = service.getFollower(member_id);
		model.addAttribute("followersize", getFollower);
		int getFollowing = 0;
		getFollowing = service.getFollowing(member_id);
		model.addAttribute("followingsize", getFollowing);
		
		/* System.out.println(paidlist); */
		return "pageMine/paidlist";

	}

	// 마이페이지/스크랩-리스트
	@RequestMapping(value = "/pageMine/scraplist.do")
	public String scraplist(Model model, HttpSession session) throws Exception {
		String member_id = (String)session.getAttribute("MINFO");
		List<RecipeDTO> scraplist = null;
		scraplist = service.scraplist(member_id);
		model.addAttribute("scraplist", scraplist);
		/* System.out.println("스크랩리스트"+scraplist); */
		List<RecipeDTO> follower, following = null;
		follower = service.followerlist(member_id);
		model.addAttribute("followerlist", follower);
		following = service.followinglist(member_id);
		model.addAttribute("followinglist", following);

		int getFollower = 0;
		getFollower = service.getFollower(member_id);
		model.addAttribute("followersize", getFollower);
		int getFollowing = 0;
		getFollowing = service.getFollowing(member_id);
		model.addAttribute("followingsize", getFollowing);
		
		return "pageMine/scraplist";
	}

	// 마이페이지/댓글-리스트
	@RequestMapping(value = "/pageMine/commentlist.do")
	public String getComment(Model model, HttpSession session) throws Exception {
		String member_id = (String)session.getAttribute("MINFO");
		List<RecipeDTO> getComment = null;
		getComment = service.commentlist(member_id);
		model.addAttribute("commentlist", getComment);
		List<RecipeDTO> follower, following = null;
		follower = service.followerlist(member_id);
		model.addAttribute("followerlist", follower);
		following = service.followinglist(member_id);
		model.addAttribute("followinglist", following);

		int getFollower = 0;
		getFollower = service.getFollower(member_id);
		model.addAttribute("followersize", getFollower);
		int getFollowing = 0;
		getFollowing = service.getFollowing(member_id);
		model.addAttribute("followingsize", getFollowing);
		
		return "pageMine/commentlist";
	}
}