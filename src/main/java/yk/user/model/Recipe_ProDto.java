package yk.user.model;

import org.springframework.web.multipart.MultipartFile;

public class Recipe_ProDto {
	private int recipe_id;
	private String process_content;
	private MultipartFile process_imagefile;
	private String process_image;
	private int process_num;
	
	public int getRecipe_id() {
		return recipe_id;
	}
	public void setRecipe_id(int recipe_id) {
		this.recipe_id = recipe_id;
	}
	public String getProcess_content() {
		return process_content;
	}
	public void setProcess_content(String process_content) {
		this.process_content = process_content;
	}
	public MultipartFile getProcess_imagefile() {
		return process_imagefile;
	}
	public void setProcess_imagefile(MultipartFile process_imagefile) {
		this.process_imagefile = process_imagefile;
	}
	public String getProcess_image() {
		return process_image;
	}
	public void setProcess_image(String process_image) {
		this.process_image = process_image;
	}
	public int getProcess_num() {
		return process_num;
	}
	public void setProcess_num(int process_num) {
		this.process_num = process_num;
	}
	
}
