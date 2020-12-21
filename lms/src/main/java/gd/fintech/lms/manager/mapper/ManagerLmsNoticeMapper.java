package gd.fintech.lms.manager.mapper;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.LmsNotice;

@Mapper
public interface ManagerLmsNoticeMapper {
	
	// 공지사항 검색
	public LmsNotice selectLmsNotice();
}
