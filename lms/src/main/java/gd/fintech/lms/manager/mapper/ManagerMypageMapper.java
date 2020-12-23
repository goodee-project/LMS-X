package gd.fintech.lms.manager.mapper;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Career;
import gd.fintech.lms.vo.License;
import gd.fintech.lms.vo.Manager;

@Mapper
public interface ManagerMypageMapper {
	// 운영자 마이페이지 정보
	public Manager selectManagerMypage(String accountId);
	
	// 운영자 마이페이지 수정
	public int updateManagerMypage(Manager manager);
	
	// 운영자 마이페이지 경력 추가
	public int insertManagerMypageCareer(Career career);
	
	// 경력 및 자격증 추가시 운영자 수정시간 변경
	public int updateManagerUpdatedate(String accountId);
	
	// 운영자 마이페이지 경력 삭제
	public int deleteManagerMypageCareer(int careerNo);
	
	// 운영자 마이페이지 자격증 추가
	public int insertManagerMypageLicense(License license);
	
	// 운영자 마이페이지 자격증 삭제
	public int deleteManagerMypageLicense(int licenseNo);
}
