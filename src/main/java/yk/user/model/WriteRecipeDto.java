package yk.user.model;

import java.util.Arrays;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class WriteRecipeDto {
	private String member_id;//작성자 아이디
	private String recipe_name;//이름
	private String recipe_exp;//설명
	private String duration;//시간
	private MultipartFile imagefile;//대표사진
	private String image;
	private int price;//가격
	
	private Date reg_date;//작성일
	
	private int[] category_id;//카테고리
	
	private String[] ing_name;//재료이름
	private String[] capacity;//양
	
	private int[] process_num;//과정순서
	private String[] process_content;//과정글
	private MultipartFile[] process_imagefile;//과정사진
	private String[] process_image;
	
	private String[] tag_name;//태그명
	
	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}
	
	public String getRecipe_name() {
		return recipe_name;
	}

	public void setRecipe_name(String recipe_name) {
		this.recipe_name = recipe_name;
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

	public MultipartFile getImagefile() {
		return imagefile;
	}

	public void setImagefile(MultipartFile imagefile) {
		this.imagefile = imagefile;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public int[] getCategory_id() {
		return category_id;
	}

	public void setCategory_id(int[] category_id) {
		this.category_id = category_id;
	}

	public String[] getIng_name() {
		return ing_name;
	}

	public void setIng_name(String[] ing_name) {
		this.ing_name = ing_name;
	}

	public String[] getCapacity() {
		return capacity;
	}

	public void setCapacity(String[] capacity) {
		this.capacity = capacity;
	}

	public int[] getProcess_num() {
		return process_num;
	}

	public void setProcess_num(int[] process_num) {
		this.process_num = process_num;
	}

	public String[] getProcess_content() {
		return process_content;
	}

	public void setProcess_content(String[] process_content) {
		this.process_content = process_content;
	}

	public MultipartFile[] getProcess_imagefile() {
		return process_imagefile;
	}

	public void setProcess_imagefile(MultipartFile[] process_imagefile) {
		this.process_imagefile = process_imagefile;
	}

	public String[] getProcess_image() {
		return process_image;
	}

	public void setProcess_image(String[] process_image) {
		this.process_image = process_image;
	}

	public String[] getTag_name() {
		return tag_name;
	}

	public void setTag_name(String[] tag_name) {
		this.tag_name = tag_name;
	}

	@Override
	public String toString() {
		return "CustomRecipeDto [member_id=" + member_id + ", recipe_name=" + recipe_name + ", recipe_exp=" + recipe_exp
				+ ", duration=" + duration + ", category_id=" + Arrays.toString(category_id) + ", ing_name="
				+ Arrays.toString(ing_name) + ", capacity=" + Arrays.toString(capacity) + ", process_num="
				+ Arrays.toString(process_num) + ", process_content=" + Arrays.toString(process_content) + ", tag_name="
				+ Arrays.toString(tag_name) + "]";
	}
}
