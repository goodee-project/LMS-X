package gd.fintech.lms.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.LectureNotice;

@Mapper
public interface StudentLectureNoticeMapper {
	
	// 학생 : 강의별 공지 사항 목록(페이징)
	List<LectureNotice> selectStudentLectureNoticeListByPage(Map<String, Object> map);
	
	// 학생 : 강의별 공지 사항 상세보기
	LectureNotice selectStudentLectureNoticeOne(int lectureNoticeNo);
	
	// 페이징(end페이지 등)을 하기 위한 공지사항 개수
	int selectLectureNoticeCount();
	
}
