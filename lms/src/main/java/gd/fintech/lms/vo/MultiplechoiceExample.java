package gd.fintech.lms.vo;

import lombok.Data;

// 객관식 보기 Vo

@Data
public class MultiplechoiceExample {
	private int		multiplechoiceExampleNo;			// 객관식 보기 고유번호
	private int		multiplechoiceNo;					// 객관식 문제 번호
	private String	multiplechoiceExampleId;			// 객관식 보기 번호 (1, 2, 3, 4, 5)
	private String	multiplechoiceExampleContent;		// 객관식 보기 내용
	private String	multiplechoiceExampleCreatedate;	// 객관식 보기 생성 일시
	private String	multiplechoiceExampleUpdatedate;	// 객관식 보기 업데이트 일시
}
