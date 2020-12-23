package gd.fintech.lms.manager.restmapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Career;

@Mapper
public interface ManagerMypageRestMapper {
	// 운영자 마이페이지 경력 정보
	public List<Career> selectManagerMypageCareer(String accountId);
	
	// 운영자 마이페이지 경력 추가
	public int insertManagerMypageCareer(Career career);
}
