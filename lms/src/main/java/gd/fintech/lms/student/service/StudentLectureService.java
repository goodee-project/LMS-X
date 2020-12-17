package gd.fintech.lms.student.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gd.fintech.lms.student.mapper.StudentLectureMapper;
import gd.fintech.lms.vo.ClassRegistration;
import gd.fintech.lms.vo.ClassRegistrationCancel;
import gd.fintech.lms.vo.Lecture;
import gd.fintech.lms.vo.LectureAndClassRegistrationAndSubject;
import gd.fintech.lms.vo.LectureAndClassRegistrationAndSubjectAndTextbookAndClassroom;

// 학생 강좌 서비스
@Service
public class StudentLectureService {
	@Autowired StudentLectureMapper studentLectureMapper;
	
	// 학생 : 자신이 수강중인 강좌 목록
	public List<LectureAndClassRegistrationAndSubject> selectStudentClassListByPage(Map<String, Object> map){
		return studentLectureMapper.selectStudentClassListByPage(map);
	}
	// 자신이 수강중인 강좌 개수
	public int selectStudentClassListEndPage(String studentId) {
		return studentLectureMapper.selectStudentClassListCount(studentId);
	}
	
	// 자신이 수강중인 강좌 상세보기
	public LectureAndClassRegistrationAndSubjectAndTextbookAndClassroom selectStudentClassOne(Map<String, Object> map) {
		return studentLectureMapper.selectStudentClassOne(map);
	}
	
	// 수강중인 강좌의 후기(별점, 리뷰)를 수정하기
	public int updateStudentClassReview(ClassRegistration classRegistration) {
		return studentLectureMapper.updateStudentClassReview(classRegistration);
	}
	
	// 학생이 수강 신청 가능한 강좌 목록
	public List<Lecture> selectStudentLectureListByPage(Map<String, Object> map){
		return studentLectureMapper.selectStudentLectureListByPage(map);
	}
	// 학생이 수강 신청 가능한 강좌 개수
	public int selectStudentLectureListEndPage(){
		return studentLectureMapper.selectStudentLectureListCount();		
	}
	// 수강 신청
	public int insertRegistrationClass(ClassRegistration classRegistration) {
		return studentLectureMapper.insertClassRegistration(classRegistration);
	}
	
	// 수강 신청 취소
	public void updateClassRegistrationState(ClassRegistrationCancel classRegistrationCancel) {
		studentLectureMapper.updateClassRegistrationState(classRegistrationCancel.getClassRegistrationNo());
		studentLectureMapper.insertClassRegistrationCancel(classRegistrationCancel);
	}
}
