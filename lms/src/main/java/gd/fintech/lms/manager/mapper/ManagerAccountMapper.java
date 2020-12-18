package gd.fintech.lms.manager.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Account;

@Mapper
public interface ManagerAccountMapper {
	public List<Account> selectAccountList();		 // 강사 계정 ID 리스트
	public List<Account> selectFaqAccountList();	 // 운영자 계장 ID 관련 계정 ID출력
	public List<Account> selectManagerAccountList(); // 운영자 계정 ID 리스트
	int updateAccount(Account account);				 // 학생/강사 계정 수정(계정 활성화 여부) 
	Account selectAccountOne(String accountId); 	 // 계정 상세정보
}
