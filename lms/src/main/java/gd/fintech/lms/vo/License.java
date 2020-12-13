package gd.fintech.lms.vo;

import lombok.Data;

// 자격증 Vo
// 강사, 운영자의 자격증 정보를 기록한다.
// 계정에 대한 개인정보를 조회 및 수정시 사용된다.

@Data
public class License {
	private int		licenseNo;			// 자격증 고유번호 (Auto Increment)
	private String	accountId;			// 계정 아이디 (강사, 운영자)
	private String	licenseNumber;		// 자격증 번호 (자격증에 부여되는 번호)
	private String	licenseName;		// 자격증 이름
	private String	licenseAgency;		// 자격증 발급기관
	private String	licenseGetdate;		// 자격증 발급일자
}
