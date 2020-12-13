package gd.fintech.lms.vo;

import lombok.Data;

// 학력 Vo
// 학생, 강사, 운영자의 학력 정보를 기록한다.
// 계정에 대한 개인정보를 조회 및 수정시 사용된다.

@Data
public class Education {
	private int		educationNo;			// 학력 고유번호
	private String	accountId;				// 계정 아이디 (학생, 강사, 운영자)
	private String	educationSchool;		// 출신 학교
	private String	educationMajor;			// 전공
	private String	educationStartdate;		// 입학일
	private String	educationEndDate;		// 졸업일
}
