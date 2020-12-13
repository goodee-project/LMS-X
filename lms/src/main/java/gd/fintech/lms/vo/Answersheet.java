package gd.fintech.lms.vo;

import lombok.Data;

// 답안지 Vo
// 학생들이 시험을 보고 난 답안지와 그에 따른 점수를 기록한다.

@Data
public class Answersheet {
	private int		multipleChoiceNo;	// 객관식 문제 고유번호
	private String	accountId;			// 계정 아이디 (학생)
	private String	answerSelect;		// 학생이 입력한 정답 보기
	private int		answerScore;		// 답안지 점수
}
