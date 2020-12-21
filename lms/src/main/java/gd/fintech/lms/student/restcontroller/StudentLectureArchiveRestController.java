package gd.fintech.lms.student.restcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import gd.fintech.lms.student.restservice.StudentLectureArchiveRestService;

@RestController
public class StudentLectureArchiveRestController {
	@Autowired StudentLectureArchiveRestService studentLectureArchiveRestService;
	// 강좌 자료실 첨부파일 다운 횟수 증가
	@PostMapping("auth/student/lecture/archive/archiveFileCount/{uuid}")
	public int archiveFileCount(@PathVariable(name="uuid") String uuid) {	
		return studentLectureArchiveRestService.updateLectureArchiveFileCount(uuid);
	}
}
