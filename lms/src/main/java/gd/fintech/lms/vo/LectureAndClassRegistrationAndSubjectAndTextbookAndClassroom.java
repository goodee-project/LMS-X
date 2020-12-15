package gd.fintech.lms.vo;

import lombok.Data;

@Data
public class LectureAndClassRegistrationAndSubjectAndTextbookAndClassroom {
	public Lecture lecture;
	public ClassRegistration classRegistration;
	public Subject subject;
	public Textbook textbook;
	public Classroom classroom;
}
