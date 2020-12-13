package gd.fintech.lms.vo;

import lombok.Data;

// 강사 대기 Vo

@Data
public class TeacherQueue{
	private String	teacherId;				// 강사 아이디
	private String	teacherEmail;			// 강사 이메일
	private String	teacherPhone;			// 강사 연락처
	private String	teacherName;			// 강사 이름
	private String	teacherGender;			// 강사 성별 (남, 여)
	private String	teacherBirth;			// 강사 생년월일
	private String	teacherAddressMain;		// 강사 1차 주소
	private String	teacherAddressSub;		// 강사 2차 주소
}
