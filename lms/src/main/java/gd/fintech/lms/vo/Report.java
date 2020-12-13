package gd.fintech.lms.vo;

import lombok.Data;

// 과제 Vo
// 강사가 출제한 과제를 기록한다.

@Data
public class Report {
	private int		reportNo;			// 과제 고유번호
	private int		lectureNo;			// 강좌 고유번호
	private String	reportTitle;		// 과제 제목
	private String	reportContent;		// 과제 내용
	private String	reportCreatedate;	// 과제 생성 일시 (과제 출제 일시)
	private String	reportUpdatedate;	// 과제 업데이트 일시
	private String	reportStartdate;	// 과제 시작일
	private String	reportEnddate;		// 과제 마감일
}
