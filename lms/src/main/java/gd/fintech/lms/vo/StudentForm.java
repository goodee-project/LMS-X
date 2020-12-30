package gd.fintech.lms.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

// 학생 Vo

@Data
public class StudentForm {
	private String	studentId;					// 학생 아이디
	private String	studentEmail;				// 학생 이메일
	private String	studentPhone;				// 학생 연락처
	private String	studentName;				// 학생 이름
	private String	studentGender;				// 학생 성별 (남, 여)
	private String	studentBirth;				// 학생 생년월일
	private String	studentAddressMain;			// 학생 1차 주소
	private String	studentAddressSub;			// 학생 2차 주소
	private MultipartFile studentImage;			// 학생 프로필 사진
	private String	studentAccessdate;			// 학생 계정 활성화 일시
	private String	studentUpdatedate;			// 학생 계정 업데이트 일시
	private String	managerIdAccess;			// 계정을 승인한 운영자의 아이디
	private List<License>	licenseList;		// 학생 자격증 리스트
}
