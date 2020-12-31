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

import gd.fintech.lms.teacher.service.TeacherLectureService;
import gd.fintech.lms.teacher.service.TeacherTestService;
import gd.fintech.lms.vo.Answersheet;
import gd.fintech.lms.vo.Lecture;
import gd.fintech.lms.vo.Multiplechoice;
import gd.fintech.lms.vo.MultiplechoiceExample;
import gd.fintech.lms.vo.MultiplechoiceForm;
import gd.fintech.lms.vo.Report;
import gd.fintech.lms.vo.Test;

@Controller
public class TeacherTestController {
	@Autowired TeacherLectureService teacherLectureService;
	@Autowired TeacherTestService teacherTestService;
	
	// Logger 사용
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// 평가 Index
	@GetMapping("/auth/teacher/lecture/{lectureNo}/test/testIndex")
	public String testIndex(Model model, 
			@PathVariable(name = "lectureNo") int lectureNo) {		// 강좌 고유번호
		
		// [View] /auth/teacher/lecture/test/testIndex.jsp
		return "/auth/teacher/lecture/test/testIndex";
	}
	
	// 시험 정보 조회
	@GetMapping("/auth/teacher/lecture/{lectureNo}/test/testOne")
	public String testOne(Model model, 
			@PathVariable(name = "lectureNo") int lectureNo) {		// 강좌 고유번호
		// 강좌 정보
		Lecture lecture = teacherLectureService.getTeacherLectureOne(lectureNo);
		
		// [Logger] 강좌 정보(lecture)
		logger.trace("lecture[" + lecture + "]");
		
		// 시험 정보
		Test test = teacherTestService.selectTestOne(lectureNo);
		
		// model을 통해 View에 다음과 같은 정보들을 보내준다
		model.addAttribute("lecture", lecture);
		model.addAttribute("test", test);
		
		// [View] /auth/teacher/lecture/test/testOne.jsp
		return "/auth/teacher/lecture/test/testOne";
	}
	
	// 시험 정보 입력 Form
	@GetMapping("/auth/teacher/lecture/{lectureNo}/test/insertTest")
	public String insertTest(
			@PathVariable(name = "lectureNo") int lectureNo) {		// 강좌 고유번호		
		// [View] /auth/teacher/lecture/test/insertTest.jsp
		return "/auth/teacher/lecture/test/insertTest";
	}
	
	// 시험 정보 입력 Action
	@PostMapping("/auth/teacher/lecture/{lectureNo}/test/insertTest")
	public String insertTest(Test test) {
		// [Logger] 평가(test)
		logger.trace("test[" + test + "]");
		
		teacherTestService.insertTest(test);
		
		return "redirect:/auth/teacher/lecture/" + test.getLectureNo() + "/test/testOne";
	}
	
	// 시험 정보 수정 Form
	@GetMapping("/auth/teacher/lecture/{lectureNo}/test/updateTest")
	public String updateTest(Model model, 
			@PathVariable(name = "lectureNo") int lectureNo) {		// 강좌 고유번호
		// 시험 정보
		Test test = teacherTestService.selectTestOne(lectureNo);
		
		// testStartdate의 String 형태를 yyyy-MM-ddThh:mm 형식으로 변환한다
		test.setTestStartdate(test.getTestStartdate().replace(" ", "T"));
		
		// testEnddate의 String 형태를 yyyy-MM-ddThh:mm 형식으로 변환한다
		test.setTestEnddate(test.getTestEnddate().replace(" ", "T"));
		
		// [Logger] 평가(test)
		logger.trace("test[" + test + "]");
		
		// model을 통해 View에 다음과 같은 정보들을 보내준다
		model.addAttribute("test", test);
		
		// [View] /auth/teacher/lecture/test/updateTest.jsp
		return "/auth/teacher/lecture/test/updateTest";
	}
	
	// 시험 정보 수정 Action
	@PostMapping("/auth/teacher/lecture/{lectureNo}/test/updateTest")
	public String updateTest(Test test) {
		// [Logger] 평가(test)
		logger.trace("test[" + test + "]");
		
		teacherTestService.updateTest(test);
		
		return "redirect:/auth/teacher/lecture/" + test.getLectureNo() + "/test/testOne";
	}
	
	// 평가 문제 목록
	@GetMapping("/auth/teacher/lecture/{lectureNo}/test/multiplechoiceList/{currentPage}")
	public String testList(Model model, 
			@PathVariable(value = "lectureNo") int lectureNo, 			// 강좌 고유번호
			@PathVariable(value = "currentPage") int currentPage) {		// 현재 페이지
		// 한 페이지에 표시할 데이터 수
				int rowPerPage = 10;
				
				// 시작 페이지 계산
				int beginRow = (currentPage - 1) * rowPerPage;
				
				List<Multiplechoice> multiplechoiceList = teacherTestService.selectMultiplechoiceList(lectureNo, beginRow, rowPerPage);
				
				// [Logger] 객관식 문제 목록(multiplechoiceList)
				logger.trace("multiplechoiceList[" + multiplechoiceList + "]");
				
				// 페이징 코드
				// 전체 데이터 수
				int totalCount = teacherTestService.selectMultiplechoiceListCount(lectureNo);
				
				// 마지막 페이지
				int lastPage = totalCount / rowPerPage;
				
				// 10 미만의 개수의 데이터가 있는 페이지를 표시
				if (totalCount % rowPerPage != 0) {
					lastPage += 1;
				}
				
				// 전체 페이지가 0개이면 현재 페이지도 0으로 표시
				if (lastPage == 0) {
					currentPage = 0;
				}
				
				// 내비게이션에 표시할 페이지 수
				int navPerPage = 10;
				
				// 내비게이션 첫번째 페이지
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
				
				// model을 통해 View에 다음과 같은 정보들을 보내준다
				model.addAttribute("multiplechoiceList", multiplechoiceList);
				
				model.addAttribute("currentPage", currentPage);
				model.addAttribute("lastPage", lastPage);
				
				model.addAttribute("navPerPage", navPerPage);
				model.addAttribute("navFirstPage", navFirstPage);
				model.addAttribute("navLastPage", navLastPage);
				
				model.addAttribute("prePage", prePage);
				model.addAttribute("nextPage", nextPage);
		
		// [View] /auth/teacher/lecture/test/multiplechoiceList.jsp
		return "/auth/teacher/lecture/test/multiplechoiceList";
	}
	
