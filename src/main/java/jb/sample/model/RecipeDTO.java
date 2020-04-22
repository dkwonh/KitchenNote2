package jb.sample.model;

import java.sql.Timestamp;

public class RecipeDTO {
	// Recipe_info Table
	private int recipe_id; // 레시피 아이디
	private String image; // 배너 이미지
	private String member_id; // 회원 아이디
	private int readcount; // 조회수
	private int scrap; // 스크랩
	private int price;// 레시피 가격
	private String recipe_name; // 레시피 이름
	private String recipe_exp; // 레시피 설명
	private String duration; // 필요시간
	// Pur_Recipe Table
	private int read;
	// Subscribe Table
	private String follower;
	private String following;
	// Members
	private String nickname;
	// Recipe_Comment Table
	private String com_member_id; // 댓글 작성자 아이디
	private String comment; // 댓글
	private Timestamp comment_date; // 작성일

	public String getCom_member_id() {
		return com_member_id;
	}

	public void setCom_member_id(String com_member_id) {
		this.com_member_id = com_member_id;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public Timestamp getComment_date() {
		return comment_date;
	}

	public void setComment_date(Timestamp comment_date) {
		this.comment_date = comment_date;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getFollower() {
		return follower;
	}

	public void setFollower(String follower) {
		this.follower = follower;
	}

	public String getFollowing() {
		return following;
	}

	public void setFollowing(String following) {
		this.following = following;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getRecipe_exp() {
		return recipe_exp;
	}

	public void setRecipe_exp(String recipe_exp) {
		this.recipe_exp = recipe_exp;
	}

	public String getDuration() {
		return duration;
	}

	public void setDuration(String duration) {
		this.duration = duration;
	}

	public int getRead() {
		return read;
	}

	public void setRead(int read) {
		this.read = read;
	}

	public int getRecipe_id() {
		return recipe_id;
	}

	public void setRecipe_id(int recipe_id) {
		this.recipe_id = recipe_id;
	}

	public String getRecipe_name() {
		return recipe_name;
	}

	public void setRecipe_name(String recipe_name) {
		this.recipe_name = recipe_name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getScrap() {
		return scrap;
	}

	public void setScrap(int scrap) {
		this.scrap = scrap;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

}
