package gd.fintech.lms.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ReportSubmitForm {
	private int		reportSubmitNo;						// 과제 제출 고유번호
	private int		reportNo;							// 과제 고유번호
	private String	accountId;							// 계정 아이디 (학생)
	private String	reportSubmitWriter;					// 작성자 이름 (학생)
	private String	reportSubmitTitle;					// 과제 제출 제목
	private String	reportSubmitContent;				// 과제 제출 내용
	private int		reportSubmitPoint;					// 과제 제출 점수
	private String	reportSubmitFeedback;				// 과제 제출 피드백
	private String	reportSubmitCreatedate;				// 과제 제출 생성 일시 (학생 과제 제출일)
	private String	reportSubmitUpdatedate;				// 과제 제출 업데이트 일시
	private List<MultipartFile> reportSubmitFileList;  // 과제 제출 파일 

}
