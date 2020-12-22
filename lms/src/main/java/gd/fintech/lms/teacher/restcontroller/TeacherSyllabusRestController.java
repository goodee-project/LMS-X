package gd.fintech.lms.teacher.restcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import gd.fintech.lms.teacher.restservice.TeacherSyllabusRestService;

@RestController
public class TeacherSyllabusRestController {
	@Autowired TeacherSyllabusRestService teacherSyllabusRestService;
	
	// 강의 계획서 첨부파일 다운로드 횟수 증가
	@PostMapping("/auth/teacher/lecture/{lectureNo}/syllabus/syllabusSubmitFileCount/{uuid}")
	public int syllabusCount(@PathVariable(value = "lectureNo") int lectureNo,	// 강좌 고유번호
			@PathVariable(value = "uuid") String uuid) {						// 첨부파일 UUID
		return teacherSyllabusRestService.updateTeacherSyllabusCountUp(uuid);
	}
}
