package wh.user.home.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Set;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.WebApplicationContext;

import com.google.gson.Gson;

import wh.admin.manage.model.FilterDto;
import wh.admin.manage.model.NotifyDto;
import wh.user.home.model.HomePageCategoryDto;
import wh.user.home.model.HomePageCategoryName;
import wh.user.home.model.HomePageMemberDto;
import wh.user.home.model.HomePageNangbuDto;
import wh.user.home.model.HomePageRecipeConfirmDto;
import wh.user.home.model.HomePageRecipeDto;

@Controller
public class HomePageController implements ApplicationContextAware {
	WebApplicationContext context = null;
	public static final int PAGE_SIZE = 10;
	int startPage=0;
	int endPage=0;
	int pageBlock=0;
	int pageCount=0;
	
	@Autowired
	HomePageService homePageService;

	// 메인화면
	@RequestMapping(value = "home.do", method = RequestMethod.GET)
	public String home(Model model) {
		
		Set<Integer> set = new HashSet<>();
		while (set.size() <= 3) {
			Random random = new Random();
			set.add(random.nextInt(36) + 1);
		}
		List<Integer> category = new ArrayList<>(set);
		
		List<HomePageRecipeDto> recommand1 = homePageService.recipe_home(category.get(0));
		List<HomePageRecipeDto> recommand2 = homePageService.recipe_home(category.get(1));
		List<HomePageRecipeDto> recommand3 = homePageService.recipe_home(category.get(2));
		List<HomePageRecipeDto> recommand4 = homePageService.recipe_home(category.get(3));
		List<HomePageCategoryName> categoryList = homePageService.categoryName();
		List<HomePageNangbuDto> nangbuList = homePageService.nangbuList(1);
		Map<Integer, String> nangbuCategory = homePageService.nangbuCategoryList();

		model.addAttribute("nangbuList", nangbuList);
		model.addAttribute("nangbuCategory", nangbuCategory);

		model.addAttribute("recommand1", recommand1);
		//model.addAttribute("recommand1", homePageService.recipe());
		model.addAttribute("r1Category", homePageService.recommandName(category.get(0)));
		model.addAttribute("recommand2", recommand2);
		model.addAttribute("r2Category", homePageService.recommandName(category.get(1)));
		model.addAttribute("recommand3", recommand3);
		model.addAttribute("r3Category", homePageService.recommandName(category.get(2)));
		model.addAttribute("recommand4", recommand4);
		model.addAttribute("r4Category", homePageService.recommandName(category.get(3)));
		if (categoryList.size() == 0) {
			return "homepage/home";
		}
		model.addAttribute("category1", categoryList.subList(0, 8));
		model.addAttribute("category2", categoryList.subList(8, 16));
		model.addAttribute("category3", categoryList.subList(16, 26));
		model.addAttribute("category4", categoryList.subList(26, 36));

		return "homepage/home";
	}

	/*
	 * 메인 화면 모달창으로 대체됨 // 냉부 첫화면
	 * 
	 * @RequestMapping(value = "nangbu.do", method = RequestMethod.GET) public
	 * String nangbu(Model model) { List<HomePageNangbuDto> list =
	 * homePageService.nangbuList(1); Map<Integer, String> category =
	 * homePageService.nangbuCategoryList(); model.addAttribute("category",
	 * category); model.addAttribute("dto", list); return "home/nangbu"; }
	 */

	// 냉부 재료로 검색 화면
	@RequestMapping(value = "nangbu.do", method = RequestMethod.POST)
	public String nangbuSearch(@RequestParam("ingredients[]") int ingredients[], Model model) {
		List<HomePageRecipeDto> list = homePageService.searchFromIngre(ingredients);
		List<HomePageCategoryName> categoryList = homePageService.categoryName();
		List<HomePageNangbuDto> nangbuList = homePageService.nangbuList(1);
		Map<Integer, String> nangbuCategory = homePageService.nangbuCategoryList();

		model.addAttribute("nangbuList", nangbuList);
		model.addAttribute("nangbuCategory", nangbuCategory);

		model.addAttribute("category1", categoryList.subList(0, 8));
		model.addAttribute("category2", categoryList.subList(8, 16));
		model.addAttribute("category3", categoryList.subList(16, 26));
		model.addAttribute("category4", categoryList.subList(26, 36));
		model.addAttribute("dto", list);
		return "homepage/searchResult";
	}

	// 냉부 재료 리스트 출력 GSON
	@RequestMapping(value = "category.do", method = RequestMethod.GET)
	public void loadCategory(@RequestParam("ing_category") int ing_category, HttpServletResponse response)
			throws IOException {
		List<HomePageNangbuDto> list = homePageService.nangbuList(ing_category);
		Gson json = new Gson();
		response.setContentType("text/thml;charset=utf-8");
		PrintWriter out = response.getWriter();

		out.print(json.toJson(list));
	}

