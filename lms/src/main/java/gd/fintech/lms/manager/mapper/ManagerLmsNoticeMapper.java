package gd.fintech.lms.manager.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.LmsNotice;

@Mapper
public interface ManagerLmsNoticeMapper {
	
	// 공지사항 목록
	public List<LmsNotice> selectLmsNoticeList(Map<String,Object> map);
	public int selectLmsNoticeListCount();
	
	// 공지사항 조회수 증가
	public int updateLmsNoticeOneCount(LmsNotice lmsNotice);
	
	// 공지사항 상세보기
	public LmsNotice selectLmsNoticeOne(int lmsNoticeNo);
	
	// 공지사항 수정
	public int updateLmsNoticeOne(LmsNotice lmsNotice);
}
