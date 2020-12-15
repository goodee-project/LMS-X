package gd.fintech.lms.student.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import gd.fintech.lms.student.service.StudentLectureNoticeService;
import gd.fintech.lms.vo.LectureNotice;

@Controller
public class StudentLectureNoticeController {
	@Autowired private StudentLectureNoticeService studentLectureNoticeService;
	
	// 학생이 강의 공지사항 리스트를 확인
	@GetMapping("/auth/student/studentLectureNoticeList/{currentPage}")
	public String StudentLectureNoticeList(Model model,
			@PathVariable(name = "currentPage", required = true) int currentPage) {
		int rowPerPage = 20; // 한 페이지에 출력할 게시물의 개수는 20개입니다
		int endPage = studentLectureNoticeService.getCountLectureNotice(rowPerPage); // 마지막 페이지
		int beginRow = (currentPage - 1) * rowPerPage; //시작 페이지
		
		//공지사항 리스트 출력
		Map<String, Object> map = new HashMap<>();
		map.put("beginRow", beginRow);
		map.put("rowPerPage", rowPerPage);
		List<LectureNotice> studentLectureNoticeList = studentLectureNoticeService.getStudentLectureNoticeListByPage(map);
		
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("endPage", endPage);
		
		model.addAttribute("studentLectureNoticeList", studentLectureNoticeList);
		
		return "auth/student/studentLectureNoticeList/1";
	}
}
