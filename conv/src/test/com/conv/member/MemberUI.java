package test.com.conv.member;

import java.util.Scanner;

import com.conv.member.dao.LogInDAO;
import com.conv.member.dao.MemberDAO;

public class MemberUI {
	
	private Scanner sc = new Scanner(System.in);
	
	public void selectMenu(){
		System.out.println("1. 로그인");
		System.out.println("2. 회원가입");
		System.out.print("메뉴 선택 : ");
		String select = sc.nextLine();
		LogInDAO lidao = new LogInDAO();
		MemberDAO mdao = new MemberDAO();
		
		switch(select) {
		case "1" : lidao.TryLogin();
			break;
		case "2" : mdao.Addmember();
			break;
		}
		
	}
	
	public void exitBoard() {
		System.exit(0);
	}
}
