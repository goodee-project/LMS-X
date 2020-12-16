package gd.fintech.lms.vo;

import java.util.List;

import lombok.Data;

@Data
public class LectureAndClassAndTextbook {
	private int		lectureNo;			// 강좌 고유번호
	private String	accountId;			// 계정 아이디 (강사)
	private int		subjectNo;			// 과목 고유번호
	private Subject	subject;			// 과목 Vo
	private String	teacherName;		// 강사 이름
	private String	lectureName;		// 강좌 이름
	private String	textbookIsbn;		// 교재 고유번호 (ISBN)
	private String	lectureStartdate;	// 강좌 개강일
	private String	lectureEnddate;		// 강좌 종강일
	private int		lectureTotal;		// 강좌 최대 정원
	private int		classroomNo;		// 강의실 고유번호
	private String	lectureCreatedate;	// 강좌 정보 생성 일시
	private String	lectureUpdatedate;	// 강좌 정보 업데이트 일시
	private List<Textbook> textbookList; // 교재 정보 리스트
	private List<Classroom> classroomList; // 강의실 정보 리스트
}