	// 레시피 검색 결과화면
	@RequestMapping(value = "searchList.do", method = RequestMethod.GET)
	public String search(String search, Model model) {
		List<HomePageRecipeDto> list = homePageService.searchFromName(search);
		List<HomePageCategoryName> categoryList = homePageService.categoryName();
		List<HomePageNangbuDto> nangbuList = homePageService.nangbuList(1);
		Map<Integer, String> nangbuCategory = homePageService.nangbuCategoryList();

		model.addAttribute("nangbuList", nangbuList);
		model.addAttribute("nangbuCategory", nangbuCategory);

		
		if (categoryList.size() == 0) {
			return "homepage/home";
		}
		model.addAttribute("category1", categoryList.subList(0, 8));
		model.addAttribute("category2", categoryList.subList(8, 16));
		model.addAttribute("category3", categoryList.subList(16, 26));
		model.addAttribute("category4", categoryList.subList(26, 36));
		model.addAttribute("dto", list);
		
		
		
		return "homepage/searchResult";
		
		
	}
	
	// 카테고리 리스트 출력 **안씀**
	/*
	 * @RequestMapping(value = "loadCategory.do", method = RequestMethod.GET) public
	 * void loadCategory(HttpServletResponse response) throws IOException {
	 * List<HomePageCategoryDto> list = homePageService.categoryName(); Gson json =
	 * new Gson(); response.setContentType("text/thml;charset=utf-8"); PrintWriter
	 * out = response.getWriter(); out.print(json.toJson(list)); }
	 */

	// 카테고리로 검색 화면
	@RequestMapping(value = "searchCategory.do", method = RequestMethod.GET)
	public String searchCategory(HomePageCategoryDto category, Model model) throws IOException {
		List<Integer> integer = new ArrayList<>();
		int[] cate = { category.getCategory1(), category.getCategory2(), category.getCategory3(),
				category.getCategory4() };
		for (int i : cate) {
			if (i > 0) {
				integer.add(i);
			}
		}
		int[] c = new int[integer.size()];

		for (int j = 0; j < integer.size(); j++) {
			c[j] = integer.get(j);
			
		}
		
		List<HomePageRecipeDto> list = new ArrayList<>();
		if(c.length==0) {
			list = homePageService.recipe();
		}

		else {
			list = homePageService.searchFromCategory(c);
		}
		List<HomePageCategoryName> categoryList = homePageService.categoryName();
		List<HomePageNangbuDto> nangbuList = homePageService.nangbuList(1);
		Map<Integer, String> nangbuCategory = homePageService.nangbuCategoryList();

		model.addAttribute("nangbuList", nangbuList);
		model.addAttribute("nangbuCategory", nangbuCategory);

		
		if (categoryList.size() == 0) {
			return "homepage/home";
		}
		model.addAttribute("category1", categoryList.subList(0, 8));
		model.addAttribute("category2", categoryList.subList(8, 16));
		model.addAttribute("category3", categoryList.subList(16, 26));
		model.addAttribute("category4", categoryList.subList(26, 36));
		model.addAttribute("dto",list);
		return "homepage/searchResult";
	}
	
	@RequestMapping(value="searchCategoryAjax.do", method=RequestMethod.GET)
	public void CategoryAjax(HomePageCategoryDto category, HttpServletResponse response) throws IOException {
		List<Integer> integer = new ArrayList<>();
		int[] cate = { category.getCategory1(), category.getCategory2(), category.getCategory3(),
				category.getCategory4() };
		for (int i : cate) {
			if (i > 0) {
				integer.add(i);
			}
		}
		int[] c = new int[integer.size()];

		for (int j = 0; j < integer.size(); j++) {
			c[j] = integer.get(j);
			
		}
		
		List<HomePageRecipeDto> list = new ArrayList<>();
		if(c.length==0) {
			list = homePageService.recipe();
		}

		else {
			list = homePageService.searchFromCategory(c);
		}
		
		Gson json = new Gson();
		response.setContentType("text/thml;charset=utf-8");
		PrintWriter out = response.getWriter();

		out.print(json.toJson(list));
	}
	
	@RequestMapping(value = "searchNangbu.do", method = RequestMethod.GET)
	public void searchNangbuAjax(@RequestParam("ingredients[]") int ingredients[], HttpServletResponse response) throws IOException {
		List<HomePageRecipeDto> list = homePageService.searchFromIngre(ingredients);
		
		Gson json = new Gson();
		response.setContentType("text/thml;charset=utf-8");
		PrintWriter out = response.getWriter();

		out.print(json.toJson(list));
	}
	
