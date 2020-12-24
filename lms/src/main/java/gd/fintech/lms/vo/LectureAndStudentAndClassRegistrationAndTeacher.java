package gd.fintech.lms.vo;

import lombok.Data;

@Data
public class LectureAndStudentAndClassRegistrationAndTeacher {

	private Student student;
	private ClassRegistration classRegistration;
	private Teacher teacher;
	private Lecture lecture;
}
