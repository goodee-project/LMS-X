package gd.fintech.lms.teacher.restcontroller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import gd.fintech.lms.teacher.restservice.TeacherNoteRestService;

@RestController
public class TeacherNoteRestController {
	@Autowired TeacherNoteRestService teacherNoteRestService;
	
	// 검색으로 계정 목록 가져오기
	@GetMapping("auth/teacher/note/accountList/{searchAccount}")
	public List<Map<String, Object>> accountList(@PathVariable(name="searchAccount") String searchAccount){
		return teacherNoteRestService.selectAccountList(searchAccount);
	}
}
