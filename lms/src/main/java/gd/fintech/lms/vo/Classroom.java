package gd.fintech.lms.vo;

import lombok.Data;

// 강의실 Vo
// 강의실에 대한 정보를 기록한다.

@Data
public class Classroom {
	private int		classroomNo;		// 강의실 고유번호
	private int		classroomNumber;	// 강의실 번호
	private int		classroomSize;		// 강의실 크기 (제곱미터 단위)
	private int		classroomTotal;		// 강의실 최대 수용인원
}
