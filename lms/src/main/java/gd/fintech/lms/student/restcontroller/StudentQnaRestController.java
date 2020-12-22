package gd.fintech.lms.student.restcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import gd.fintech.lms.student.restservice.StudentQnaRestService;

@RestController
public class StudentQnaRestController {
	@Autowired StudentQnaRestService studentQnaRestService;
	
	// 질문 게시판 첨부파일 다운로드 횟수 증가
	@PostMapping("/auth/student/lecture/qna/studentQnaFileCount/{questionFileUuid}")
	public int studentQnaFileCount(@PathVariable(name = "questionFileUuid") String questionFileUuid) {
		return studentQnaRestService.updateQnaFileCount(questionFileUuid);
	}
	
	// 질문 게시판 첨부파일 한개 삭제
	@GetMapping("/auth/student/lecture/qna/deleteQnaFileOne/{questionFileUuid}")
	public void deleteQnaFileOne(@PathVariable(name = "questionFileUuid") String questionFileUuid) {
		studentQnaRestService.deleteStudentQnaFileOne(questionFileUuid);
	}
}
