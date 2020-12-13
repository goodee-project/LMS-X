package gd.fintech.lms.vo;

import lombok.Data;

// 운영자 대기 Vo

@Data
public class ManagerQueue {
	private String	managerId;				// 운영자 아이디
	private String	managerEmail;			// 운영자 이메일
	private String	managerPhone;			// 운영자 연락처
	private String	managerName;			// 운영자 이름
	private String	managerGender;			// 운영자 성별 (남, 여)
	private String	managerBirth;			// 운영자 생년월일
	private String	managerAddressMain;		// 운영자 1차 주소
	private String	managerAddressSub;		// 운영자 2차 주소
}
