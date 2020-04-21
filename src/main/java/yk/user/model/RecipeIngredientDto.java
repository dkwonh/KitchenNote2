package yk.user.model;

public class RecipeIngredientDto {
	//레시피 읽을 때 사용
	private String capacity;
	private String ing_name;
	
	public String getCapacity() {
		return capacity;
	}
	public void setCapacity(String capacity) {
		this.capacity = capacity;
	}
	public String getIng_name() {
		return ing_name;
	}
	public void setIng_name(String ing_name) {
		this.ing_name = ing_name;
	}
	
}
