package gd.fintech.lms.manager.restcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import gd.fintech.lms.manager.restservice.ManagerLectureArchiveRestService;


@RestController
public class ManagerLectureArchiveRestController {
	@Autowired ManagerLectureArchiveRestService managerLectureArchiveRestService;
	
	// 강좌 자료실 첨부파일 다운로드 횟수 증가
	@PostMapping("/auth/manager/lecture/{lectureNo}/archive/archiveFileCount/{lectureArchiveFileUuid}")
	public int archiveFileCount(
			@PathVariable(name = "lectureNo") int lectureNo, 	// 강좌 고유번호
			@PathVariable(name = "lectureArchiveFileUuid") String lectureArchiveFileUuid) {			// 첨부파일 UUID
		return managerLectureArchiveRestService.updateLectureArchiveFileCount(lectureArchiveFileUuid);
	}
}