	// 평가 학생 답안지 목록
	@GetMapping("/auth/teacher/lecture/{lectureNo}/test/answersheetList")
	public String answersheetList(Model model, 
			@PathVariable(name = "lectureNo") int lectureNo) { 		// 강좌 고유번호
		
		List<Answersheet> answersheetList = teacherTestService.selectAnswersheetList(lectureNo);
		
		// model을 통해 View에 다음과 같은 정보들을 보내준다
		model.addAttribute("answersheetList", answersheetList);
		
		// [View] /auth/teacher/lecture/test/answersheetList.jsp
		return "/auth/teacher/lecture/test/answersheetList";
	}
	
	// 평가 학생 답안지 조회
	@GetMapping("/auth/teacher/lecture/{lectureNo}/test/answersheetOne/{studentId}")
	public String answersheetOne(Model model, 
			@PathVariable(name = "lectureNo") int lectureNo, 		// 강좌 고유번호
			@PathVariable(name = "studentId") String studentId) {	// 학생 아이디
		
		List<Multiplechoice> multiplechoiceList = teacherTestService.selectMultiplechoiceOne(lectureNo);
		
		// model을 통해 View에 다음과 같은 정보들을 보내준다
		model.addAttribute("multiplechoiceList", multiplechoiceList);
		
		// [View] /auth/teacher/lecture/test/answersheetOne.jsp
		return "/auth/teacher/lecture/test/answersheetOne";
	}
	
	// 객관식 문제 보기 수정 폼 
	@GetMapping("/auth/teacher/lecture/{lectureNo}/test/updateMultiplechoice/{multiplechoiceNo}")
	public String multiplechoiceExampleList(Model model,
			@PathVariable(name = "lectureNo") int lectureNo,
			@PathVariable(name = "multiplechoiceNo") int multiplechoiceNo) {
		
		Multiplechoice exampleList = teacherTestService.selectMultiplechoiceExampleList(multiplechoiceNo);
		
		model.addAttribute("exampleList", exampleList);
		
		return "/auth/teacher/lecture/test/updateMultiplechoice";
	}
	
	// 객관식 문제 보기 수정
	@PostMapping("/auth/teacher/lecture/{lectureNo}/test/updateMultiplechoice/{multiplechoiceNo}")
	public String updateMultiplechoice(MultiplechoiceForm multiplechoiceForm,
			@PathVariable(name = "lectureNo") int lectureNo,
			@PathVariable(name = "multiplechoiceNo") int multiplechoiceNo) {
		
		multiplechoiceForm.setMultiplechoiceNo(multiplechoiceNo);
		teacherTestService.updateMultiplechoiceExampleList(multiplechoiceForm);
		
		return "redirect:/auth/teacher/lecture/" + lectureNo + "/test/updateMultiplechoice/" + multiplechoiceNo;
	}
	
	// 객관식 문제 추가 폼
	@GetMapping("/auth/teacher/lecture/{lectureNo}/test/insertMultiplechoice")
	public String insertMultiplechoice(
			@PathVariable(name = "lectureNo") int lectureNo) {
		return "/auth/teacher/lecture/test/insertMultiplechoice";
	}
	
	// 객관식 문제 추가 액션
	@PostMapping("/auth/teacher/lecture/{lectureNo}/test/insertMultiplechoice")
	public String insertMultiplechoice(MultiplechoiceForm multiplechoiceForm,
			@PathVariable(name = "lectureNo") int lectureNo) {
		multiplechoiceForm.setLectureNo(lectureNo);
		teacherTestService.insertMultiplechoice(multiplechoiceForm);
		
		return "redirect:/auth/teacher/lecture/" + lectureNo + "/test/multiplechoiceList/1";
	}
	
	// 객관식 문제 삭제
	@GetMapping("/auth/teacher/lecture/{lectureNo}/test/deleteMultiplechoice/{multiplechoiceNo}")
	public String deleteMultiplechoice(
			@PathVariable(name = "lectureNo") int lectureNo,
			@PathVariable(name = "multiplechoiceNo") int multiplechoiceNo) {
		
		teacherTestService.deleteMultiplechoice(multiplechoiceNo, lectureNo);

		return "redirect:/auth/teacher/lecture/" + lectureNo + "/test/multiplechoiceList/1";
	}
}
