package wh.user.home.model;

public class HomePageRecipeDto {
	 // 레시피아이디 
	private int recipe_Id;

	 // 배너이미지 
	 private String image;
	 
	 //멤버 
	 private String member_Id;

	 // 조회수 
	 private int readcount;

	 // 스크랩 
	 private int scrap;

	 // 레시피가격 
	 private int price;

	 // 레시피 이름 
	 private String recipe_Name;
	 private String recipe_Exp;
	 
	 //필요시간
	 private String duration;
	 
	 private String nickname;

	public int getRecipe_Id() {
		return recipe_Id;
	}

	public void setRecipe_Id(int recipe_Id) {
		this.recipe_Id = recipe_Id;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getMember_Id() {
		return member_Id;
	}

	public void setMember_Id(String member_Id) {
		this.member_Id = member_Id;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public int getScrap() {
		return scrap;
	}

	public void setScrap(int scrap) {
		this.scrap = scrap;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getRecipe_Name() {
		return recipe_Name;
	}

	public void setRecipe_Name(String recipe_Name) {
		this.recipe_Name = recipe_Name;
	}

	public String getRecipe_Exp() {
		return recipe_Exp;
	}

	public void setRecipe_Exp(String recipe_Exp) {
		this.recipe_Exp = recipe_Exp;
	}

	public String getDuration() {
		return duration;
	}

	public void setDuration(String duration) {
		this.duration = duration;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	 
}
