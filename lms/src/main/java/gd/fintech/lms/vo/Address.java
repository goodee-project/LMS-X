package gd.fintech.lms.vo;

import lombok.Data;

// 주소 Vo

@Data
public class Address {
	private int		id;			// 주소 고유번호
	private String	zipCode;	// 우편번호
	private	String	province;	// 시도
	private String	city;		// 시군구
	private String	town;		// 읍면
	private String	street;		// 도로명
	private String	building1;	// 건물번호 본번
	private String	building2;	// 건물번호 부번
}
