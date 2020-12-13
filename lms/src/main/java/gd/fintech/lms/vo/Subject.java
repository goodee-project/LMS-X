package gd.fintech.lms.vo;

import lombok.Data;

// 과목 Vo

@Data
public class Subject {
	private int		subjectNo;				// 과목 고유번호
	private String	subjectName;			// 과목 이름
	private String	subjectCreatedate;		// 과목 생성 일시
	private String	subjectUpdatedate;		// 과목 업데이트 일시
	private int		subjectTotalday;		// 과목 총이수일
	private String	subjectInfo;			// 과목 정보
}
