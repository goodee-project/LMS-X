package gd.fintech.lms.admin.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Account;
import gd.fintech.lms.vo.Manager;
import gd.fintech.lms.vo.ManagerQueue;

@Mapper
public interface AdminManagerMapper {
	// 운영자 승인 대기 목록
	public List<ManagerQueue> selectManagerQueueList(); 
	
	// 운영자 승인 거절
	public int deleteManagerQueue(String managerId);
	public int deleteAccount(String accountId);
	
	// 운영자 승인
	// 운영자 상태 업데이트
	public int updateAccountState(Account account);
	// 운영자 승인대기 정보 검색
	public Manager selectManagerQueueOne(String accountId);
	// 운영자 테이블 추가
	public int insertManager(Manager manager);
}
