package gd.fintech.lms.manager.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import gd.fintech.lms.manager.service.ManagerChartService;
import gd.fintech.lms.vo.Lecture;
import gd.fintech.lms.vo.Report;

@Controller
public class ManagerChartController {
	@Autowired private ManagerChartService managerChartService;
	// 통계 Index
	@GetMapping("/auth/manager/chart/chartIndex")
	public String chartIndex(Model model) {
		return "/auth/manager/chart/chartIndex";
	}
	
	// chart1
	@GetMapping("/auth/manager/chart/chart1")
	public String chart1(Model model) {
		return "/auth/manager/chart/chart1";
	}
	
	// chart2
	@GetMapping("/auth/manager/chart/chart2")
	public String chart2(Model model) {
		return "/auth/manager/chart/chart2";
	}
	
	// chart3
	@GetMapping("/auth/manager/chart/chart3")
	public String chart3(Model model) {
		List<Lecture> lectureList = managerChartService.getLecture();
		model.addAttribute("lectureList", lectureList);
		return "/auth/manager/chart/chart3";
	}
	
	// chart4
	@GetMapping("/auth/manager/chart/chart4")
	public String chart4(Model model) {
		List<Lecture> lectureList = managerChartService.getLecture();
		model.addAttribute("lectureList", lectureList);
		return "/auth/manager/chart/chart4";
	}
	
	// chart5
	@GetMapping("/auth/manager/chart/chart5")
	public String chart5(Model model) {
		return "/auth/manager/chart/chart5";
	}
	
	// chart6
	@GetMapping("/auth/manager/chart/chart6")
	public String chart6(Model model) {
		List<Lecture> lectureList = managerChartService.getLecture();
		model.addAttribute("lectureList", lectureList);
		return "/auth/manager/chart/chart6";
	}
	
	// chart7
	@GetMapping("/auth/manager/chart/chart7")
	public String chart11(Model model) {
		List<Lecture> lectureList = managerChartService.getLecture();
		model.addAttribute("lectureList", lectureList);
		return "/auth/manager/chart/chart7";
	}
	
	// chart8
	@GetMapping("/auth/manager/chart/chart8")
	public String chart8(Model model) {
		List<Lecture> lectureList = managerChartService.getLecture();
		model.addAttribute("lectureList", lectureList);
		return "/auth/manager/chart/chart8";
	}
	
	// chart9
	@GetMapping("/auth/manager/chart/chart9")
	public String chart9(Model model) {
		List<Lecture> lectureList = managerChartService.getLecture();
		model.addAttribute("lectureList", lectureList);
		return "/auth/manager/chart/chart9";
	}
	
	// chart10
	@GetMapping("/auth/manager/chart/chart10")
	public String chart10(Model model) {
		List<Lecture> lectureList = managerChartService.getLecture();
		model.addAttribute("lectureList", lectureList);
		return "/auth/manager/chart/chart10";
	}
}
