package gd.fintech.lms.student.restcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import gd.fintech.lms.student.restservice.StudentReportRestService;

@RestController
public class StudentReportRestController {
	@Autowired StudentReportRestService studentReportRestService;
	
	// 과제 제출 첨부파일 다운로드 횟수 증가
	@PostMapping("auth/student/lecture/report/reportSubmitFileCount/{uuid}")
	public int reportSubmitFileCount(@PathVariable(name="uuid") String uuid) {
		return studentReportRestService.updateReportSubmitFileCount(uuid);
	}
	
	// 과제 제출 첨부파일 한개 삭제
	@GetMapping("auth/student/lecture/report/deleteReportSubmitFileOne/{uuid}")
	public void deleteReportSubmitFileOne(@PathVariable(name="uuid") String uuid) {
		studentReportRestService.deleteReportSubmitFileOne(uuid);
	}
}
