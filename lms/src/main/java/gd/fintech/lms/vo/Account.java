package gd.fintech.lms.vo;

import lombok.Data;

// 계정 Vo

@Data
public class Account {
	private String	accountId;			// 계정 아이디
	private String	accountPw;			// 계정 비밀번호
	private String	accountState;		// 계정 활성화 상태 (대기, 활성화, 탈퇴)
	private int		accountLevel;		// 계정 권한 (1: 학생, 2: 강사, 3: 운영자, 4: 관리자)
	private String	accountCreatedate;	// 계정 정보 생성 일시
	private String	accountUpdatedate;	// 계정 정보 업데이트 일시
}
