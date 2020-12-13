package gd.fintech.lms.vo;

import lombok.Data;

// 관리자 Vo

@Data
public class Admin {
	private String	adminId;		// 관리자 아이디
	private String	adminEmail;		// 관리자 이메일
	private String	adminPhone;		// 관리자 연락처
	private String	adminName;		// 관리자 이름
}
