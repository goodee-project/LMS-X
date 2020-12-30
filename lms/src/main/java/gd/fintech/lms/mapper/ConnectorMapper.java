package gd.fintech.lms.mapper;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Account;

@Mapper
public interface ConnectorMapper {
	// 계정 id로 이름과 사진 가져오기
	Account selectAccountNameAndImage(String accountId);
}
