package gd.fintech.lms.student.restcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import gd.fintech.lms.student.restservice.StudentSyllabusRestService;

@RestController
public class StudentSyllabusRestController {
	@Autowired StudentSyllabusRestService studentSyllabusRestService;
	
	// 강의 계획서 첨부파일 다운로드 횟수 증가
	@PostMapping("/auth/student/lecture/syllabus/studentSyllabusFileCount/{syllabusFileUuid}")
	public int studentSyllabusFileCount(@PathVariable(name = "syllabusFileUuid") String syllabusFileUuid) {
		return studentSyllabusRestService.updateSyllabusFileCount(syllabusFileUuid);
	}

}
