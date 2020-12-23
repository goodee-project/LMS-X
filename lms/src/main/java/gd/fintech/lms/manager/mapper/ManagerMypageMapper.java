package gd.fintech.lms.manager.mapper;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Manager;

@Mapper
public interface ManagerMypageMapper {
	// 운영자 마이페이지 정보
	public Manager selectManagerMypage(String accountId);
	
	// 운영자 마이페이지 수정
	public int updateManagerMypage(Manager manager);
	
	
}
