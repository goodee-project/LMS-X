package gd.fintech.lms.teacher.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.LectureArchive;

@Mapper
public interface TeacherLectureArchiveMapper {
	// 강좌 고유번호(lectureNo)에 해당하는 자료실 목록을 페이징을 적용하여 출력
	// 강좌 고유번호(lectureNo), 시작 데이터 번호(beginRow), 페이지당 표시 데이터 수(rowPerPage)를 이용
	List<LectureArchive> selectTeacherLectureArchiveListByPage(Map<String, Integer> map);
	
	// 자료실 페이지 카운트
	// 강좌 고유번호(lectureNo) 사용
	int selectTeacherLectureArchiveListCount(int lectureNo);
	
	int insertTeacherLectureArchive(LectureArchive lectureArchive);
	
	List<LectureArchive> selectTeacherLectureArchiveOne(int archiveNo);
	
	int deleteTeacherLectureArchive(int archiveNo);
}
