package gd.fintech.lms.vo;

import lombok.Data;

// 객관식 문제 Vo

@Data
public class Mulltiplechoice {
	private int		multiplechoiceNo;			// 객관식 문제 고유번호
	private int		lectureNo;					// 강좌 고유번호
	private int		multiplechoiceId;			// 객관식 문제 번호
	private String	multiplechoiceQuestion;		// 객관식 문제 내용
	private String	multiplechoiceAnswer;		// 객관식 문제 답안 (1, 2, 3, 4, 5)
	private String	multiplechoiceCreatedate;	// 객관식 문제 생성 일시
	private String	multiplechoiceUpdatedate;	// 객관식 문제 업데이트 일시
}
