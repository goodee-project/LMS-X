package gd.fintech.lms.vo;

import lombok.Data;

// 자주 묻는 질문(FAQ) Vo

@Data
public class Faq {
	private int		faqNo;			// FAQ 고유번호
	private String	accountId;		// 계정 아이디 (운영자)
	private String	faqWriter;		// 작성자 이름 (운영자)
	private String	faqTitle;		// FAQ 제목
	private String	faqContent;		// FAQ 내용
	private String	faqCreatedate;	// FAQ 정보 생성 일시
	private String	faqUpdatedate;	// FAQ 정보 업데이트 일시
	private int		faqCount;		// FAQ 조회수
	private String	faqCategory;	// FAQ 카테고리
}
