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
	
	// Logger 사용
	private final Logger logger = LoggerFactory.getLogger(getClass());
	
	// 강좌 공지사항 목록
	@GetMapping(value ="/auth/teacher/lecture/{lectureNo}/notice/noticeList/{currentPage}")
	public String noticeList(Model model,
			@PathVariable(value = "lectureNo") int lectureNo,			// 강좌 고유번호
			@PathVariable(value = "currentPage") int currentPage){		// 현재 페이지
		// 한 페이지에 출력할 개수
		int rowPerPage = 10; 
		
		// 시작 페이지 계산
		int beginRow = (currentPage - 1) * rowPerPage;
		
		// 강좌 공지사항 목록
		List<LectureNotice> teacherLectureNoticeList = teacherLectureNoticeService.getTeacherNoticeListByPage(lectureNo, beginRow, rowPerPage);
		
		// 페이징 코드
		// 현재 페이지 수
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
		// 내비게이션에 표시할 페이지 수
		int navPerPage = 10;
		
		// 내비게이션 첫 번째 페이지
		int navFirstPage = currentPage - (currentPage % navPerPage) + 1;
		
		// 내비게이션 마지막 페이지
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
		
		// model을 통해 View에 다음과 같은 정보들을 보내준다.
		model.addAttribute("teacherLectureNoticeList",teacherLectureNoticeList);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);
		
		model.addAttribute("navPerPage", navPerPage);
		model.addAttribute("navFirstPage", navFirstPage);
		model.addAttribute("navLastPage", navLastPage);
		
		model.addAttribute("prePage", prePage);
		model.addAttribute("nextPage", nextPage);
		
		// [View] /auth/teacher/lecture/notice/noticeList.jsp
		return "/auth/teacher/lecture/notice/noticeList";
	}
	
	// 강좌 공지사항 조회
	@RequestMapping(value ="/auth/teacher/lecture/{lectureNo}/notice/noticeOne/{lectureNoticeNo}")
	public String noticeOne(Model model,
			@PathVariable(value="lectureNo") int lectureNo,					// 강좌 고유번호
			@PathVariable(value="lectureNoticeNo") int lectureNoticeNo) {	// 강좌 공지사항 고유번호
		// 강좌 공지사항 조회수 +1
		teacherLectureNoticeService.updateTeacherLectureNoticeCountUp(lectureNoticeNo);
		
		// 강좌 공지사항 내용
		LectureNotice lectureNotice = teacherLectureNoticeService.getTeacherNoticeOne(lectureNoticeNo);
		
		// [Logger] 강좌 공지사항(lectureNotice)
		logger.trace("lectureNotice[" + lectureNotice + "]");
		
		// model을 통해 View에 다음과 같은 정보를 보내준다.
		model.addAttribute("lectureNotice", lectureNotice);
		
		// [View] /auth/teacher/lecture/notice/noticeOne.jsp
		return "/auth/teacher/lecture/notice/noticeOne";
	}
	
	// 강좌 공지사항 작성 Form
	@GetMapping("/auth/teacher/lecture/{lectureNo}/notice/insertNotice")
	public String insertNotice(Model model, @PathVariable(value = "lectureNo")int lectureNo) {
		// [View] /auth/teacher/lecture/notice/insertNotice.jsp
		return "/auth/teacher/lecture/notice/insertNotice";
	}
	
	// 강좌 공지사항 작성 Action
	@PostMapping("/auth/teacher/lecture/{lectureNo}/notice/insertNotice")
	public String insertNotice(LectureNotice lectureNotice) {
		teacherLectureNoticeService.insertTeacherLectureNotice(lectureNotice);
		
		// [Redirect] 강좌 공지사항 입력 후 강좌 공지사항 목록 1페이지로 이동
		return "redirect:/auth/teacher/lecture/" + lectureNotice.getLectureNo() + "/notice/noticeList/1";
	}
	
	// 강좌 공지사항 수정 Form
	@GetMapping("/auth/teacher/lecture/{lectureNo}/notice/updateNotice/{lectureNoticeNo}")
	public String updateNotice(Model model, @PathVariable(value = "lectureNo")int lectureNo,
			@PathVariable(value = "lectureNoticeNo") int lectureNoticeNo) {
		LectureNotice lectureNotice = teacherLectureNoticeService.getTeacherNoticeOne(lectureNoticeNo);
		
		// [Logger] 강좌 공지사항(lectureNotice)
		logger.trace("lectureNotice :" + lectureNotice);
		
		// model을 통해 View에 다음과 같은 정보들을 보내준다
		model.addAttribute("lectureNotice", lectureNotice);
		
		// [View] /auth/teacher/lecture/notice/updateNotice.jsp
		return "/auth/teacher/lecture/notice/updateNotice";
	}
	
	// 강좌 공지사항 수정 Action
	@PostMapping("/auth/teacher/lecture/{lectureNo}/notice/updateNotice/{lectureNoticeNo}")
	public String updateNotice(LectureNotice lectureNotice) {
		// [Logger] 강좌 공지사항(lectureNotice)
		logger.trace("lectureNotice[" + lectureNotice + "]");
		
		teacherLectureNoticeService.updateTeacherLectureNotice(lectureNotice);
		
		// [Redirect] 게시글 수정 후 강좌 공지사항 고유번호에 해당하는 게시글로 이동
		return "redirect:/auth/teacher/lecture/" + lectureNotice.getLectureNo() + "/notice/noticeOne/" + lectureNotice.getLectureNoticeNo();
	}
	
	// 강좌 공지사항 삭제
	@GetMapping("/auth/teacher/lecture/{lectureNo}/notice/deleteNotice/{lectureNoticeNo}")
	public String deleteNotice(@PathVariable(value="lectureNo") int lectureNo,
			@PathVariable(value="lectureNoticeNo") int lectureNoticeNo) {
		teacherLectureNoticeService.deleteTeacherLectureNotice(lectureNoticeNo);
		
		// [Redirect] 강좌 공지사항 목록 1페이지로 이동
		return "redirect:/auth/teacher/lecture/{lectureNo}/notice/noticeList/1";
	}
}
