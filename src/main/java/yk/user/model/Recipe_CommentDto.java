package yk.user.model;

import java.sql.Timestamp;
import java.util.Date;

public class Recipe_CommentDto {
	private int recipe_id;
	private String com_member_id;
	private String comment;
	private Timestamp comment_date;
	private String commentDate;
	private String nickname;
	private String picture;
	
	
	public String getCommentDate() {
		return commentDate;
	}
	public void setCommentDate(String commentDate) {
		this.commentDate = commentDate;
	}
	
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public int getRecipe_id() {
		return recipe_id;
	}
	public void setRecipe_id(int recipe_id) {
		this.recipe_id = recipe_id;
	}
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
	
}
