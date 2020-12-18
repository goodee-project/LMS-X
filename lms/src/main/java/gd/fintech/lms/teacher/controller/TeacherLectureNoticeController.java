package gd.fintech.lms.teacher.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import gd.fintech.lms.teacher.service.TeacherLectureNoticeService;
import gd.fintech.lms.vo.LectureNotice;

@Controller
public class TeacherLectureNoticeController {
	@Autowired TeacherLectureNoticeService teacherLectureNoticeService;
	
	//Logger 사용
	private final Logger logger = LoggerFactory.getLogger(getClass());
	
	// 강 강좌별 공지사항 리스트 페이지
	@GetMapping(value ="/auth/teacher/lecture/{lectureNo}/notice/noticeList/{currentPage}")
	public String noticeList(Model model,
			@PathVariable(value = "lectureNo") int lectureNo,
			@PathVariable(value = "currentPage") int currentPage){
		
		// 한 페이지에 출력할 개수
		int rowPerPage = 10; 
		// 시작 페이지 계산
		int beginRow = (currentPage - 1) * rowPerPage;
		
		//강좌별 공지사항 리스트
		List<LectureNotice> teacherLectureNoticeList = teacherLectureNoticeService.getTeacherNoticeListByPage(lectureNo, beginRow, rowPerPage);
		//페이징 코드
		//현재 페이지 수
		int totalCount = teacherLectureNoticeService.getCountTeacherLectureNotice(lectureNo);
		// 마지막 페이지
		int lastPage = totalCount / rowPerPage;
		
		// 10 미만의 개수의 데이터가 있는 페이지 표시
		if (totalCount % rowPerPage != 0) {
			lastPage += 1;
		}
		// 전체 페이지가 0개이면 현재 페이지도 0으로 표시
		if (lastPage == 0) {
			currentPage = 0;
		}
		// 네비게시연에 표시할 페이지 수
		int navPerPage = 10;
		
		// 네비게이션 첫 번째 페이지
		int navFirstPage = currentPage - (currentPage % navPerPage) + 1;
		
		// 네비게이션 마지막 페이지
		int navLastPage = navFirstPage + navPerPage - 1;
		
		// 10으로 나누어 떨어지는 경우 처리하는 코드
		if (currentPage % navPerPage == 0 && currentPage != 0) {
			navFirstPage = navFirstPage - navPerPage;
			navLastPage = navLastPage - navPerPage;
		}
		
		// 현재 페이지에 대한 이전 페이지
		int prePage;
		if (currentPage > 10) {
			prePage = currentPage - (currentPage % navPerPage) + 1 - 10;
		} else {
			prePage = 1;
		}
		// 현재 페이지에 대한 다음 페이지
		int nextPage = currentPage - (currentPage % navPerPage) + 1 + 10;
		if (nextPage > lastPage) {
			nextPage = lastPage;
		}
		//model을 통해 View에 다음과 같은 정보들을 보내온다.
		model.addAttribute("teacherLectureNoticeList",teacherLectureNoticeList);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);
		
		model.addAttribute("navPerPage", navPerPage);
		model.addAttribute("navFirstPage", navFirstPage);
		model.addAttribute("navLastPage", navLastPage);
		
		model.addAttribute("prePage", prePage);
		model.addAttribute("nextPage", nextPage);
		
		return "auth/teacher/lecture/notice/noticeList";
	}
	@RequestMapping(value ="/auth/teacher/lecture/{lectureNo}/notice/noticeOne/{lectureNoticeNo}")
	public String noticeOne(Model model,
			@PathVariable(value="lectureNo") int lectureNo,
			@PathVariable(value="lectureNoticeNo") int lectureNoticeNo) {
		teacherLectureNoticeService.updateTeacherLectureNoticeCountUp(lectureNoticeNo);
		LectureNotice lectureNotice = teacherLectureNoticeService.getTeacherNoticeOne(lectureNoticeNo);
		System.out.println("-------------------------------상세보기 확인" + lectureNotice);
		//model을 통해 View에 다음과 같은 정보를 보내온다.
		model.addAttribute("lectureNotice", lectureNotice);
		
		return "auth/teacher/lecture/notice/noticeOne";
	}
	//강좌별 공지사항 작성 폼
	@GetMapping("/auth/teacher/lecture/{lectureNo}/notice/insertNotice")
	public String insertNotice(Model model, @PathVariable(value = "lectureNo")int lectureNo) {
		
		return "auth/teacher/lecture/notice/insertNotice";
	}
	//강좌별 공지사항 작성 액션
	@PostMapping("/auth/teacher/lecture/{lectureNo}/notice/insertNotice")
	public String insertNotice(LectureNotice lectureNotice) {
		teacherLectureNoticeService.insertTeacherLectureNotice(lectureNotice);
		return "redirect:/auth/teacher/lecture/" + lectureNotice.getLectureNo() + "/notice/noticeList/1";
	}
}
