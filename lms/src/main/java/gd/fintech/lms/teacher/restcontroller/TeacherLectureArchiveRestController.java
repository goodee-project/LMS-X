package gd.fintech.lms.teacher.restcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import gd.fintech.lms.teacher.restservice.TeacherLectureArchiveRestService;

@RestController
public class TeacherLectureArchiveRestController {
	@Autowired TeacherLectureArchiveRestService teacherLectureArchiveRestService;
	
	// 강좌 자료실 첨부파일 다운로드 횟수 증가
	@PostMapping("/auth/teacher/lecture/{lectureNo}/archive/archiveSubmitFileCount/{uuid}")
	public int archiveFileCount(
			@PathVariable(name = "lectureNo") int lectureNo, 	// 강좌 고유번호
			@PathVariable(name = "uuid") String uuid) {			// 첨부파일 UUID
		return teacherLectureArchiveRestService.updateLectureArchiveFileCount(uuid);
	}	
}
