package gd.fintech.lms.mapper;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Account;

@Mapper
public interface LoginMapper {
	//로그인 아이디 있는지 체크 
	public Account selectLoginCheck(Account account);
}
