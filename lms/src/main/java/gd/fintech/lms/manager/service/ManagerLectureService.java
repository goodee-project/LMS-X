package gd.fintech.lms.manager.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gd.fintech.lms.manager.mapper.ManagerLectureMapper;
import gd.fintech.lms.vo.ClassRegistration;
import gd.fintech.lms.vo.Lecture;
import gd.fintech.lms.vo.LectureAndClassAndTextbook;

@Service
public class ManagerLectureService {
	@Autowired private ManagerLectureMapper managerLectureMapper;
	
	//현재 추가 되어 있는 강의 목록 출력
	public List<Lecture> getLectureListByPage(Map<String, Object> map){
		return managerLectureMapper.selectLectureListByPage(map);
	}
	//현재 추가되어 있는 강의 개수
	public int getCountLecture(int rowPerPage) {
		return managerLectureMapper.selectLectureCount();
	}
	//새로운 강의 개설
	public int insertLecture(Lecture lecture) {
		return managerLectureMapper.insertLecture(lecture);
	}
	// 강의 상세보기
	public LectureAndClassAndTextbook getLectureOne(int lectureNo) {
		LectureAndClassAndTextbook lectureAndClassAndTextbook = managerLectureMapper.selectLectureOne(lectureNo);
		return lectureAndClassAndTextbook;
	}
	// 강의 수정
	public void updateLecture(Lecture lecture) {
		managerLectureMapper.updateLecture(lecture);
	}
	// 강의 상태 변경
	public void updateLectureStat(Lecture lecture) {
		managerLectureMapper.updateLectureStat(lecture);
	}

	// 강의의 수강 학생 목록
	public List<ClassRegistration> selectClassRegistrationList(int lectureNo){
		return managerLectureMapper.selectClassRegistrationList(lectureNo);
	}
	// 강의의 대기중인 수강 학생 목록
	public List<ClassRegistration> selectClassRegistrationListByState(int lectureNo){
		return managerLectureMapper.selectClassRegistrationListByState(lectureNo);
	}
	// 강의의 수강 학생 목록 개수
	public int selectClassRegistrationListCount(int lectureNo) {
		return managerLectureMapper.selectClassRegistrationListCount(lectureNo);
	}
	// 강의의 대기중인 수강 학생 목록 개수
	public int selectClassRegistrationListByStateCount(int lectureNo) {
		return managerLectureMapper.selectClassRegistrationListByStateCount(lectureNo);
	}
}
