package gd.fintech.lms.vo;

import lombok.Data;

// 질문 Vo
// 강좌별 질문게시판에 작성될 제목과 내용을 기록한다.

@Data
public class Question {
	private int		questionNo;				// 질문 고유번호
	private int		lectureNo;				// 강좌 고유번호
	private String	accountId;				// 계정 아이디 (학생)
	private String	questionWriter;			// 작성자 이름 (학생)
	private String	questionTitle;			// 질문 제목
	private String	questionContent;		// 질문 내용
	private String	questionCreatedate;		// 질문 생성 일시
	private String	questionUpdatedate;		// 질문 업데이트 일시
	private int		questionCount;			// 질문 조회수
	private String	questionPassword;		// 질문 비밀번호 (비밀글 설정시 필요)
}
