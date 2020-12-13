package gd.fintech.lms.vo;

import lombok.Data;

// 강좌 자료실 Vo
// 강좌별 자료실 게시판에 사용된다.

@Data
public class LectureArchive {
	private int		lectureArchiveNo;			// 강좌 자료실 고유번호
	private int		lectureNo;					// 강좌 고유번호
	private String	accountId;					// 계정 아이디 (강사)
	private String	lectureArchiveWriter;		// 작성자 이름 (강사)
	private String	lectureArchiveTitle;		// 강좌 자료실 제목
	private String	lectureArchiveContent;		// 강좌 자료실 내용
	private String	lectureArchiveCreatedate;	// 강좌 자료실 정보 생성 일시
	private String	lectureArchiveUpdatedate;	// 강좌 자료실 정보 업데이트 일시
	private int		lectureArchiveCount;		// 강좌 자료실 조회수
}
