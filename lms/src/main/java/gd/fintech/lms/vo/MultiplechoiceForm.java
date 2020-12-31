package gd.fintech.lms.vo;

import java.util.List;

import lombok.Data;

@Data
public class MultiplechoiceForm {
	private int		multiplechoiceNo;			// 객관식 문제 번호
	private int		lectureNo;					// 강좌 고유번호
	private String	multiplechoiceQuestion;		// 객관식 문제 내용
	private String	multiplechoiceAnswer;		// 객관식 문제 답안 (1, 2, 3, 4, 5)
	private String	multiplechoiceScore;	    // 객관식 문제 배점
	
	private List<String>	multiplechoiceExampleId;			// 객관식 보기 번호 (1, 2, 3, 4, 5)
	private List<String>	multiplechoiceExampleContent;		// 객관식 보기 내용
}
