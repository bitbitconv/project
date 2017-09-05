package com.conv.main.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import com.conv.free.domain.Free;
import com.conv.pb.domain.PB;
import com.conv.recipe.domain.Recipe;
import com.conv.review.domain.Review;
import com.conv.sale.domain.Sale;
import com.conv.util.ConnectionPool;
import com.conv.world.domain.World;

public class MainDAO {
	// 각 게시판의 인기/최신 게시물 출력되도록, 로그인, 검색
	// Review, Recipe, Free, World, pb, sale 모두 출력가능하며
	// pb와 sale은 아직 DB가 없어 오류납니다.
	// 그냥 바로 실행하시면 게시판별 게시물 데이터들이 정해진 갯수만큼 차례로 출력됩니다.
	

	public String mainRecipe() {

		Connection con = null;
		PreparedStatement stmt = null;
		String result = "";
		try {
			con = ConnectionPool.getConnection();

			StringBuffer sql = new StringBuffer();
			sql.append("select rownum, photo from (select * from t97_recipe order by no desc) ");
			sql.append("where rownum<=2  ");

			stmt = con.prepareStatement(sql.toString());

			ResultSet rs = stmt.executeQuery();
			List<Recipe> list = new ArrayList<>();
			while (rs.next()) {

				Recipe r = new Recipe();
				r.setPhoto(rs.getString("photo"));
				list.add(r);

			}
			for (Recipe recipe : list) {
				result += recipe.getPhoto()+"<br>";
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionPool.releaseConnection(con);
		}
		return result;
	}

	public List<Review> mainReview() {
		Connection con = null;
		PreparedStatement stmt = null;
//		String result = "";
		List<Review> list = new ArrayList<>();
		
		try {
			con = ConnectionPool.getConnection();

			StringBuffer sql = new StringBuffer();

			sql.append("select rownum, no, title, writer, hit, reg_date from (select * from t97_review order by no desc) ");
			sql.append("where rownum<=4  ");

			stmt = con.prepareStatement(sql.toString());
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {

				Review r = new Review();
				r.setNo(rs.getInt("no"));
				r.setTitle(rs.getString("title"));
				r.setWriter(rs.getString("writer"));
				r.setHit(rs.getInt("hit"));
				r.setRegDate(rs.getDate("reg_date"));
				list.add(r);

			}
//			for (Review review : list) {
//				result +=review.getTitle()+"\t"+review.getWriter()+"<br>";
//			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionPool.releaseConnection(con);
		}
		return list;
	}
	
	public String mainFree(){
		Connection con = null;
		PreparedStatement stmt = null;
		String result = "";

		try {
			con = ConnectionPool.getConnection();

			StringBuffer sql = new StringBuffer();

			sql.append("select rownum, state, title, writer from (select * from t97_free where state = 1 order by no desc) ");
			sql.append("where rownum<=2  ");

			stmt = con.prepareStatement(sql.toString());
			ResultSet rs = stmt.executeQuery();

			List<Free> list = new ArrayList<>();
			while (rs.next()) {

				Free r = new Free();
				r.setState(rs.getInt("state"));
				r.setTitle(rs.getString("title"));
				r.setWriter(rs.getString("writer"));
				list.add(r);

			}
			for (Free free : list) {
				
				result += free.getState()+"\t"+free.getTitle()+"\t"+free.getWriter()+"<br>";
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionPool.releaseConnection(con);
		}
		return result;
	}
	
//		public String mainPB() {
//			MainDAO dao = new MainDAO();
//		try {
//			Document doc =  Jsoup.connect("http://www.wemakeprice.com/?utm_source=google&utm_medium=cpc&utm_term=%2E%EC%9C%84%EB%A9%94%ED%94%84&utm_content=wemake&utm_campaign=r_sa&gclid=Cj0KCQjw_o7NBRDgARIsAKvAgt0XToSAkzonC3HrDCZiNipsYwyB3uK9e-y9rti2wIixsINM3KqpPKUaAnMzEALw_wcB").get();
//			Elements elements = doc.select(".box_thumb img");
//			List<String> PBlist = new ArrayList<>();
//			for(int i=1;i<5;i++) {
//				Element img = elements.get(i);
//				String src = img.toString();
//				int j = src.indexOf("http");
//				int k = src.indexOf("\" alt");
//				System.out.println(src.substring(j, k));
//				String imgsrc = src.substring(j, k);
//				String imgsrc1 = "<img src='"+imgsrc+"'/>";
//				
//				PBlist.add(imgsrc1);
//			}
//			for(String PBresult : PBlist) {
//				PBresult += PBresult;
//				return PBresult;
//			}
//			
//			
//		} catch(Exception e) {
//			e.printStackTrace();
//		}
//		return null;
//	}
	
	public String mainPB() {

		Connection con = null;
		PreparedStatement stmt = null;
		String result = "";
		
		try {
			Random r = new Random();
			int i = r.nextInt(100)+1;
			con = ConnectionPool.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("select b.* from ( ");
			sql.append("select rownum rnum, a.* from ( ");
			sql.append("select imageurl from t97_sale  ");
			sql.append(" order by price desc ) a ) b ");
			sql.append("where rnum between 100 and 104 ");
			// 랜덤선택 구문 추가 필요
			System.out.println("i:"+i);
			stmt = con.prepareStatement(sql.toString());

			ResultSet rs = stmt.executeQuery();
			System.out.println(rs.next());
			List<PB> list = new ArrayList<>();
			while (rs.next()) {
				PB pb = new PB();
				pb.setImageURL(rs.getString("imageurl"));
				System.out.println(rs.getString("imageurl"));
				list.add(pb);
			}
			for (PB pb : list) {
				result += "<img src=\""+pb.getImageURL()+"\"  class=\"w3-half\" />";
				System.out.println(result);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionPool.releaseConnection(con);
		}
		return result;
	}
	
//	public String mainSale() {
//		
//		Connection con = null;
//		PreparedStatement stmt = null;
//		String result = "";
//		
//		try {
//			con = ConnectionPool.getConnection();
//			
//			StringBuffer sql = new StringBuffer();
//			sql.append("select photo from t97_sale ");
//			// 랜덤선택 구문 추가 필요
//			
//			stmt = con.prepareStatement(sql.toString());
//			
//			ResultSet rs = stmt.executeQuery();
//			List<Sale> list = new ArrayList<>();
//			while (rs.next()) {
//				
//				Sale sale = new Sale();
//				sale.setImageURL(rs.getString("photo"));
//				list.add(sale);
//				
//			}
//			for (Sale sale : list) {
//				result += sale.getImageURL()+"<br>";
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			ConnectionPool.releaseConnection(con);
//		}
//		return result;
//	}

	public String mainWorld() {

		Connection con = null;
		PreparedStatement stmt = null;
		String result = "";

		try {
			con = ConnectionPool.getConnection();

			StringBuffer sql = new StringBuffer();
			sql.append("select rownum, photo from (select * from t97_world order by no desc) ");
			sql.append("where rownum<=2  ");

			stmt = con.prepareStatement(sql.toString());

			ResultSet rs = stmt.executeQuery();
			List<World> list = new ArrayList<>();
			while (rs.next()) {

				World w = new World();
				w.setPhoto(rs.getString("photo"));
				list.add(w);

			}
			for (World world : list) {
				result += world.getPhoto()+"<br>";
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionPool.releaseConnection(con);
		}
		return result;
	}
	

	public String reviewSearch(String keyword) {
		
		Connection con = null;
		PreparedStatement stmt = null;
		String reviewSearch = "";
		
		try {
			con = ConnectionPool.getConnection();
			//review게시판의 content, title, writer에서 일치하는 부분이 있는지 검색
				StringBuffer sql = new StringBuffer();
				sql.append("select * from t97_review ");
				sql.append("where content like '%"+keyword+"%'  ");
				sql.append("or title like '%"+keyword+"%'  ");
				sql.append("or writer like '%"+keyword+"%'  ");
				stmt = con.prepareStatement(sql.toString());
				
				ResultSet rs = stmt.executeQuery();
				List<Review> reviewList = new ArrayList<>();
				while (rs.next()) {
					
					Review r = new Review();
					r.setNo(rs.getInt("no"));
					reviewList.add(r);
					
				}
				for (Review review : reviewList) {
					reviewSearch += review.getNo()+"<br>";
				}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionPool.releaseConnection(con);
		}
		return reviewSearch;
	}
}
	
