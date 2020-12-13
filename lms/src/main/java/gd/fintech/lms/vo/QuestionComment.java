package gd.fintech.lms.vo;

import lombok.Data;

// 질문 댓글 Vo
// 질문게시판에 강사가 작성한 댓글을 기록한다.

@Data
public class QuestionComment {
	private int		questionCommentNo;				// 질문 댓글 고유번호
	private int		questionNo;						// 질문 고유번호
	private String	accountId;						// 계정 아이디 (강사)
	private String	questionCommentWriter;			// 작성자 이름 (강사)
	private String	questionCommentContext;			// 질문 댓글 내용
	private String	questionCommentCreatedate;		// 질문 댓글 생성 일시
	private String	questionCommentUpdatedate;		// 질문 댓글 업데이트 일시
}
