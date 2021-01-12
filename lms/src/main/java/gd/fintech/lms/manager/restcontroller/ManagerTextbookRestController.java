package gd.fintech.lms.manager.restcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import gd.fintech.lms.manager.restservice.ManagerTextbookRestService;

@RestController
public class ManagerTextbookRestController {
	@Autowired private ManagerTextbookRestService managerTextbookRestService;
	
	@GetMapping("/auth/manager/textbook/textbookCheck/{textbookIsbn}")
	public String selectTextbookCheck(@PathVariable(name="textbookIsbn")String textbookIsbn) {
		return managerTextbookRestService.selectManagerTextbookCheck(textbookIsbn);
	}
}