	@RequestMapping(value="recipe.do", method=RequestMethod.GET)
	public String recipeDefault(Model model) {
		List<HomePageRecipeDto> list = homePageService.recipe();
		List<HomePageCategoryName> categoryList = homePageService.categoryName();
		List<HomePageNangbuDto> nangbuList = homePageService.nangbuList(1);
		Map<Integer, String> nangbuCategory = homePageService.nangbuCategoryList();

		model.addAttribute("nangbuList", nangbuList);
		model.addAttribute("nangbuCategory", nangbuCategory);
		
		model.addAttribute("category1", categoryList.subList(0, 8));
		model.addAttribute("category2", categoryList.subList(8, 16));
		model.addAttribute("category3", categoryList.subList(16, 26));
		model.addAttribute("category4", categoryList.subList(26, 36));
		model.addAttribute("dto",list);
		return "homepage/searchResult";
	}
	
	@RequestMapping(value="recipe.do", method=RequestMethod.POST)
	public String searchNameAjax(String search,Model model) throws IOException {
		List<HomePageRecipeDto> list = homePageService.searchFromName(search);
		
		List<HomePageCategoryName> categoryList = homePageService.categoryName();
		List<HomePageNangbuDto> nangbuList = homePageService.nangbuList(1);
		Map<Integer, String> nangbuCategory = homePageService.nangbuCategoryList();

		model.addAttribute("nangbuList", nangbuList);
		model.addAttribute("nangbuCategory", nangbuCategory);

		model.addAttribute("category1", categoryList.subList(0, 8));
		model.addAttribute("category2", categoryList.subList(8, 16));
		model.addAttribute("category3", categoryList.subList(16, 26));
		model.addAttribute("category4", categoryList.subList(26, 36));
		model.addAttribute("dto",list);
		
		return "homepage/searchResult";
	}
	
	@RequestMapping(value="notifyList.do", method=RequestMethod.GET)
	public String notifyList(int pageNum, FilterDto f,Model model) {
		if(pageNum==0)
			pageNum=1;
		f.setStart((pageNum - 1) * PAGE_SIZE);

		int count = homePageService.getNotifyCount(f);
		List<NotifyDto> list = homePageService.getNotifyList(f);
		pageCount = count / PAGE_SIZE + (count % PAGE_SIZE == 0 ? 0 : 1);
		model.addAttribute("pageCount", pageCount);
		pageCalc(pageNum,count);
		
		List<HomePageCategoryName> categoryList = homePageService.categoryName();
		List<HomePageNangbuDto> nangbuList = homePageService.nangbuList(1);
		Map<Integer, String> nangbuCategory = homePageService.nangbuCategoryList();

		model.addAttribute("nangbuList", nangbuList);
		model.addAttribute("nangbuCategory", nangbuCategory);

		model.addAttribute("category1", categoryList.subList(0, 8));
		model.addAttribute("category2", categoryList.subList(8, 16));
		model.addAttribute("category3", categoryList.subList(16, 26));
		model.addAttribute("category4", categoryList.subList(26, 36));
		
		model.addAttribute("filter", f.getFilter());
		model.addAttribute("search", f.getSearch());
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("pageBlock", pageBlock);
		model.addAttribute("type",new String[] {"글번호","제목","작성일"});
		model.addAttribute("list",list);
		model.addAttribute("pageNum", pageNum);
		
		return "homepage/notify";
	}
	
	@RequestMapping(value="notifyItem.do", method=RequestMethod.GET)
	public String notifyItem(int num, Model model) {
		
		NotifyDto not = homePageService.getNotify(num);
		model.addAttribute("dto",not);
		
		return "homepage/notifyItem";
	}
	
	@RequestMapping(value="confirmRecipe.do", method=RequestMethod.GET)
	public void confirmRecipe(int recipe_id, HttpServletResponse response, HttpSession session) throws IOException {
		String member_id = (String)session.getAttribute("MINFO");
		
		HomePageRecipeConfirmDto req = new HomePageRecipeConfirmDto();
		req.setMember_id(member_id);
		req.setRecipe_id(recipe_id);
		
		HomePageRecipeConfirmDto confirm = homePageService.getConfirm(req);
		
		Gson json = new Gson();
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.print(json.toJson(confirm));
	}
	
	@RequestMapping(value="buyRecipe.do", method=RequestMethod.GET)
	public String buyRecipe(int recipe_id, HttpSession session) {
		String member_id = (String)session.getAttribute("MINFO");
		HomePageRecipeConfirmDto recipe = new HomePageRecipeConfirmDto();
		recipe.setMember_id(member_id);
		recipe.setPrice(1);
		recipe.setRecipe_id(recipe_id);
		
		HomePageMemberDto member = homePageService.getMember(member_id);
		//구매할수 있는 포크가 있을경우 바로 구매 후 읽기 페이지 이동
		if(member.getFork()>0) {
			homePageService.insertPur(recipe);
			homePageService.updateFork(member_id);
			return "redirect:recipe/read.do?recipe_id="+recipe_id;
		} else {
			//포크 없을경우 카카오페이 결제화면으로 이동
			return "redirect:kakaoPay.do";
			
		}
	}

	@Override
	public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
		this.context = (WebApplicationContext) applicationContext;
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
