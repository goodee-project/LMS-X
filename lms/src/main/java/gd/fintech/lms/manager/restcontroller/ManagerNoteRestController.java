package gd.fintech.lms.manager.restcontroller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import gd.fintech.lms.manager.restservice.ManagerNoteRestService;

@RestController
public class ManagerNoteRestController {
	@Autowired ManagerNoteRestService managerNoteRestService;
	
	// 검색으로 계정 목록 가져오기
	@GetMapping("auth/manager/note/accountList/{searchAccount}")
	public List<Map<String, Object>> accountList(@PathVariable(value ="searchAccount") String searchAccount) {
		return managerNoteRestService.selectAccountList(searchAccount);
	}
}
