package gd.fintech.lms.vo;

import lombok.Data;

@Data
public class LectureAndStudentAndClassRegistration {

	private Student student;
	private ClassRegistration classRegistration;
	private Lecture lecture;
	private Teacher teacher;
}
