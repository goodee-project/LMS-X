package gd.fintech.lms.vo;

import lombok.Data;

@Data
public class LectureAndClassRegistrationAndSubject {
	public Lecture lecture;							// 강좌 Vo
	public ClassRegistration classRegistration;		// 수강신청 Vo
	public Subject subject;							// 과목 Vo
}
