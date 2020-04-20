package yh.admin.controller;

public class AdminStaticsDto {

	int recipeCount;
	int userCount;
	int recipeSaleCount;
	
	public int getRecipeCount() {
		return recipeCount;
	}
	public void setRecipeCount(int recipeCount) {
		this.recipeCount = recipeCount;
	}
	public int getUserCount() {
		return userCount;
	}
	public void setUserCount(int userCount) {
		this.userCount = userCount;
	}
	public int getRecipeSaleCount() {
		return recipeSaleCount;
	}
	public void setRecipeSaleCount(int recipeSaleCount) {
		this.recipeSaleCount = recipeSaleCount;
	}
	@Override
	public String toString() {
		return "AdminStaticsDto [recipeCount=" + recipeCount + ", userCount=" + userCount + ", recipeSaleCount="
				+ recipeSaleCount + "]";
	}
	
	
}
