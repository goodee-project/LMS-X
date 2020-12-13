package gd.fintech.lms.vo;

import lombok.Data;

// 교재 Vo
// 각 강좌에서 사용되는 교재를 기록한다.

@Data
public class Textbook {
	private int		textbookIsbn;			// 교재 고유번호 (ISBN)
	private String	textbookTitle;			// 교재 이름
	private String	textbookWriter;			// 교재 저자
	private String	textbookPublisher;		// 교재 출판사
	private String	textbookPublishdate;	// 교재 출판일
	private String	textbookInfo;			// 교재 정보
	private int		textbookPrice;			// 교재 가격
}
