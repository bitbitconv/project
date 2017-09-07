package com.conv.pb.dao;


	

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.conv.pb.domain.PB;
import com.conv.util.ConnectionPool;
import com.conv.util.JdbcUtil;

public class PBDAO {

	
	public static void selectPB(){
		
		List<PB> list = new ArrayList<>();		
		Connection con = null ;
		PreparedStatement stmt = null ;
		try {			
			con = ConnectionPool.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("select  name, photo, price, conv_name");
			sql.append("  from t97_pb ");
			stmt = con.prepareStatement(sql.toString());
			ResultSet rs = stmt.executeQuery();
			
			while (rs.next()) {
				
				PB pb = new PB();				
				
				pb.setProductName(rs.getString("name"));
				pb.setImageURL(rs.getString("photo"));
				pb.setPrice(rs.getInt("price"));
				pb.setConvName(rs.getString("conv_name"));
				
				list.add(pb);	
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(stmt);
			ConnectionPool.releaseConnection(con);
		}	
		
	}
	
	
}

