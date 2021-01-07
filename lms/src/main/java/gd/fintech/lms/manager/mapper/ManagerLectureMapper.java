package gd.fintech.lms.manager.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.ClassRegistration;
import gd.fintech.lms.vo.Lecture;
import gd.fintech.lms.vo.LectureAndClassAndTextbook;

@Mapper
public interface ManagerLectureMapper {
	// 운영자가 추가한 강의 목록
	// Lecture 객체를 리스트로 불러옴
	public List<Lecture> selectLectureListByPage(Map<String, Object> map);
	
	// 페이징 하기 위한 강의 개수
	int selectLectureCount();
	
	// 강의 추가
	// Lecture 객체에 데이터를 저장함
	int insertLecture(Lecture lecture);
	
	// 강의 상세보기
	// 강좌 고유 번호(lectureNo)을 사용
	LectureAndClassAndTextbook selectLectureOne(int lectureNo);
	
	// 강의 수정
	// Lecture 객체에 담긴 데이터를 수정 함
	int updateLecture(Lecture lecture);
	
	// 강의 상태 변경
	// Lecture 객체에 담긴 데이터를 수정 함
	int updateLectureStat(Lecture lecture);
	
	// 강의의 수강 학생 목록
	List<ClassRegistration> selectClassRegistrationList(int lectureNo);
	// 강의의 대기중인 수강 학생 목록
	List<ClassRegistration> selectClassRegistrationListByState(int lectureNo);
	// 강의의 수강 학생 목록 개수
	int selectClassRegistrationListCount(int lectureNo);
	// 강의의 대기중인 수강 학생 목록 개수
	int selectClassRegistrationListByStateCount(int lectureNo);

	// 학생 수강 승인
	public int updateClassRegistrationState(Map<String, Object> map);
	
}
 