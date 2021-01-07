package gd.fintech.lms.manager.restservice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gd.fintech.lms.manager.restmapper.ManagerLectureRestMapper;

@Service
public class ManagerLectureRestService {
	@Autowired ManagerLectureRestMapper managerLectureRestMapper;
	
	// 강좌의 최대 인원 가져오기
	public int selectLectureTotal(int lectureNo) {
		return managerLectureRestMapper.selectLectureTotal(lectureNo);
	}
	
}
