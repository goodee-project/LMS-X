package gd.fintech.lms.manager.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.manager.mapper.ManagerLmsNoticeMapper;
import gd.fintech.lms.vo.LmsNotice;

@Service
@Transactional
public class ManagerLmsNoticeService {
	@Autowired private ManagerLmsNoticeMapper managerLmsNoticeMapper;
	
	// 공지사항 목록 출력
	public List<LmsNotice> getLmsNoticeList(int beginRow, int rowPerPage){
	
	Map<String,Object> map = new HashMap<String, Object>();
	map.put("beginRow", beginRow);
	map.put("rowPerPage", rowPerPage);
	
	return managerLmsNoticeMapper.selectLmsNoticeList(map);
	}
	
	// 공지사항 총 개수
	public int getLmsNoticeListCount() {
		
		return managerLmsNoticeMapper.selectLmsNoticeListCount();
	}
	
	// 공지사항 조회수 증가
	public int updateLmsNoticeOneCount(int lmsNoticeNo) {
		
		LmsNotice lmsNotice = managerLmsNoticeMapper.selectLmsNoticeOne(lmsNoticeNo);
		
		return managerLmsNoticeMapper.updateLmsNoticeOneCount(lmsNotice);
	}
	// 공지사항 상세보기
	public LmsNotice getLmsNoitceOne(int lmsNoticeNo) {
		
		return managerLmsNoticeMapper.selectLmsNoticeOne(lmsNoticeNo);
	}
	// 공지사항 수정
	public int updateLmsNoticeOne(LmsNotice lmsNotice) {
		
		return managerLmsNoticeMapper.updateLmsNoticeOne(lmsNotice);
	}
}
