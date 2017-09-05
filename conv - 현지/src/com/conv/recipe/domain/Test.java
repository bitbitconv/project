package com.conv.recipe.domain;

import com.conv.recipe.dao.RecipeDAO;

public class Test {
	public static void main(String[] args) {
	
		RecipeDAO recipe = new RecipeDAO();
		
		Recipe test = new Recipe();
		
//		test.setTitle("rr");
//		test.setContent("rlrlr");
//		test.setPhoto("kkkd");
//		
//		recipe.insertRecipe(test);
		
//	
		test.setTitle("rrr");
		test.setContent("www");
		test.setPhoto("vvvv");
		test.setNo(8);
		
		recipe.updateRecipe(test);
//		
		
//		test.setNo(7);
//		recipe.deleteRecipe(7);
//		
 }

}
