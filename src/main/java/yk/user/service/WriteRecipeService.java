package yk.user.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import yk.user.model.Recipe_CategoryDto;
import yk.user.model.Recipe_ProDto;
import yk.user.model.TagDto;
import yk.user.model.WriteRecipeDto;

@Service
public class WriteRecipeService {

	private WriteRecipeDao dao;
	@Autowired
	public void setDao(WriteRecipeDao dao) {
		this.dao = dao;
	}

	// 파일다운 + db에 넣을 이름 구하기 -- 경로 확인
	private String uploadImg(MultipartFile img) {
		String filename = img.getOriginalFilename();

		String uploadName = System.currentTimeMillis() + "_note" + (int) (Math.random() * 50);
		uploadName += filename.substring(filename.lastIndexOf("."));

		try {
			img.transferTo(new File("d://upload/img/" + uploadName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		return uploadName;
	}
	
	//재료이름 자동완성
	public List<String> getIngNames(String ing_name){
		return dao.getIngNames(ing_name);
	}

	@Transactional(rollbackFor = Exception.class)
	public int writeRecipe(WriteRecipeDto dto) throws Exception{
		int c = 0;
		Map<String,Object> map = null;
		
			//기본정보
			dto.setImage(uploadImg(dto.getImagefile()));
			dto.setDuration(dto.getDuration()+"분");
			c += dao.addRecipeInfo(dto);
			
			int recipe_id = dao.getRecipeId(dto.getMember_id());
			
			//카테고리
			int[] cat = dto.getCategory_id();
			for(int i = 0; i<cat.length;i++) {
				if(cat[i]>0) {
					Recipe_CategoryDto category = new Recipe_CategoryDto();
					category.setRecipe_id(recipe_id);
					category.setCategory_id(cat[i]);
					c += dao.addRecipeCategory(category);
				}
			}
			
			//재료
			String[] ingNames = dto.getIng_name();
			String[] caps = dto.getCapacity();
			for(int i = 0; i<ingNames.length;i++) {
				//재료 있나 확인
				String ingName = ingNames[i].trim();
				int checkIng = dao.checkIng(ingName);
				if(checkIng > 0) {
					int ingId = dao.getIngId(ingName);
					map = new HashMap<>();
					map.put("recipe_id", recipe_id);
					map.put("capacity", caps[i]);
					map.put("ing_id", ingId);
					c += dao.addRecipeIng(map);
				}else {
					int newIngId = dao.getMaxIngId()+1;
					map = new HashMap<>();
					map.put("ing_id", newIngId);
					map.put("ing_name", ingName);
					dao.addIng(map);
					
					map.put("recipe_id", recipe_id);
					map.put("capacity", caps[i]);
					c += dao.addRecipeIng(map);
				}
			}//재료 반복
			
			//과정
			String[] proContents = dto.getProcess_content();
			MultipartFile[] proImgFiles = dto.getProcess_imagefile();
			String[] proImgs = new String[proImgFiles.length];
			int[] nums = dto.getProcess_num();
			for(int i = 0; i<proContents.length;i++) {
				proImgs[i] = uploadImg(proImgFiles[i]);
				Recipe_ProDto pro = new Recipe_ProDto();
				pro.setRecipe_id(recipe_id);
				pro.setProcess_content(proContents[i]);
				pro.setProcess_image(proImgs[i]);
				pro.setProcess_num(nums[i]);
				c+=dao.addRecipePro(pro);
			}
			
			//태그
			String[] tags = dto.getTag_name();
			for(int i = 0; i<tags.length;i++) {
				TagDto tag = new TagDto();
				tag.setRecipe_id(recipe_id);
				tag.setTag_name(tags[i]);
				c += dao.addRecipeTag(tag);
			} 
			
		return c;
	}

}
