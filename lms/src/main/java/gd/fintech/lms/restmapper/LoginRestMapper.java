package gd.fintech.lms.restmapper;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Account;

@Mapper
public interface LoginRestMapper {
	//로그인 상태 체크
	public String selectAccountState(Account account);
}
