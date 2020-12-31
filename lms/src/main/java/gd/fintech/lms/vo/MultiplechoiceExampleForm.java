package gd.fintech.lms.vo;

import java.util.List;

import lombok.Data;

@Data
public class MultiplechoiceExampleForm {
	private List<String>	multiplechoiceExampleId;			// 객관식 보기 번호 (1, 2, 3, 4, 5)
	private List<String>	multiplechoiceExampleContent;		// 객관식 보기 내용
}
