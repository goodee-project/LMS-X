package gd.fintech.lms.vo;

import lombok.Data;

// 강좌 수강 Vo
// 학생들이 수강중인 강좌에 대한 정보를 기록한다.

@Data
public class ClassRegistration {
	private int		classRegistrationNo;			// 강좌 수강 고유번호
	private int		lectureNo;						// 강좌 고유번호
	private String	accountId;						// 계정 아이디 (학생)
	private String	classRegistrationState;			// 강좌 수강 상태 (대기, 수강중, 수료, 과락, 취소)
	private String	classregistrationPoint;			// 강좌 평점 (0, 1, 2, 3, 4, 5)
	private String	classRegistrationReview;		// 강좌 후기
	private String	classRegistrationCreatedate;	// 강좌 수강 정보 생성 일시
}
