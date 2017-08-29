package com.conv.world.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.conv.util.ConnectionPool;
import com.conv.util.JdbcUtil;
import com.conv.world.domain.World;


public class WorldDAO {
	
	int no=0;
	
	public static List<World> selectWorld() {

		List<World> list = new ArrayList<>();
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ConnectionPool.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("select id, manager, title, no, content, photo, hits");
			sql.append("	 from t97_world		");
			sql.append("	order by no desc		");
			pstmt = con.prepareStatement(sql.toString());
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next()) {
				
				World world = new World();
				world.setId(rs.getString("id"));
				world.setManager(rs.getString("manager"));
				world.setTitle(rs.getString("title"));
				world.setNo(rs.getInt("no"));
				world.setContent(rs.getString("content"));
				world.setPhoto(rs.getString("photo"));
				world.setHits(rs.getInt("hits"));

				list.add(world);
				
			}
			for(World world : list) {
				System.out.printf("%s\t%s\t%s\t%d\t%s\t%s\t%d \n", world.getId(), world.getManager(), world.getTitle(), 
						world.getNo(), world.getContent(), world.getPhoto(), world.getHits());
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(pstmt);
			ConnectionPool.releaseConnection(con);
		}
		return list;
	}
	public void insertWorld(World world) {  //  등록
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ConnectionPool.getConnection();
			
			   StringBuffer sql = new StringBuffer();
			   sql.append("insert into t97_world(");
			   sql.append("	id,  title, no, content, photo, hits	");
			   sql.append(")  values  (");
			   sql.append(" 'id',  ? ,s_world_no.nextval, ?, ?, 1	 ");
			   sql.append(") ");
			   
			   pstmt = con.prepareStatement(sql.toString());
			   pstmt.setString(1, world.getTitle());
			   pstmt.setString(2, world.getContent());
			   pstmt.setString(3, world.getPhoto());
			   pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}finally {
		  JdbcUtil.close(pstmt);
		  ConnectionPool.releaseConnection(con);
		}
		return;
	}

	public void updateWorld(World world) {   //수정
	
			Connection con = null;
			PreparedStatement pstmt=null;
			try {
				con = ConnectionPool.getConnection();
				StringBuffer sql = new StringBuffer();
			
					sql.append("update t97_world");
					sql.append("     set title = ?,   ");
					sql.append("			content = ?, " );
					sql.append("			photo = ? " );
					sql.append("			where no = ? " );
				
					pstmt = con.prepareStatement(sql.toString());
				
					pstmt.setString(1, world.getTitle());
					pstmt.setString(2, world.getContent());
					pstmt.setString(3, world.getPhoto());
					pstmt.setInt(4, world.getNo());
					pstmt.executeUpdate();
			
				}catch (Exception e) {
				e.printStackTrace();
				}finally {
					JdbcUtil.close(pstmt);
					ConnectionPool.releaseConnection(con);
				}
			return;
		}
	
	
	public boolean deleteWorld(int no) {
		Connection con = null;
		PreparedStatement pstmt=null;
		
		try {
			con = ConnectionPool.getConnection();
			
		   StringBuffer sql = new StringBuffer();
		   sql.append("delete ");
		   sql.append("  from t97_world  ");
		   sql.append("  where no = ?  ");
		   
		   pstmt = con.prepareStatement(sql.toString());
		  
		   pstmt.setInt(1, no);
		   
		   int cnt= pstmt.executeUpdate();
		   
		   if (cnt == 1) {
			   return true;
		   }
		   
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(pstmt);
			  ConnectionPool.releaseConnection(con);
		}
		return false;			
}
	public static void main(String[] args) {
		selectWorld();
	}
}

