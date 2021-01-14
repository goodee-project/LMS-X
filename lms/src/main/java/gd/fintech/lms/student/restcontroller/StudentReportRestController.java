package gd.fintech.lms.student.restcontroller;

import javax.servlet.http.HttpServletRequest;

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
	public int reportSubmitFileCount(@PathVariable(name = "uuid") String uuid) {
		return studentReportRestService.updateReportSubmitFileCount(uuid);
	}
	
	// 과제 제출 첨부파일 한개 삭제
	@GetMapping("auth/student/lecture/report/deleteReportSubmitFileOne/{uuid}")
	public void deleteReportSubmitFileOne(HttpServletRequest request,
			@PathVariable(name = "uuid") String uuid) {
		studentReportRestService.deleteReportSubmitFileOne(uuid, request);
	}
	
	// 해당 과제가 제출 기간 인지
	@PostMapping("auth/student/lecture/report/checkReportSubmitDate/{reportNo}")
	public boolean checkReportSubmitDate(@PathVariable(name = "reportNo") int reportNo) {
		// 제출기간이 맞다면 true
		if(studentReportRestService.selectCheckReportSubmitDate(reportNo) > 0) {
			return true;
		}
		// 아니면 false
		return false;
	}
}
