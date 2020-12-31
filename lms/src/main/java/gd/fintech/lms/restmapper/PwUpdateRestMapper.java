package gd.fintech.lms.restmapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PwUpdateRestMapper {
	// 비밀번호로 계정이 있는지 체크
	public String selectAccount(Map<String, Object> map);
	
	// 비밀번호 변경
	public int updateAccountPw(Map<String, Object> map);
}
