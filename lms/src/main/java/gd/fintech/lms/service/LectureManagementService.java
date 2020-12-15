package gd.fintech.lms.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gd.fintech.lms.mapper.LectureManagementMapper;
import gd.fintech.lms.vo.Lecture;

@Service
public class LectureManagementService {
	@Autowired private LectureManagementMapper lectureManagementMapper;
	
	//현재 추가 되어 있는 강의 목록 출력
	public List<Lecture> getLectureListByPage(Map<String, Object> map){
		return lectureManagementMapper.selectLectureListByPage(map);
	}
	//현재 추가되어 있는 강의 개수
	public int getCountLecture(int rowPerPage) {
		int endPage = lectureManagementMapper.selectLectureCount();
		
		if(endPage % rowPerPage == 0) {
			return endPage / rowPerPage;
		} else {
			return endPage / rowPerPage + 1;			
		}
	}
}
