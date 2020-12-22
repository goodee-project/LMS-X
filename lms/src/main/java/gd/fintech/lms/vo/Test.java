package gd.fintech.lms.vo;

import lombok.Data;

// 시험 Vo
// 각 강좌별 시험에 대한 정보를 기록한다.

@Data
public class Test {
	private int		lectureNo;			// 강좌 고유번호
	private String	testStartdate;		// 시험 시작 일시
	private String	testEnddate;		// 시험 종료 일시
	private String	testContent;		// 시험 내용
	private String	testCreatedate;		// 시험 생성 일시
	private String	testUpdatedate;		// 시험 업데이트 일시
	
	private int 	totalScore;		// 학생의 시험 총 점수
}
