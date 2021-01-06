package gd.fintech.lms.manager.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import gd.fintech.lms.manager.service.ManagerQuestionCommentService;
import gd.fintech.lms.manager.service.ManagerQuestionService;
import gd.fintech.lms.vo.Question;
import gd.fintech.lms.vo.QuestionComment;

@Controller
public class ManagerQuestionController {
	@Autowired private ManagerQuestionService managerQuestionService;
	@Autowired private ManagerQuestionCommentService managerQuestionCommentService;
	
	// 강의에 대한 질문 게시판 목록
	@GetMapping("/auth/manager/lecture/{lectureNo}/question/questionList/{currentPage}")
	public String questionList(Model model,
			@PathVariable(name = "lectureNo") int lectureNo,		// 강좌 고유번호
			@PathVariable(name = "currentPage") int currentPage) {	// 현재 페이지
		
		// 한 페이지에 출력할 개수
		int rowPerPage = 10;
		
		// 시작 페이지 계산
		int beginRow = (currentPage - 1) * rowPerPage;
		
		// 현재 페이지 수
		int totalCount = managerQuestionService.getManagerCountQuestion(lectureNo);
		
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
		
		// 강좌 질문 게시판 목록
		List<Question> managerQuestionList = managerQuestionService.getManagerQuestionListByPage(lectureNo, beginRow, rowPerPage);
		
		// 내비게이션에 표시할 페이지 수
		int navPerPage = 10;
		
		// 내비게이션 첫 번째 페이지
		int navFirstPage = currentPage - (currentPage % navPerPage) + 1;
		
		// 내비게이션 마지막 페이지
		int navLastPage = navFirstPage + navPerPage - 1;
		
		//현재 페이지가 10으로 나누어 떨어질 때
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
		model.addAttribute("managerQuestionList",managerQuestionList);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);
		
		model.addAttribute("navPerPage", navPerPage);
		model.addAttribute("navFirstPage", navFirstPage);
		model.addAttribute("navLastPage", navLastPage);
		
		model.addAttribute("prePage", prePage);
		model.addAttribute("nextPage", nextPage);
		
		return "/auth/manager/lecture/question/questionList";
	}
	
	// 질문 삭제
	@GetMapping("/auth/manager/lecture/{lectureNo}/question/deleteQuestion/{questionNo}")
	public String deleteQuestion(
			@PathVariable(name = "lectureNo") int lectureNo,
			@PathVariable(name = "questionNo") int questionNo) {
		managerQuestionService.deleteManagerQuestion(questionNo);
		return "redirect:/auth/manager/lecture/" + lectureNo + "/question/questionList/1";
	}
	
	
	// 질문 상세 보기
	@GetMapping("/auth/manager/lecture/{lectureNo}/question/questionOne/{questionNo}/{currentPage}")
	public String questionOne(Model model,
			@PathVariable(name = "lectureNo") int lectureNo,
			@PathVariable(name = "questionNo") int questionNo,
			@PathVariable(name = "currentPage") int currentPage) {
		
		// 한 페이지에 출력할 개수
		int rowPerPage = 10;

		// 시작 페이지 계산
		int beginRow = (currentPage - 1) * rowPerPage;
		
		System.out.println("조회수증가 실행");
		// 조회수 증가
		managerQuestionService.updateManagerQuestionCountUp(questionNo);
		System.out.println("조회수증가 종료");
		
		System.out.println("질문조회 실행");
		// 질문 조회
		Question question = managerQuestionService.getManagerQuestionOne(questionNo);
		System.out.println("질문조회 종료");
		
		System.out.println("댓글목록 실행");
		// 댓글 목록
		List<QuestionComment> questionComment = managerQuestionCommentService.getManagerQuestionCommentListByPage(questionNo, beginRow, rowPerPage);
		System.out.println("댓글목록 종료");
		
		// 페이징 코드
		// 현재 페이지 수
		int totalCount = managerQuestionCommentService.getManagerCountQuestionComment(questionNo);
		System.out.println(totalCount);
		
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
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);
				
		model.addAttribute("navPerPage", navPerPage);
		model.addAttribute("navFirstPage", navFirstPage);
		model.addAttribute("navLastPage", navLastPage);
		
		model.addAttribute("prePage", prePage);
		model.addAttribute("nextPage", nextPage);
		
		model.addAttribute("question", question);
		model.addAttribute("questionComment",questionComment);
		
		return "auth/manager/lecture/question/questionOne";
	}
}
