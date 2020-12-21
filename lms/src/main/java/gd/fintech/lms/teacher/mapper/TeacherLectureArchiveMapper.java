package gd.fintech.lms.teacher.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.LectureArchive;

@Mapper
public interface TeacherLectureArchiveMapper {
	// 자료 목록
	// 강좌 고유번호(lectureNo), 시작 데이터 번호(beginRow), 페이지당 표시 데이터 수(rowPerPage)
	List<LectureArchive> selectTeacherLectureArchiveListByPage(Map<String, Integer> map);
	
	// 자료실 데이터 수 조회
	// 강좌 고유번호(lectureNo)
	int selectTeacherLectureArchiveListCount(int lectureNo);
	
	// 자료 조회
	// 자료 고유번호(archiveNo)
	List<LectureArchive> selectTeacherLectureArchiveOne(int archiveNo);
	
	// 자료 입력
	// 자료 객체(lectureArchive)
	int insertTeacherLectureArchive(LectureArchive lectureArchive);
	
	// 자료 삭제
	// 자료 고유번호(archiveNo)
	int deleteTeacherLectureArchive(int archiveNo);
}
