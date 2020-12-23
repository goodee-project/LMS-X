package gd.fintech.lms.student.restcontroller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import gd.fintech.lms.student.restservice.StudentNoteRestService;

@RestController
public class StudentNoteRestController {
	@Autowired StudentNoteRestService studentNoteRestService;
	
	// 검색으로 계정 목록 가져오기
	@GetMapping("auth/student/note/accountList/{searchAccount}")
	public List<Map<String, Object>> accountList(@PathVariable(name="searchAccount") String searchAccount){
		return studentNoteRestService.selectAccountList(searchAccount);
	}
}
