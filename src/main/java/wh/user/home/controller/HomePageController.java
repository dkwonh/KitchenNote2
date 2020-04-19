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

import wh.user.home.model.HomePageCategoryDto;
import wh.user.home.model.HomePageCategoryName;
import wh.user.home.model.HomePageNangbuDto;
import wh.user.home.model.HomePageRecipeDto;

@Controller
public class HomePageController implements ApplicationContextAware {
	WebApplicationContext context = null;
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
		model.addAttribute("r1Category", homePageService.recommandName(category.get(0)));
		model.addAttribute("recommand2", recommand2);
		model.addAttribute("r1Category", homePageService.recommandName(category.get(0)));
		model.addAttribute("recommand3", recommand3);
		model.addAttribute("r1Category", homePageService.recommandName(category.get(0)));
		model.addAttribute("recommand4", recommand4);
		model.addAttribute("r1Category", homePageService.recommandName(category.get(0)));
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
		model.addAttribute("dto", list);
		return "homepage/searchList";
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
	@RequestMapping(value = "home.do", method = RequestMethod.POST)
	public String search(String search, Model model) {
		List<HomePageRecipeDto> list = homePageService.searchFromName(search);
		model.addAttribute("dto", list);
		return "homepage/searchList";
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

		List<HomePageRecipeDto> list = homePageService.searchFromCategory(c);
		model.addAttribute("dto", list);
		return "homepage/searchList";
	}

	@Override
	public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
		this.context = (WebApplicationContext) applicationContext;
	}
}
