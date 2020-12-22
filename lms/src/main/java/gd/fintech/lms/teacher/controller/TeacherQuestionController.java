package gd.fintech.lms.teacher.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import gd.fintech.lms.teacher.service.TeacherQuestionService;
import gd.fintech.lms.vo.Question;

@Controller
public class TeacherQuestionController {
	@Autowired TeacherQuestionService teacherQuestionService;
	
	// Logger 사용
	private final Logger logger = LoggerFactory.getLogger(getClass());
	
	// 강좌 질문 게시판 목록
	@GetMapping(value = "/auth/teacher/lecture/{lectureNo}/question/questionList/{currentPage}")
	public String qnaList(Model model,
			@PathVariable(value = "lectureNo") int lectureNo,		// 강좌 고유번호
			@PathVariable(value = "currentPage") int currentPage) {	// 현재 페이지
		
		// 한 페이지에 출력할 개수
		int rowPerPage = 10;
		
		// 시작 페이지 계산
		int beginRow = (currentPage - 1) * rowPerPage;
		
		// 강좌 질문 게시판 목록
		List<Question> teacherQuestList = teacherQuestionService.getTeacherQuestionListByPage(lectureNo, beginRow, rowPerPage);
		
		// 페이징 코드
		// 현재 페이지 수
		int totalCount = teacherQuestionService.getCountTeacherQuestion(lectureNo);
		//마지막 페이지
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
		model.addAttribute("teacherQuestList",teacherQuestList);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);
		
		model.addAttribute("navPerPage", navPerPage);
		model.addAttribute("navFirstPage", navFirstPage);
		model.addAttribute("navLastPage", navLastPage);
		
		model.addAttribute("prePage", prePage);
		model.addAttribute("nextPage", nextPage);
		
		// [View] /auth/teacher/lecture/question/qnaList.jsp
		return "/auth/teacher/lecture/question/questionList";
	}
	
	// 질문 조회
	@GetMapping("/auth/teacher/lecture/{lectureNo}/question/questionOne/{questionNo}")
	public String questionOne(Model model,
			@PathVariable(value = "lectureNo") int lectureNo,
			@PathVariable(value = "questionNo") int questionNo) {
		
		// 질문 조회수 증가
		teacherQuestionService.getCountTeacherQuestion(questionNo);
		
		// 질문 조회
		List<Question> question = teacherQuestionService.selecteTeacherQuestionOne(questionNo);
		
		// [Logger] 질문(question) 확인
		logger.trace("question[" + question + "]");
		
		model.addAttribute("question", question);
				
		// [View] /auth/teacher/lecture/question/questionOne.jsp
		return "/auth/teacher/lecture/question/questionOne";
	}
}
