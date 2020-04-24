package yk.user.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import yk.user.model.Recipe_CategoryDto;
import yk.user.model.Recipe_InfoDto;
import yk.user.model.Recipe_ProDto;
import yk.user.model.TagDto;
import yk.user.model.WriteRecipeDto;

@Service
public class UpdateRecipeService {

	private UpdateRecipeDao updatedao;

	@Autowired
	public void setUpdatedao(UpdateRecipeDao updatedao) {
		this.updatedao = updatedao;
	}

	private WriteRecipeDao writedao;

	@Autowired
	public void setWritedao(WriteRecipeDao writedao) {
		this.writedao = writedao;
	}

	// 파일다운 + db에 넣을 이름 구하기 -- 경로 확인 : write, update
	private String uploadImg(MultipartFile img) {
		String filename = img.getOriginalFilename();

		String uploadName = System.currentTimeMillis() + "_note" + (int) (Math.random() * 50);
		uploadName += filename.substring(filename.lastIndexOf("."));

		try {
			img.transferTo(new File("\\\\192.168.0.108\\img\\" + uploadName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		return uploadName;
	}

	@Transactional(rollbackFor = Exception.class)
	public int updateRecipe(WriteRecipeDto dto,int recipe_id) {
		int c = 0;
		try {
			//기본정보
			Recipe_InfoDto info = new Recipe_InfoDto();
			info.setRecipe_id(recipe_id);
			info.setRecipe_name(dto.getRecipe_name());
			info.setRecipe_exp(dto.getRecipe_exp());
			info.setDuration(dto.getDuration()+"분");
			info.setPrice(dto.getPrice());
			
			if(dto.getImagefile().getOriginalFilename().isEmpty()) {
				info.setImage(dto.getImage());
			}else {
				info.setImage(uploadImg(dto.getImagefile()));
			}

			c+= updatedao.infoUpdate(info);
			System.out.println("기본정보::"+c);
			
			//카테고리
			c += updatedao.delCategory(recipe_id);
			for(int i = 0; i<dto.getCategory_id().length;i++) {
				if(dto.getCategory_id()[i]>0) {
				Recipe_CategoryDto cat = new Recipe_CategoryDto();
				cat.setRecipe_id(recipe_id);
				cat.setCategory_id(dto.getCategory_id()[i]);
				c += writedao.addRecipeCategory(cat);
				}
			}
			
			//재료
			c+= updatedao.delIng(recipe_id);
			Map<String,Object> map = null;
			String[] ingNames = dto.getIng_name();
			String[] caps = dto.getCapacity();
			for(int i = 0;i<ingNames.length;i++) {
				String ingName = ingNames[i].trim();
				int checkIng = writedao.checkIng(ingName);
				if(checkIng > 0) {
					int ingId = writedao.getIngId(ingName);
					map = new HashMap<>();
					map.put("recipe_id", recipe_id);
					map.put("capacity", caps[i]);
					map.put("ing_id", ingId);
					c += writedao.addRecipeIng(map);
				}else {
					int newIngId = writedao.getMaxIngId()+1;
					map = new HashMap<>();
					map.put("ing_id", newIngId);
					map.put("ing_name", ingName);
					writedao.addIng(map);
					
					map.put("recipe_id", recipe_id);
					map.put("capacity", caps[i]);
					c += writedao.addRecipeIng(map);
				}
			}
			
			//과정
			c += updatedao.delPro(recipe_id);
			String[] proContents = dto.getProcess_content();
			MultipartFile[] proImgFiles = dto.getProcess_imagefile();
			String[] proImgs = dto.getProcess_image();
			int[] nums = dto.getProcess_num();
			for(int i = 0; i<proContents.length;i++) {
				Recipe_ProDto pro = new Recipe_ProDto();
				pro.setRecipe_id(recipe_id);
				pro.setProcess_content(proContents[i]);
				pro.setProcess_num(nums[i]);

				if(proImgFiles[i].getOriginalFilename().length()>0) {
					pro.setProcess_image(uploadImg(proImgFiles[i]));
				}else {
					pro.setProcess_image(proImgs[i]);
				}				
				
				c+=writedao.addRecipePro(pro);
			}
			
			//태그
			c += updatedao.delTag(recipe_id);
			String[] tags = dto.getTag_name();
			for(int i = 0; i<tags.length;i++) {
				TagDto tag = new TagDto();
				tag.setRecipe_id(recipe_id);
				tag.setTag_name(tags[i]);
				c += writedao.addRecipeTag(tag);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			return 0;
		}
		return c;
	}

}
