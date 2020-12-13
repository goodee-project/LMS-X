package gd.fintech.lms.vo;

import lombok.Data;

// 운영자 Vo

@Data
public class Manager {
	private String	managerId;				// 운영자 아이디
	private String	managerEmail;			// 운영자 이메일
	private String	managerPhone;			// 운영자 연락처
	private String	managerName;			// 운영자 이름
	private String	managerGender;			// 운영자 성별 (남, 여)
	private String	managerBirth;			// 운영자 생년월일
	private String	managerPosition;		// 운영자 직책
	private String	managerAddressMain;		// 운영자 1차 주소
	private String	managerAddressSub;		// 운영자 2차 주소
	private String	managerImage;			// 운영자 프로필 사진
	private String	managerAccessdate;		// 운영자 계정 활성화 일시
	private String	managerUpdatedate;		// 운영자 계정 업데이트 일시
}
