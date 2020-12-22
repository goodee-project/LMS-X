package gd.fintech.lms.manager.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Account;

@Mapper
public interface ManagerAccountMapper {
	public List<Account> selectAccountList();		 // 강사 계정 ID 리스트
	public List<Account> selectFaqAccountList();	 // 운영자 계장 ID 관련 계정 ID출력
}
