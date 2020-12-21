package gd.fintech.lms.admin.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Account;
import gd.fintech.lms.vo.Manager;
import gd.fintech.lms.vo.ManagerQueue;

@Mapper
public interface AdminManagerMapper {
	// 운영자 승인 대기 목록
	public List<ManagerQueue> selectManagerQueueList(Map<String,Object> map); 
	
	// 운영자 승인 대기 총 인원
	public int selectManagerQueueCount();
	
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
	
	// 운영자 상세보기
	public Manager selectManagerOne(String managerId);
	
	// 운영자 직급 수정
	public int updateManagerOnePosition(Manager manager);
	
	// 운영자 탈퇴
	// 운영자 계정 비활성화
	public int updateManagerAccount(Account account);
	// 운영자 정보 삭제
	public int deleteManagerOne(String managerId);
	// 운영자 경력 삭제
	public int deleteManagerCareer(String managerId);
	// 운영자 자격증 삭제 
	public int deleteManagerLicense(String managerId);
	

}
