package gd.fintech.lms.teacher.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.teacher.mapper.TeacherFaqMapper;
import gd.fintech.lms.vo.Faq;

@Service
@Transactional
public class TeacherFaqService {
	@Autowired private TeacherFaqMapper teacherFaqMapper;
	
	// Logger 사용
	private final Logger logger = LoggerFactory.getLogger(getClass());
	
	// FAQ 목록
	public List<Faq> selectTeacherFaqListByPage(int beginRow, int rowPerPage) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("beginRow", beginRow);			// 시작 데이터
		map.put("rowPerPage", rowPerPage);		// 한 페이지당 표시할 데이터 수
		
		List<Faq> faqList = teacherFaqMapper.selectTeacherFaqListByPage(map);
		
		// [Logger] FAQ 목록(faqList)
		logger.trace("faqList[" + faqList + "]");
		
		return faqList;
	}
	
	// FAQ 총 데이터 수
	public int selectTeacherFaqCount() {
		return teacherFaqMapper.selectTeacherFaqCount();
	}
	
	// FAQ 조회
	// FAQ 고유번호(faqNo)
	public Faq selectTeacherFaqOne(int faqNo) {
		Faq faq = teacherFaqMapper.selectTeacherFaqOne(faqNo);
		
		// [Logger] FAQ(faq)
		logger.trace("faq[" + faq + "]");
		
		return faq;
	}
	
	// FAQ 조회 조회수 증가
	// FAQ 고유번호(faqNo)
	public int updateTeacherFaqCountUp(int faqNo) {
		return teacherFaqMapper.updateTeacherFaqCountUp(faqNo);
	}
}
