package gd.fintech.lms.manager.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Lecture;
import gd.fintech.lms.vo.LectureAndClassAndTextbook;

@Mapper
public interface ManagerLectureMapper {
	// 운영자가 추가한 강의 목록
	public List<Lecture> selectLectureListByPage(Map<String, Object> map);
	// 페이징 하기 위한 강의 개수
	int selectLectureCount();
	// 강의 추가
	int insertLecture(Lecture lecture);
	// 강의 상세보기
	LectureAndClassAndTextbook selectLectureOne(int lectureNo);
	// 강의 수정
	int updateLecture(Lecture lecture);
}
 