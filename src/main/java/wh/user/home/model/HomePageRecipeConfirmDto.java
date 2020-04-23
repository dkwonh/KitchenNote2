package wh.user.home.model;

public class HomePageRecipeConfirmDto {
	String member_id;
	int recipe_id;
	int price;
	int fork;
	String pur_member_id;
	boolean read;
	String reg_member_id;
	
	
	@Override
	public String toString() {
		return "HomePageRecipeConfirmDto [member_id=" + member_id + ", recipe_id=" + recipe_id + ", price=" + price
				+ ", fork=" + fork + ", pur_member_id=" + pur_member_id + ", read=" + read + ", reg_member_id="
				+ reg_member_id + "]";
	}
	public int getRecipe_id() {
		return recipe_id;
	}
	public void setRecipe_id(int recipe_id) {
		this.recipe_id = recipe_id;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getFork() {
		return fork;
	}
	public void setFork(int fork) {
		this.fork = fork;
	}
	public boolean isRead() {
		return read;
	}
	public void setRead(boolean read) {
		this.read = read;
	}
	public String getReg_member_id() {
		return reg_member_id;
	}
	public void setReg_member_id(String reg_member_id) {
		this.reg_member_id = reg_member_id;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	
	public String getPur_member_id() {
		return pur_member_id;
	}
	public void setPur_member_id(String pur_member_id) {
		this.pur_member_id = pur_member_id;
	}

	
	
}
