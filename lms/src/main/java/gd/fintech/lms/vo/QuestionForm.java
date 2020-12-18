package gd.fintech.lms.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class QuestionForm {
	private int		questionNo;						// 질문 고유번호
	private int		lectureNo;						// 강좌 고유번호
	private String	accountId;						// 계정 아이디 (학생)
	private String	questionWriter;					// 작성자 이름 (학생)
	private String	questionTitle;					// 질문 제목
	private String	questionContent;				// 질문 내용
	private String	questionCreatedate;				// 질문 생성 일시
	private String	questionUpdatedate;				// 질문 업데이트 일시
	private int		questionCount;					// 질문 조회수
	private String	questionPassword;				// 질문 비밀번호 (비밀글 설정시 필요)
	private List<MultipartFile> questionFile;		// MultipartFile 클래스를 사용한 File 업로드
													// 업로드한 File을 핸들러에서 손쉽게 다룰 수 있도록 도와주는 Handler의 매개변수 중 하나
}
