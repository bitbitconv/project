package com.conv.sale.dao;


	

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


import com.conv.sale.domain.Sale;
import com.conv.util.ConnectionPool;
import com.conv.util.JdbcUtil;

public class SaleDAO {

	
	public static void selectSale(){
		
		List<Sale> list = new ArrayList<>();		
		Connection con = null ;
		PreparedStatement stmt = null ;
		try {			
			con = ConnectionPool.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("select  name, photo, price, option, conv_name");
			sql.append("  from t97_sale ");
			stmt = con.prepareStatement(sql.toString());
			ResultSet rs = stmt.executeQuery();
			
			while (rs.next()) {
				
				Sale sale = new Sale();				
				
				sale.setProductName(rs.getString("name"));
				sale.setImageURL(rs.getString("photo"));
				sale.setPrice(rs.getInt("price"));
				sale.setOption(rs.getString("option"));
				sale.setConvName(rs.getString("conv_name"));
				
				list.add(sale);	
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(stmt);
			ConnectionPool.releaseConnection(con);
		}	
		
	}
	
	
}

