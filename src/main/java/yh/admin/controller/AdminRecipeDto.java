package yh.admin.controller;

// 홈페이지 통계 등록 레시피 수
public class AdminRecipeDto {

	int recipeCount;
	int monthRecipe;
	int yearRecipe;
	public int getRecipeCount() {
		return recipeCount;
	}
	public void setRecipeCount(int recipeCount) {
		this.recipeCount = recipeCount;
	}
	public int getMonthRecipe() {
		return monthRecipe;
	}
	public void setMonthRecipe(int monthRecipe) {
		this.monthRecipe = monthRecipe;
	}
	public int getYearRecipe() {
		return yearRecipe;
	}
	public void setYearRecipe(int yearRecipe) {
		this.yearRecipe = yearRecipe;
	}
	@Override
	public String toString() {
		return "AdminRecipeDto [recipeCount=" + recipeCount + ", monthRecipe=" + monthRecipe + ", yearRecipe="
				+ yearRecipe + "]";
	}
	
	
}
