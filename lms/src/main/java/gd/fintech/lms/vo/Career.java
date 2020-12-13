package gd.fintech.lms.vo;

import lombok.Data;

// 경력 Vo
// 강사, 운영자의 경력 정보를 기록한다.
// 계정에 대한 개인정보를 조회 및 수정시 사용된다.

@Data
public class Career {
	private int		careerNo;			// 경력 고유번호
	private String	accountId;			// 계정 아이디 (강사, 운영자)
	private String	careerContent;		// 경력 정보
	private String	careerStartdate;	// 경력 시작일
	private String	careerEnddate;		// 경력 종료일
}
