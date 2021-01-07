package gd.fintech.lms.manager.restcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import gd.fintech.lms.manager.restservice.ManagerLectureRestService;

@RestController
public class ManagerLectureRestController {
	@Autowired ManagerLectureRestService managerLectureRestService;
	
	// 강좌의 인원이 다 찼는지
	@GetMapping("auth/manager/lecture/{lectureNo}/isLectureTotalFull/{studentCnt}")
	public boolean isLectureTotalFull(@PathVariable(name="lectureNo") int lectureNo,
			@PathVariable(name="studentCnt") int studentCnt) {
		
		// 강좌의 최대 인원 가져오기
		int lectureTotal = managerLectureRestService.selectLectureTotal(lectureNo);
		
		// 인원이 다 찼을경우
		if(lectureTotal <= studentCnt) {
			return false;
		}
		
		// 인원이 다 안찼을 경우
		return true;
	}
}
