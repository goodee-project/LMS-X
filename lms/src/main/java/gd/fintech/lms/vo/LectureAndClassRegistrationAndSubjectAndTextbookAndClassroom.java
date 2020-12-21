package gd.fintech.lms.vo;

import lombok.Data;

@Data
public class LectureAndClassRegistrationAndSubjectAndTextbookAndClassroom {
	public Lecture lecture;							// 강좌 Vo
	public ClassRegistration classRegistration;		// 수강신청 Vo
	public Subject subject;							// 과목 Vo
	public Textbook textbook;						// 교재 Vo
	public Classroom classroom;						// 강의실 Vo
}
