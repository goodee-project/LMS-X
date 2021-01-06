package gd.fintech.lms.manager.restcontroller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import gd.fintech.lms.manager.restservice.ManagerChartRestService;

@RestController
public class ManagerChartRestController {
	@Autowired ManagerChartRestService managerChartRestService;
	
	// 강의별 성적 평균
	@GetMapping("auth/manger/chart/avgGradeByLecture")
	public List<Map<String, Object>> AvgGradeByLecture(){
		return managerChartRestService.selectAvgGradeByLecture();
	}
	// 강의별 최대/최소 성적
	@GetMapping("auth/manger/chart/minMaxGradeByLecture")
	public List<Map<String, Object>> MinMaxGradeByLecture(){
		return managerChartRestService.selectMinMaxGradeByLecture();
	}
	// 과목별 학생 성적
	@GetMapping("auth/manger/chart/gradeBySubject/{lectureNo}")
	public List<Map<String, Object>> GradeBySubject(
			@PathVariable(name="lectureNo")int lectureNo){
		return managerChartRestService.selectGradeBySubject(lectureNo);
	}
	// 학생별 출석률
	@GetMapping("auth/manger/chart/attendanceRateByStudent/{lectureNo}")
	public List<Map<String, Object>> AttendanceRateByStudent(
			@PathVariable(name="lectureNo")int lectureNo){
		return managerChartRestService.selectAttendanceRateByStudent(lectureNo);
	}
	// 강좌별 별점 점수
	@GetMapping("auth/manger/chart/starRatingByLecture")
	public List<Map<String, Object>> StarRatingByLecture(){
		return managerChartRestService.selectStarRatingByLecture();
	}
	// 강좌별 출석 시도와 출석 횟수
	@GetMapping("auth/manger/chart/attendanceCountByLecture/{lectureNo}")
	public List<Map<String, Object>> AttendanceCountByLecture(
			@PathVariable(name="lectureNo")int lectureNo){
		return managerChartRestService.selectAttendanceRateByStudent(lectureNo);
	}
	// 학생별 과제 점수
	@GetMapping("auth/manger/chart/attendanceCountByLecture/{reporNo}/{lectureNo}")
	public List<Map<String, Object>> AttendanceCountByLecture(
			@PathVariable(name="reprotNo")int reprotNo,
			@PathVariable(name="lectureNo")int lectureNo){
		return managerChartRestService.selectReportCountByStudent(reprotNo, lectureNo);
	}
	// 강좌별 과제 제출률
	@GetMapping("auth/manger/chart/reportSubmissionRateByLecture/{lectureNo}")
	public List<Map<String, Object>> ReportSubmissionRateByLecture(
			@PathVariable(name="lectureNo")int lectureNo){
		return managerChartRestService.selectReportSubmissionRateByLecture(lectureNo);
	}
	// 월별 로그인 횟수
	@GetMapping("auth/manger/chart/loginCountByMonth/{year}/{month}")
	public List<Map<String, Object>> LoginCountByMonth(
			@PathVariable(name="year")int year,
			@PathVariable(name="month")int month){
		return managerChartRestService.selectLoginCountByMonth(year, month);
	}
	// 강의별 과제 점수 평균
	@GetMapping("auth/manger/chart/avgReportByLecture/{lectureNo}")
	public List<Map<String, Object>> AvgReportByLecture(
			@PathVariable(name="lectureNo")int lectureNo){
		return managerChartRestService.selectAvgReportByLecture(lectureNo);
	}
	// 학생별 과제 점수 평균
	@GetMapping("auth/manger/chart/avgReprotByStudent/{lectureNo}")
	public List<Map<String, Object>> AvgReprotByStudent(
			@PathVariable(name="lectureNo")int lectureNo){
		return managerChartRestService.selectAvgReprotByStudent(lectureNo);
	}
}
