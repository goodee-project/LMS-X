package gd.fintech.lms.vo;

import lombok.Data;

// 강좌 수강취소 Vo
// 수강한 강좌를 취소한 경우(수강신청 기간에 취소한 것이 아닌 수강신청 기간 이후에 취소한 경우) 기록한다.

@Data
public class ClassRegistrationCancel {
	private int		classRegistrationNo;	// 강좌 수강정보 고유번호
	private String	cancelCreatedate;		// 강좌 수강취소 정보 생성일시
	private String	cancelContent;			// 강좌 수강취소 사유
}
