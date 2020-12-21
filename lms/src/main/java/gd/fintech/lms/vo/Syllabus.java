package gd.fintech.lms.vo;

import lombok.Data;

// 강의 계획서 Vo

@Data
public class Syllabus {
	private String	syllabusFileUuid;			// 강의 계획서 첨부파일 UUID
	private String	syllabusFileOriginal;		// 강의 계획서 첨부파일 원본 이름
	private int		lectureNo;					// 강좌 고유번호 //syllabusNo -> lectureNo 수정
	private long		syllabusFileSize;			// 첨부파일 크기
	private String	syllabusFileType;			// 첨부파일 타입
	private int		syllabusFileCount;			// 첨부파일 다운로드 횟수
	private String	syllabusFileCreatedate;		// 첨부파일 생성 일시
}
