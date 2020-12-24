package gd.fintech.lms.vo;

import lombok.Data;

@Data
public class MypageImage {
	private String mypageImageUuid;			// 마이페이지 이미지 UUID
	private String mypageImageOriginal;		// 마이페이지 이미지 원본 이름
	private String accountId;				// 마이페이지 계정 아이디
	private long mypageImageSize;			// 이미지 크기
	private String mypageImageType;			// 이미지 타입
	private String mypageImageCreateDate;	// 이미지 생성 일시
}
