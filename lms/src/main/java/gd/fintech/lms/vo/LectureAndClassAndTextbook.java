package gd.fintech.lms.vo;

import lombok.Data;

@Data
public class LectureAndClassAndTextbook {
	public Lecture lecture;			// 강좌 Vo
	public Classroom classroom;		// 강의실 Vo
	public Textbook textbook;		// 교재 Vo
}
