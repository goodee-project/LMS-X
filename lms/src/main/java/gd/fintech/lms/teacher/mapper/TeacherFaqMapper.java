package gd.fintech.lms.teacher.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Faq;

@Mapper
public interface TeacherFaqMapper {
	// FAQ 목록
	// 시작 데이터 번호(beginRow), 페이지당 표시 데이터 수(rowPerPage)
	List<Faq> selectTeacherFaqListByPage(Map<String, Integer> map);
	
	// FAQ 총 데이터 수
	int selectTeacherFaqCount();
	
	// FAQ 조회
	// FAQ 고유번호(faqNo)
	Faq selectTeacherFaqOne(int faqNo);
	
	// FAQ 조회 조회수 증가
	// FAQ 고유번호(faqNo)
	int updateTeacherFaqCountUp(int faqNo);
}
