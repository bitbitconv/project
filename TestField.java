import java.text.SimpleDateFormat;
import java.util.Date;

import com.conv.review.dao.ReviewDAO;
import com.conv.review.domain.Reply;
import com.conv.review.domain.Review;

public class TestField {
	public static void main(String[] args) {
		ReviewDAO test = new ReviewDAO();
		
		Review review = new Review();
		Reply reply = new Reply();
		
		
		// 목록 조회 테스트
//		test.selectBoard();
		
		
		// 글 조회 테스트
		Review testR = new Review();
		testR = test.selectBoardByNo(8);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
							
		System.out.printf("%d\t%s\t%s\t%d\t%s\n", testR.getNo(), testR.getTitle(), testR.getWriter(), testR.getHit(), testR.getContent(), sdf.format(testR.getRegDate()));
	
		
		

		// 글등록 테스트
//		review.setNo(1);
//		review.setTitle("확인용");
//		review.setWriter("sgsd");
//		review.setContent("확인용");
//		review.setRegDate(new Date());
//		
//		test.insertBoard(review);
		
		
		// 글수정 테스트
//		review.setNo(4);
//		review.setTitle("제목수정");
//		review.setWriter("aaa");
//		review.setContent("글내용수정");
//		review.setRegDate(new Date());
//		
//		test.updateBoard(review);
		
		
		// 글삭제 테스트		
//		test.deleteBoard(3);
		
		

		// 댓글 등록 테스트
//		reply.settNo(8);
//		reply.setNo(1);
//		reply.setWriter("작성자3");
//		reply.setContent("내용3");
//		reply.setRegDate(new Date());
//		
//		test.insertReply(reply);
		
	}
}
