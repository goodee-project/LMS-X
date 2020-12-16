package gd.fintech.lms.manager.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gd.fintech.lms.manager.mapper.ManagerLectureMapper;
import gd.fintech.lms.vo.Lecture;

@Service
public class ManagerLectureService {
	@Autowired private ManagerLectureMapper managerLectureMapper;
	
	//현재 추가 되어 있는 강의 목록 출력
	public List<Lecture> getLectureListByPage(Map<String, Object> map){
		return managerLectureMapper.selectLectureListByPage(map);
	}
	//현재 추가되어 있는 강의 개수
	public int getCountLecture(int rowPerPage) {
		int endPage = managerLectureMapper.selectLectureCount();
		
		if(endPage % rowPerPage == 0) {
			return endPage / rowPerPage;
		} else {
			return endPage / rowPerPage + 1;			
		}
	}
	//새로운 강의 개설
	public int insertLecture(Lecture lecture) {
		return managerLectureMapper.insertLecture(lecture);
	}
	// 강의 상세보기
	public Lecture getLectureOne(int lectureNo) {
		Lecture lecture = managerLectureMapper.selectLectureOne(lectureNo);
		return lecture;
	}
}
