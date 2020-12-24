package gd.fintech.lms.vo;

import lombok.Data;

@Data
public class LoginLog {
	private int 	loginLogNo;			// 로그인 로그 고유 번로
	private String	accountId;			// 로그인 계정
	private String 	loginLogDate;		// 로그인 날짜
	private String 	loginLogBrowser;	// 로그인 브라우저
	private String 	loginLogIp;			// 로그인 ip
	private String 	loginLogOs;			// 로그인 운영 체제
}
