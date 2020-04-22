package wh.admin.manage.model;

import java.sql.Timestamp;

//레시피 결제 내역 dto
public class PurchaseRecipeDto {
	private int recipe_id;
	private String member_id;
	private String pur_member_id;
	private String recipe_name;
	private Timestamp pur_date;

	
	public String getPur_member_id() {
		return pur_member_id;
	}
	public void setPur_member_id(String pur_member_id) {
		this.pur_member_id = pur_member_id;
	}
	public Timestamp getPur_date() {
		return pur_date;
	}
	public void setPur_date(Timestamp pur_date) {
		this.pur_date = pur_date;
	}
	private boolean read;
	
	
	public int getRecipe_id() {
		return recipe_id;
	}
	public void setRecipe_id(int recipe_id) {
		this.recipe_id = recipe_id;
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
	
	public boolean isRead() {
		return read;
	}
	public void setRead(boolean read) {
		this.read = read;
	}
	
	
	
	
}
