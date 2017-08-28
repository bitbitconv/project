package com.conv.main.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

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
	
	public static void main(String[] args) {
	// 로그인테스트를 하려면 아래 주석을 풀고 실행하세요.
//		MemberUI ui = new MemberUI();
//		ui.selectMenu();
		
		Service s = new Service();
		s.service();
	}

	public void mainRecipe() {

		Connection con = null;
		PreparedStatement stmt = null;

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
				System.out.println(recipe.getPhoto());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionPool.releaseConnection(con);
		}
	}

	public void mainReview() {
		Connection con = null;
		PreparedStatement stmt = null;

		try {
			con = ConnectionPool.getConnection();

			StringBuffer sql = new StringBuffer();
			// sql.append("select rownum, photo from (select * from t97_recipe order by no
			// desc) ");
			// sql.append("where rownum<=2 ");
			//
			// stmt = con.prepareStatement(sql.toString());
			// ResultSet rs = stmt.executeQuery();
			//
			// sql=null;

			sql.append("select rownum, title, writer from (select * from t97_review order by no desc) ");
			sql.append("where rownum<=2  ");

			stmt = con.prepareStatement(sql.toString());
			ResultSet rs = stmt.executeQuery();

			List<Review> list = new ArrayList<>();
			// List<Recipe> list = new ArrayList<>();
			while (rs.next()) {

				Review r = new Review();
				r.setTitle(rs.getString("title"));
				r.setWriter(rs.getString("writer"));
				list.add(r);
				// Recipe r = new Recipe();
				// r.setPhoto(rs.getString("photo"));
				// list.add(r);

			}
			// for(Recipe recipe : list) {
			// System.out.println(recipe.getPhoto());
			// }
			for (Review review : list) {
				System.out.println(review.getTitle());
				System.out.println(review.getWriter());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionPool.releaseConnection(con);
		}
	}
	
	public void mainFree(){
		Connection con = null;
		PreparedStatement stmt = null;

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
				System.out.println(free.getState());
				System.out.println(free.getTitle());
				System.out.println(free.getWriter());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionPool.releaseConnection(con);
		}
	}
	
	
	public void mainPB() {

		Connection con = null;
		PreparedStatement stmt = null;

		try {
			con = ConnectionPool.getConnection();

			StringBuffer sql = new StringBuffer();
			sql.append("select photo from t97_PB ");
			// 랜덤선택 구문 추가 필요
			
			stmt = con.prepareStatement(sql.toString());

			ResultSet rs = stmt.executeQuery();
			List<PB> list = new ArrayList<>();
			while (rs.next()) {

				PB pb = new PB();
				pb.setImageURL(rs.getString("photo"));
				list.add(pb);

			}
			for (PB pb : list) {
				System.out.println(pb.getImageURL());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionPool.releaseConnection(con);
		}
	}
	
	public void mainSale() {
		
		Connection con = null;
		PreparedStatement stmt = null;
		
		try {
			con = ConnectionPool.getConnection();
			
			StringBuffer sql = new StringBuffer();
			sql.append("select photo from t97_sale ");
			// 랜덤선택 구문 추가 필요
			
			stmt = con.prepareStatement(sql.toString());
			
			ResultSet rs = stmt.executeQuery();
			List<Sale> list = new ArrayList<>();
			while (rs.next()) {
				
				Sale sale = new Sale();
				sale.setImageURL(rs.getString("photo"));
				list.add(sale);
				
			}
			for (Sale sale : list) {
				System.out.println(sale.getImageURL());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionPool.releaseConnection(con);
		}
	}

	public void mainWorld() {

		Connection con = null;
		PreparedStatement stmt = null;

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
				System.out.println(world.getPhoto());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionPool.releaseConnection(con);
		}
	}
	

	// public List<Object> mainList(String sql){
	// stmt = con.prepareStatement(sql.toString());
	//
	// ResultSet rs = stmt.executeQuery();
	// List<Object> list = new ArrayList<>();
	// while (rs.next()) {
	//
	// Recipe r = new Recipe();
	// r.setPhoto(rs.getString("photo"));
	// list.add(r);
	//
	// }
	// return list;
	// }

	public void search() {
		
		Connection con = null;
		PreparedStatement stmt = null;
		System.out.println("리뷰게시판에 검색할 내용 입력 : ");
		Scanner sc = new Scanner(System.in);
		
		String find = sc.nextLine();
		try {
			con = ConnectionPool.getConnection();
			//review게시판의 content, title, writer에서 일치하는 부분이 있는지 검색
			StringBuffer sql = new StringBuffer();
			sql.append("select * from t97_review ");
			sql.append("where content like '%"+find+"%'  ");
			sql.append("or title like '%"+find+"%'  ");
			sql.append("or writer like '%"+find+"%'  ");
			
			stmt = con.prepareStatement(sql.toString());
			
			ResultSet rs = stmt.executeQuery();
			List<Recipe> list = new ArrayList<>();
			while (rs.next()) {
				
				Recipe r = new Recipe();
				r.setNo(rs.getInt("no"));
				list.add(r);
				
			}
			for (Recipe recipe : list) {
				System.out.println(recipe.getNo());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionPool.releaseConnection(con);
		}
	}
}


class Service{
	void service(){
		MainDAO dao = new MainDAO();
		dao.mainFree();
		dao.mainPB();
		dao.mainRecipe();
		dao.mainReview();
		dao.mainSale();
		dao.mainWorld();
		dao.search();
	}
	
}
