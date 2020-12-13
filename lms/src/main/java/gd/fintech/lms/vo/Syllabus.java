package gd.fintech.lms.vo;

import lombok.Data;

// 강의 계획서 Vo

@Data
public class Syllabus {
	private int		syllabusNo;				// 강의 계획서 고유번호
	private int		lectureNo;				// 강좌 고유번호
	private String	syllabusContent;		// 강의 계획서 내용
	private String	syllabusTeachersign;	// 강의 계획서 강사 서명
	private String	syllabusManagersign;	// 강의 계획서 운영자 서명
	private String	syllabusCreatedate;		// 강의 계획서 생성 일시
	private String	syllabusUpdatedate;		// 강의 계획서 업데이트 일시
}
