package gd.fintech.lms.vo;

import lombok.Data;

// 과제 제출 첨부파일
// 과제 제출 게시판에서 사용되는 첨부파일 목록

@Data
public class ReportSubmitFile {
	private String	reportSubmitFileUuid;			// 과제 제출 첨부파일 UUID
	private String	reportSubmitFileOriginal;		// 과제 제출 첨부파일 원본 이름
	private int		reportSubmitNo;					// 과제 제출 고유번호
	private int		reportSubmitFileSize;			// 첨부파일 크기
	private String	reportSubmitFileType;			// 첨부파일 타입
	private int		reportSubmitFileCount;			// 첨부파일 다운로드 횟수
	private String	reportSubmitFileCreatedate;		// 첨부파일 생성 일시
}
