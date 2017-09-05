package com.conv.review.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import com.conv.review.domain.Reply;
import com.conv.review.domain.Review;
import com.conv.util.ConnectionPool;
import com.conv.util.JdbcUtil;



public class ReviewDAO {
		
		// 페이지 조회 (목록)
		public List<Review> selectBoard(int pageNum) {
			List<Review> list = new ArrayList<>();
			Connection con = null;
			PreparedStatement stmt = null;
			try {
				con = ConnectionPool.getConnection();
				StringBuffer sql = new StringBuffer();
				// 페이징
				sql.append("select b.* ");
				sql.append("  from (select rownum rnum, no, title, content, writer, hit, reg_date");
				sql.append("          from (select * ");
				sql.append("                  from t97_review ");
				sql.append("                 order by no desc) ");
				sql.append("        ) b ");
				sql.append(" where rnum between ? and ? ");
//				? 자리에 값 지정해주기
				
				
				stmt = con.prepareStatement(sql.toString());
				
				int cnt = selectAllBoard().size();
				stmt.setInt(1, 8*pageNum - 7);
				if(8*pageNum <= cnt) {
					stmt.setInt(2, 8*pageNum);
				}
				else {
					stmt.setInt(2, cnt);
				}
				
				ResultSet rs = stmt.executeQuery();
				while (rs.next()) {
					Review review = new Review();
					review.setNo(rs.getInt("no"));
					review.setTitle(rs.getString("title"));
					review.setWriter(rs.getString("writer"));
					review.setHit(rs.getInt("hit"));
					review.setRegDate(rs.getDate("reg_date"));
					review.setContent(rs.getString("content"));
					list.add(review);
					
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				JdbcUtil.close(stmt);
				ConnectionPool.releaseConnection(con);
			}
			
			return list;
		}
		
		// 전체 게시글 조회 (목록)
		public List<Review> selectAllBoard() {
			List<Review> list = new ArrayList<>();
			Connection con = null;
			PreparedStatement stmt = null;
			try {
				con = ConnectionPool.getConnection();
				StringBuffer sql = new StringBuffer();
				sql.append("select * ");
				sql.append("  from t97_review ");
				
				
				stmt = con.prepareStatement(sql.toString());
				
				ResultSet rs = stmt.executeQuery();
				
				while (rs.next()) {
					Review review = new Review();
					review.setNo(rs.getInt("no"));
					review.setTitle(rs.getString("title"));
					review.setWriter(rs.getString("writer"));
					review.setHit(rs.getInt("hit"));
					review.setRegDate(rs.getDate("reg_date"));
					review.setContent(rs.getString("content"));
					list.add(review);
					
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				JdbcUtil.close(stmt);
				ConnectionPool.releaseConnection(con);
			}
			
			return list;
		}
		
		
		
		// 게시물 조회
		public Review selectBoardByNo(int no) {
			Connection con = null;
			PreparedStatement pstmt = null;
			
			try {
				con = ConnectionPool.getConnection();
				StringBuffer sql = new StringBuffer();
				sql.append(" select no, title, writer, hit, reg_date, content ");
				sql.append(" from t97_review ");
				sql.append(" where no = ?");
				
				pstmt = con.prepareStatement(sql.toString());
				
				pstmt.setInt(1, no);
				
				ResultSet rs = pstmt.executeQuery();
				
				if(rs.next()) {
					Review review = new Review();
					
					review.setNo(rs.getInt("no"));
					review.setTitle(rs.getString("title"));
					review.setWriter(rs.getString("writer"));
					review.setHit(rs.getInt("hit"));
					review.setRegDate(rs.getTimestamp("reg_date"));
					review.setContent(rs.getString("content"));
					
					// 해당 게시글의 댓글  가져오기
					selectReply(rs.getInt("no"));
					
					return review;
				}

			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				JdbcUtil.close(pstmt);
				ConnectionPool.releaseConnection(con);
			}
			return null;
		}
		
		
		
		// 게시물 등록
		public void insertBoard(Review review) {
			Connection con = null;
			PreparedStatement pstmt = null;
			try {
				con = ConnectionPool.getConnection();
				StringBuffer sql = new StringBuffer();
				sql.append(" insert into t97_review(no, hit, title, writer, content, reg_date) ");
				sql.append(" values(s_review_no.nextval, 0, ?, ?, ?, sysdate) ");
				
				pstmt = con.prepareStatement(sql.toString());
				
				pstmt.setString(1, review.getTitle());
				pstmt.setString(2, review.getWriter());
				pstmt.setString(3, review.getContent());
				
				pstmt.executeUpdate();
				
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				JdbcUtil.close(pstmt);
				ConnectionPool.releaseConnection(con);
			}
		}
		
		
		
		//게시물 수정
		public void updateBoard(Review review) {
			Connection con = null;
			PreparedStatement pstmt = null;
			try {
				con = ConnectionPool.getConnection();
				StringBuffer sql = new StringBuffer();
				
				sql.append(" update t97_review ");
				sql.append(" set title = ? ,");
				sql.append("     content = ? ");
				sql.append(" where no = ? ");
				
				pstmt = con.prepareStatement(sql.toString());
				pstmt.setString(1, review.getTitle());
				pstmt.setString(2, review.getContent());
				pstmt.setInt(3, review.getNo());
				
				pstmt.executeUpdate();
				
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				JdbcUtil.close(pstmt);
				ConnectionPool.releaseConnection(con);
			}
		}
		
		
		
		
		// 게시물 삭제
		public boolean deleteBoard(int no) {
			Connection con = null;
			PreparedStatement pstmt = null;
			try {
				con = ConnectionPool.getConnection();
				
				StringBuffer sql = new StringBuffer();
				
				sql.append(" delete ");
				sql.append(" from t97_review ");
				sql.append(" where no = ? ");
				
				pstmt = con.prepareStatement(sql.toString());
				pstmt.setInt(1, no);
				
				int cnt = pstmt.executeUpdate();
				
				if(cnt == 1) return true;
				
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				JdbcUtil.close(pstmt);
				ConnectionPool.releaseConnection(con);
			}
			return false;
		}
		
		
		//========== 댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글=================
		
		
		
		//댓글 조회(인데 게시물 조회할 때 같이 돼야함)
		public List<Reply> selectReply(int tNo) {
			List<Reply> list = new ArrayList<>();
			Connection con = null;
			PreparedStatement pstmt = null;
			try {
				con = ConnectionPool.getConnection();
				StringBuffer sql = new StringBuffer();
				sql.append(" select t_no, no, writer, content, reg_date ");
				sql.append("   from t97_review_reply ");
				sql.append("  where t_no = ? ");
				sql.append(" order by no ");

				
				pstmt = con.prepareStatement(sql.toString());
				pstmt.setInt(1, tNo);
				ResultSet rs = pstmt.executeQuery();
					
				while (rs.next()) {
					Reply reply = new Reply();
					reply.setWriter(rs.getString("writer"));
					reply.setContent(rs.getString("content"));
					reply.setRegDate(rs.getDate("reg_date"));
					list.add(reply);
				}
				
				
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				JdbcUtil.close(pstmt);
				ConnectionPool.releaseConnection(con);
			}
			
			return list;
		}
		
		
		
		// 댓글 등록
			public void insertReply(Reply reply) {
				Connection con = null;
				PreparedStatement pstmt = null;
				try {
					con = ConnectionPool.getConnection();
					StringBuffer sql = new StringBuffer();
					sql.append(" insert into t97_review_reply(t_no, no, writer, content, reg_date) ");
					sql.append(" values(?, s_reply_no.nextval, ?, ?, sysdate) ");
					
					pstmt = con.prepareStatement(sql.toString());
					
					pstmt.setInt(1, reply.gettNo());
					pstmt.setString(2, reply.getWriter());
					pstmt.setString(3, reply.getContent());
					
					pstmt.executeUpdate();
					
				} catch(Exception e) {
					e.printStackTrace();
				} finally {
					JdbcUtil.close(pstmt);
					ConnectionPool.releaseConnection(con);
				}
			}
			
			
			
			//댓글 수정
			public void updateReply(Reply reply) {
				Connection con = null;
				PreparedStatement pstmt = null;
				try {
					con = ConnectionPool.getConnection();
					StringBuffer sql = new StringBuffer();
					
					sql.append(" update t97_review_reply ");
					sql.append(" set content = ? ");
					sql.append(" where no = ? ");
					
					pstmt = con.prepareStatement(sql.toString());
					pstmt.setString(1, reply.getContent());
					pstmt.setInt(2, reply.getNo());
					
					pstmt.executeUpdate();
					
				} catch(Exception e) {
					e.printStackTrace();
				} finally {
					JdbcUtil.close(pstmt);
					ConnectionPool.releaseConnection(con);
				}
			}
			
			
			
			
			// 댓글 삭제
			public boolean deleteReply(int no) {
				Connection con = null;
				PreparedStatement pstmt = null;
				try {
					con = ConnectionPool.getConnection();
					
					StringBuffer sql = new StringBuffer();
					
					sql.append(" delete ");
					sql.append(" from t97_review_reply ");
					sql.append(" where no = ? ");
					
					pstmt = con.prepareStatement(sql.toString());
					pstmt.setInt(1, no);
					
					int cnt = pstmt.executeUpdate();
					
					if(cnt == 1) return true;
					
				} catch(Exception e) {
					e.printStackTrace();
				} finally {
					JdbcUtil.close(pstmt);
					ConnectionPool.releaseConnection(con);
				}
				return false;
			}
	
}
