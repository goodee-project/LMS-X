package gd.fintech.lms.vo;

import lombok.Data;

// LMS 공지사항 Vo

@Data
public class LmsNotice {
	private int		lmsNoticeNo;			// LMS 공지사항 고유번호
	private String	accountId;				// 계정 아이디 (운영자)
	private String	lmsNoticeWriter;		// 작성자 이름 (운영자)
	private String	lmsNoticeTitle;			// LMS 공지사항 제목
	private String	lmsNoticeContent;		// LMS 공지사항 내용
	private String	lmsNoticeCreatedate;	// LMS 공지사항 정보 생성 일시
	private String	lmsNoticeUpdatedate;	// LMS 공지사항 정보 업데이트 일시
	private int		lmsNoticeCount;			// LMS 공지사항 조회수
}
