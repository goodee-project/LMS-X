package gd.fintech.lms.teacher.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Faq;

@Mapper
public interface TeacherFaqMapper {
	// FAQ 목록
	// 시작 데이터 번호(beginRow), 페이지당 표시 데이터 수(rowPerPage), FAQ 카테고리(searchCategory), 제목 + 내용, 제목, 내용(searchOption), 문자열 검색(searchText)
	List<Faq> selectTeacherFaqListByPage(Map<String, Object> map);
	
	// FAQ 총 데이터 수
	// FAQ 카테고리(searchCategory), 제목 + 내용, 제목, 내용(searchOption), 문자열 검색(searchText)
	int selectTeacherFaqCount(Map<String, Object> map);
	
	// FAQ 조회
	// FAQ 고유번호(faqNo)
	Faq selectTeacherFaqOne(int faqNo);
	
	// FAQ 조회 조회수 증가
	// FAQ 고유번호(faqNo)
	int updateTeacherFaqCountUp(int faqNo);
}
