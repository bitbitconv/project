package com.conv.world.domain;

import com.conv.world.dao.WorldDAO;

public class Test11111 {
	public static void main(String[] args) {
			WorldDAO world = new WorldDAO();
			
			World test = new World();
			
//			test.setTitle("상준");
//			test.setContent("밥을");
//			test.setPhoto("사달라");
//			
//			test.setNo(5);
			
			world.deleteWorld(5);
	}
}

