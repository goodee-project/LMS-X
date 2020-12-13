package gd.fintech.lms.vo;

import lombok.Data;

// 질문 첨부파일
// 질문게시판에서 사용되는 첨부파일 목록

@Data
public class QuestionFile {
	private String	questionFileUuid;			// 질문 첨부파일 UUID
	private String	questionFileOriginal;		// 질문 첨부파일 원본 이름
	private int		questionNo;					// 질문 고유번호
	private int		questionFileSize;			// 첨부파일 크기
	private String	questionFileType;			// 첨부파일 타입
	private int		questionFileCount;			// 첨부파일 다운로드 횟수
	private String	questionFileCreatedate;		// 첨부파일 생성 일시
}
