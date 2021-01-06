package gd.fintech.lms.manager.restcontroller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import gd.fintech.lms.manager.restservice.ManagerChartRestService;
import gd.fintech.lms.vo.Report;

@RestController
public class ManagerChartRestController {
	@Autowired ManagerChartRestService managerChartRestService;
	
	// 해당 강좌의 과제 리스트 가져오기
	@GetMapping("auth/manager/chart/reportListByLectureNo/{lectureNo}")
	public List<Report> reportListByLectureNo(@PathVariable(name="lectureNo") int lectureNo){
		return managerChartRestService.selectReportListByLectureNo(lectureNo);
	}
	
	// 최근 2주일 접속 트래픽
	@GetMapping("auth/manager/chart/latestLoginLog")
	public List<Map<String, Object>> LatestLoginLog(){
		return managerChartRestService.selectLatestLoginLog();
	}
	
	// 강의별 성적 평균
	@GetMapping("auth/manager/chart/avgGradeByLecture")
	public List<Map<String, Object>> AvgGradeByLecture(){
		return managerChartRestService.selectAvgGradeByLecture();
	}
	// 강의별 최대/최소 성적
	@GetMapping("auth/manager/chart/minMaxGradeByLecture")
	public List<Map<String, Object>> MinMaxGradeByLecture(){
		return managerChartRestService.selectMinMaxGradeByLecture();
	}
	// 과목별 학생 성적
	@GetMapping("auth/manager/chart/gradeBySubject/{lectureNo}")
	public List<Map<String, Object>> GradeBySubject(
			@PathVariable(name="lectureNo")int lectureNo){
		return managerChartRestService.selectGradeBySubject(lectureNo);
	}
	// 학생별 출석률
	@GetMapping("auth/manager/chart/attendanceRateByStudent/{lectureNo}")
	public List<Map<String, Object>> AttendanceRateByStudent(
			@PathVariable(name="lectureNo")int lectureNo){
		return managerChartRestService.selectAttendanceRateByStudent(lectureNo);
	}
	// 강좌별 별점 점수
	@GetMapping("auth/manager/chart/starRatingByLecture")
	public List<Map<String, Object>> StarRatingByLecture(){
		return managerChartRestService.selectStarRatingByLecture();
	}
	// 학생별 과제 점수
	@GetMapping("auth/manager/chart/attendanceCountByLecture/{lectureNo}/{reportNo}")
	public List<Map<String, Object>> AttendanceCountByLecture(
			@PathVariable(name="lectureNo")int lectureNo,
			@PathVariable(name="reportNo")int reportNo){
		return managerChartRestService.selectReportCountByStudent(reportNo, lectureNo);
	}
	// 강좌별 과제 제출률
	@GetMapping("auth/manager/chart/reportSubmissionRateByLecture/{lectureNo}")
	public List<Map<String, Object>> ReportSubmissionRateByLecture(
			@PathVariable(name="lectureNo")int lectureNo){
		return managerChartRestService.selectReportSubmissionRateByLecture(lectureNo);
	}
	// 월별 로그인 횟수
	@GetMapping("auth/manager/chart/loginCountByMonth/{year}/{month}")
	public List<Map<String, Object>> LoginCountByMonth(
			@PathVariable(name="year")int year,
			@PathVariable(name="month")int month){
		return managerChartRestService.selectLoginCountByMonth(year, month);
	}
	// 강의별 과제 점수 평균
	@GetMapping("auth/manager/chart/avgReportByLecture/{lectureNo}")
	public List<Map<String, Object>> AvgReportByLecture(
			@PathVariable(name="lectureNo")int lectureNo){
		return managerChartRestService.selectAvgReportByLecture(lectureNo);
	}
	// 학생별 과제 점수 평균
	@GetMapping("auth/manager/chart/avgReportByStudent/{lectureNo}")
	public List<Map<String, Object>> AvgReportByStudent(
			@PathVariable(name="lectureNo")int lectureNo){
		return managerChartRestService.selectAvgReportByStudent(lectureNo);
	}
}
