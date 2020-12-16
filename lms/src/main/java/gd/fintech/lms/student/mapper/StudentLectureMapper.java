package gd.fintech.lms.student.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.ClassRegistration;
import gd.fintech.lms.vo.ClassRegistrationCancel;
import gd.fintech.lms.vo.Lecture;
import gd.fintech.lms.vo.LectureAndClassRegistrationAndSubject;
import gd.fintech.lms.vo.LectureAndClassRegistrationAndSubjectAndTextbookAndClassroom;

@Mapper
public interface StudentLectureMapper {
	// 학생 : 자신이 수강중인 강좌 목록
	public List<LectureAndClassRegistrationAndSubject> selectStudentClassListByPage(Map<String, Object> map);
	// 학생 : 자신이 수강중인 강좌의 개수
	public int selectStudentClassListCount(String studentId);
	
	// 자신이 수강중인 강좌 상세보기
	public LectureAndClassRegistrationAndSubjectAndTextbookAndClassroom selectStudentClassOne(Map<String, Object> map);
	// 수강중인 강좌의 후기를 수정
	public int updateStudentClassReview(ClassRegistration classRegistration);
	
	// 수강 신청 가능한 강좌 목록
	public List<Lecture> selectStudentLectureListByPage(Map<String, Object> map);
	// 수강 신청 가능한 강좌 개수
	public int selectStudentLectureListCount();
	// 수강 신청
	public int insertClassRegistration(ClassRegistration classRegistration);
	
	
	// 수강 신청 테이블 - 수강 신청 상태를 취소로 변경
	public int updateClassRegistrationState(int classRegistrationNo);
	// 수강 신청 취소 테이블 - 수강 신청 취소 내용 입력
	public int insertClassRegistrationCancel(ClassRegistrationCancel classRegistrationCancel);
}
