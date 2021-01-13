package gd.fintech.lms.vo;

import java.util.List;

import lombok.Data;

// 강사 Vo

@Data
public class Teacher {
	private String	teacherId;				// 강사 아이디
	private String	teacherEmail;			// 강사 이메일
	private String	teacherPhone;			// 강사 연락처
	private String	teacherName;			// 강사 이름
	private String	teacherGender;			// 강사 성별 (남, 여)
	private String	teacherBirth;			// 강사 생년월일
	private String	teacherAddressMain;		// 강사 1차 주소
	private String	teacherAddressSub;		// 강사 2차 주소
	private String	teacherAccessdate;		// 강사 계정 활성화 일시
	private String	teacherUpdatedate;		// 강사 계정 업데이트 일시
	private String	managerIdAccess;		// 계정을 승인한 운영자의 아이디
	private String	teacherInfo;			// 강사 한 줄 자기소개
	private List<Career>	careerList; 	// 강사 경력 리스트
	private List<License>	licenseList;	// 강사 자격증 리스트
	private Account account;				// 계정 정보
}
