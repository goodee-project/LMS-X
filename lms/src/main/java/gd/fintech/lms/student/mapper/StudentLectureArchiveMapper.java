package gd.fintech.lms.student.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.LectureArchive;

@Mapper
public interface StudentLectureArchiveMapper {
	// 강의 자료실 목록
	public List<LectureArchive> selectLectureArchiveListByPage(Map<String, Object> map);
	
	// 강의 자료실 개수
	public int selectLectureArchiveListCount(int lectureNo);
	
	// 강의 자료실 상세보기
	public LectureArchive selectLectureArchiveOne(int lectureArchiveNo);
	
	// 강의 자료실 조회수 증가
	public int updateLectureArchiveCount(int lectureArchiveNo);
}
