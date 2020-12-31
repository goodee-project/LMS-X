package gd.fintech.lms.manager.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.LoginLog;

@Mapper
public interface ManagerLoginLogMapper {

	// 로그인 로그 목록
	public List<LoginLog> selectLoginLogList(Map<String,Object> map);
	
	// 로그인 로그 목록 페이징 카운트
	// 로그인 계정 (accountId), 로그인 날짜(loginLogDate)
	public int selectLoginLogCount(Map<String, Object> map);
}
