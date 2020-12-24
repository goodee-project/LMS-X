package gd.fintech.lms.manager.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.LectureArchive;

@Mapper
public interface ManagerLectureArchiveMapper {
	// 자료실 파일 목록
	public List<LectureArchive> selectLectureArchiveListByPage(Map<String, Object> map);
	
	// 자료실 카운트
	public int selectLectureArchiveListCount(int lectureNo);
	
	// 자료실 상세보기
	public LectureArchive selectLectureArchiveOne(int lectureArchiveNo);
	
	// 자료실 조회수
	int updateLectureArchiveCount(int lectureArchiveNo);
	
	// 자료 삭제
	int deleteManagerLectureArchive(int archiveNo);
}
