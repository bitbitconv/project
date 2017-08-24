package com.conv.recipe.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.conv.recipe.domain.Recipe;
import kr.co.mlec.util.ConnectionPool;
import kr.co.mlec.util.JdbcUtil;

public class RecipeDAO {

	int no =0;
	
	public static void selectRecipe(){
		
		List<Recipe> list = new ArrayList<>();		
		Connection con = null ;
		PreparedStatement stmt = null ;
		try {			
			con = ConnectionPool.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("select  no, id ,  title, content, manage , hits , photo");
			sql.append("  from t97_recipe ");
			sql.append(" order by no desc ");
			stmt = con.prepareStatement(sql.toString());
			ResultSet rs = stmt.executeQuery();
			
			while (rs.next()) {
				
				Recipe recipe= new Recipe();				
				recipe.setNo(rs.getInt("no"));
				recipe.setId(rs.getString("id"));
				recipe.setTitle(rs.getString("title"));
				recipe.setContent(rs.getString("content"));
				recipe.setManage(rs.getString("manage"));
				recipe.setHits(rs.getInt("hits"));
				recipe.setPhoto(rs.getString("photo"));
				
				list.add(recipe);	
				
			}
			for(Recipe recipe : list) {
				System.out.printf("%d\t%s\t%s\t%s\t%s\t%d\t%s \n" , recipe.getNo() ,recipe.getId() , 
						        recipe.getTitle() ,recipe.getContent() ,
						        recipe.getManage() ,recipe.getHits(), recipe.getPhoto());
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(stmt);
			ConnectionPool.releaseConnection(con);
		}	
		
	}
	
	

		public void insertRecipe(Recipe recipe) {  // 등록
		
		Connection con = null;
		PreparedStatement stmt = null;
		try {
			List<Recipe>list = new ArrayList<>();
			con =ConnectionPool.getConnection();
			StringBuffer sql = new StringBuffer();
	
			
			sql.append(" insert into t97_recipe  (");
			sql.append("    no , id ,title ,content , photo)");
			sql.append("  values( s_board_no.nextval , 'id' ,?, ?, ? ) " );			
				
			stmt = con.prepareStatement(sql.toString());
			stmt.setString(1, recipe.getTitle());
			stmt.setString(2, recipe.getContent());
			stmt.setString(3, recipe.getPhoto());
			stmt.executeUpdate();
			

		
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(stmt);
			ConnectionPool.releaseConnection(con);
		}
		return;
	}
	
	
	public void updateRecipe(Recipe recipe) { //수정
		
		Connection con = null ;
		PreparedStatement stmt = null ;				
		
		try {
			
			con = ConnectionPool.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append(" update t97_recipe");
			sql.append(" set   title = ?  , content = ? , photo = ? ");
			sql.append("  where no = ?");
		
			stmt = con.prepareStatement(sql.toString());
			stmt.setString(1, recipe.getTitle());		
			stmt.setString(2,recipe.getContent());
			stmt.setString(3,recipe.getPhoto());
			stmt.setInt(4, recipe.getNo());			
		    stmt.executeQuery();	
					
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(stmt);
			ConnectionPool.releaseConnection(con);
		}
		return ;
	
	}
	
	
	public boolean deleteRecipe(int no) {
		
		Connection con = null ;
		PreparedStatement stmt = null ;
				
		
		try {
			
			con = ConnectionPool.getConnection();
			StringBuffer sql = new StringBuffer();		
			
			sql.append(" delete ");
			sql.append(" from t97_recipe ");
			sql.append("  where no = ?");
		
		
			stmt = con.prepareStatement(sql.toString());
			stmt.setInt(1,no);				
		    int cnt =  stmt.executeUpdate();					
			if(cnt == 1) {
				return true ;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(stmt);
			ConnectionPool.releaseConnection(con);
		}
		return false;
	}
	
	public static void main(String[] args) {
		selectRecipe();
	}

	
}
