package com.conv.free.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.conv.free.domain.Free;
import com.conv.free.domain.FreeReply;

import com.conv.util.ConnectionPool;
import com.conv.util.JdbcUtil;

public class FreeDAO {
	
	public List<Free> selectBoard() {
		List<Free> list = new ArrayList<>();
		Connection con = null;
		PreparedStatement stmt = null;
		
		try {
			con = ConnectionPool.getConnection();
			
			StringBuffer sql = new StringBuffer();
			sql.append("select b.* ");
			sql.append("  from (select rownum rnum, ");
			sql.append("	no, state, title, writer, reg_date, hits ");
			sql.append("  from (select * ");
			sql.append("  from t97_free ");
			sql.append(" order by reg_date desc) a ) b ");
			sql.append(" where rnum between 1 and 8 ");
			
			stmt = con.prepareStatement(sql.toString());
			ResultSet rs = stmt.executeQuery();
			
			while (rs.next()) {
				Free free = new Free();
				free.setNo(rs.getInt("no"));
				free.setState(rs.getInt("state"));
				free.setTitle(rs.getString("title"));
				free.setWriter(rs.getString("writer"));
				free.setRegDate(rs.getDate("reg_date"));
				free.setHits(rs.getInt("hits"));
				list.add(free);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(stmt);
			ConnectionPool.releaseConnection(con);
		}
		return list;
	}
	
	public Free selectBoardByTitle(String keyWord) {
		Connection con = null;
		PreparedStatement stmt = null;
		
		try {
			con = ConnectionPool.getConnection();
			
			StringBuffer sql = new StringBuffer();
			sql.append("select no, state, title, writer, reg_date, hits ");
			sql.append("  from t97_free ");
			sql.append(" where title like ? ");
			sql.append("    or content like ? ");
			
			stmt = con.prepareStatement(sql.toString());
			stmt.setString(1, "%"+keyWord+"%");
			stmt.setString(2, "%"+keyWord+"%");
			ResultSet rs = stmt.executeQuery();
			
			while (rs.next()) {
				Free free = new Free();
				free.setNo(rs.getInt("no"));
				free.setState(rs.getInt("state"));
				free.setTitle(rs.getString("title"));
				free.setWriter(rs.getString("writer"));
				free.setRegDate(rs.getDate("reg_date"));
				free.setHits(rs.getInt("hits"));
				
				return free;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(stmt);
			ConnectionPool.releaseConnection(con);
		}
		return null;
	}
	
	public void insertBoard(Free free) {
		Connection con = null;
		PreparedStatement stmt = null;
		
		try {
			con = ConnectionPool.getConnection();
			
			StringBuffer sql = new StringBuffer();
			sql.append("insert into t97_free ");
			sql.append(" (no, state, title, content, writer, hits, reg_date) ");
			sql.append("values ");
			sql.append(" (s_free_no.nextval, ?, ?, ?, ?, ?, sysdate) ");
			
			stmt = con.prepareStatement(sql.toString());
			stmt.setInt(1, free.getState());
			stmt.setString(2, free.getTitle());
			stmt.setString(3, free.getContent());
			stmt.setString(4, free.getWriter());
			stmt.setInt(5, free.getHits());
			stmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(stmt);
			ConnectionPool.releaseConnection(con);
		}
	}
	
	public void updateBoard(Free free) {
		Connection con = null;
		PreparedStatement stmt = null;
		
		try {
			con = ConnectionPool.getConnection();
			
			StringBuffer sql = new StringBuffer();
			sql.append("update t97_free ");
			sql.append("   set state = ?, ");
			sql.append("       title = ?, ");
			sql.append("       content = ? ");
			sql.append(" where no = ? ");
			
			stmt = con.prepareStatement(sql.toString());
			stmt.setInt(1, free.getState());
			stmt.setString(2, free.getTitle());
			stmt.setString(3, free.getContent());
			stmt.setInt(4, free.getNo());
			stmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(stmt);
			ConnectionPool.releaseConnection(con);
		}
	}
	
	public boolean deleteboard(int no) {
		Connection con = null;
		PreparedStatement stmt = null;
		
		try {
			con = ConnectionPool.getConnection();
			
			StringBuffer sql = new StringBuffer();
			sql.append("delete ");
			sql.append("  from t97_free ");
			sql.append(" where no = ? ");
			
			stmt = con.prepareStatement(sql.toString());
			stmt.setInt(1, no);
			int cnt = stmt.executeUpdate();
			
			if (cnt == 0) return false;
			
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(stmt);
			ConnectionPool.releaseConnection(con);
		}
		return false;
	}
	
	public List<FreeReply> selectBoardReply() {
		List<FreeReply> list = new ArrayList<>();
		Connection con = null;
		PreparedStatement stmt = null;
		
		try {
			con = ConnectionPool.getConnection();
			
			StringBuffer sql = new StringBuffer();
			sql.append("select no, content, writer, reg_date ");
			sql.append("  from t97_free_reply ");
			sql.append(" order by reg_date desc ");
			
			stmt = con.prepareStatement(sql.toString());
			ResultSet rs = stmt.executeQuery();
			
			while (rs.next()) {
				FreeReply fr = new FreeReply();
				fr.setNo(rs.getInt("no"));
				fr.setContent(rs.getString("title"));
				fr.setWriter(rs.getString("writer"));
				fr.setRegDate(rs.getDate("reg_date"));
				list.add(fr);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(stmt);
			ConnectionPool.releaseConnection(con);
		}
		return list;
	}

	public void insertBoardReply(FreeReply fr) {
		Connection con = null;
		PreparedStatement stmt = null;
		
		try {
			con = ConnectionPool.getConnection();
			
			StringBuffer sql = new StringBuffer();
			sql.append("insert into t97_free ");
			sql.append(" (no, content, writer, reg_date) ");
			sql.append("values ");
			sql.append(" (s_free_no.nextval, ?, ?, sysdate) ");
			
			stmt = con.prepareStatement(sql.toString());
			stmt.setString(1, fr.getContent());
			stmt.setString(2, fr.getWriter());
			stmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(stmt);
			ConnectionPool.releaseConnection(con);
		}
	}

	public void updateBoardReply(FreeReply fr) {
		Connection con = null;
		PreparedStatement stmt = null;
		
		try {
			con = ConnectionPool.getConnection();
			
			StringBuffer sql = new StringBuffer();
			sql.append("update t97_free ");
			sql.append("   set content = ? ");
			sql.append(" where no = ? ");
			
			stmt = con.prepareStatement(sql.toString());
			stmt.setString(1, fr.getContent());
			stmt.setInt(2, fr.getNo());
			stmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(stmt);
			ConnectionPool.releaseConnection(con);
		}
	}

	public boolean deleteBoardReply(int no) {
		Connection con = null;
		PreparedStatement stmt = null;
		
		try {
			con = ConnectionPool.getConnection();
			
			StringBuffer sql = new StringBuffer();
			sql.append("delete ");
			sql.append("  from t97_free_reply ");
			sql.append(" where no = ? ");
			
			stmt = con.prepareStatement(sql.toString());
			stmt.setInt(1, no);
			int cnt = stmt.executeUpdate();
			
			if (cnt == 0) return false;
			
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(stmt);
			ConnectionPool.releaseConnection(con);
		}
		return false;
	}
}
