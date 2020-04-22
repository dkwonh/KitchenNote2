package wh.admin.manage.model;

import java.sql.Timestamp;

public class DelRecipeDto {
	private int recipe_id;
	private String image;
	private String member_id;
	private String recipe_name;
	private String reason;
	private Timestamp del_date;
	
	
	
	
	public Timestamp getDel_date() {
		return del_date;
	}
	public void setDel_date(Timestamp del_date) {
		this.del_date = del_date;
	}
	@Override
	public String toString() {
		return "DelRecipeDto [recipe_id=" + recipe_id + ", image=" + image + ", member_id=" + member_id
				+ ", recipe_name=" + recipe_name + ", reason=" + reason + "]";
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public int getRecipe_id() {
		return recipe_id;
	}
	public void setRecipe_id(int recipe_id) {
		this.recipe_id = recipe_id;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getRecipe_name() {
		return recipe_name;
	}
	public void setRecipe_name(String recipe_name) {
		this.recipe_name = recipe_name;
	}
	
	
	

}
