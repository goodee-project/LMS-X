package gd.fintech.lms.teacher.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import gd.fintech.lms.teacher.service.TeacherLectureNoticeService;
import gd.fintech.lms.teacher.service.TeacherLectureService;
import gd.fintech.lms.vo.Lecture;
import gd.fintech.lms.vo.LectureNotice;

@Controller
public class TeacherLectureController {
	@Autowired TeacherLectureService teacherLectureService;
	@Autowired TeacherLectureNoticeService teacherLectureNoticeService;
	
	// Logger 사용
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// 각 강좌별 Index 페이지
	@GetMapping(value="/auth/teacher/lecture/{lectureNo}")
	public String lectureIndex(Model model, 
			@PathVariable(value = "lectureNo") int lectureNo) {
		// 강좌 정보 (강좌 고유번호인 lectureNo를 통해 데이터베이스에서 정보를 가져온다)
		Lecture lecture = teacherLectureService.getTeacherLectureOne(lectureNo);
		
		// [Logger] 강좌 정보(lecture) 확인
		logger.trace("lecture[" + lecture + "]");
		
		// 강좌 공지사항 (해당 강좌에 해당하는 최근 5개의 공지사항을 가져온다)
		List<LectureNotice> lectureNoticeList = teacherLectureNoticeService.getLatestTeacherNoticeList(lectureNo);
		
		// [Logger] 강좌 공지사항 목록 확인
		logger.trace("lectureNoticeList - " + lectureNoticeList);
		
		// model을 통해 View에 다음과 같은 정보들을 보내준다
		model.addAttribute("lecture", lecture);
		model.addAttribute("lectureNoticeList", lectureNoticeList);
		
		// view의 /auth/teacher/lecture/lectureIndex.jsp를 이용한다
		return "/auth/teacher/lecture/lectureIndex";
	}
}