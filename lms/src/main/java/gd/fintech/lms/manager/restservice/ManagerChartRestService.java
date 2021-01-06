package gd.fintech.lms.manager.restservice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gd.fintech.lms.manager.restmapper.ManagerChartRestMapper;

@Service
public class ManagerChartRestService {
	@Autowired ManagerChartRestMapper managerChartRestMapper;
	
	//  강의별 성적 평균
	public List<Map<String, Object>> selectAvgGradeByLecture(){
		return managerChartRestMapper.selectAvgGradeByLecture();
	}
	// 강의별 최대/최소 성적
	public List<Map<String, Object>> selectMinMaxGradeByLecture(){
		return managerChartRestMapper.selectMinMaxGradeByLecture();
	}
	// 과목별 학생 성적
	public List<Map<String, Object>> selectGradeBySubject(int lectureNo){
		return managerChartRestMapper.selectGradeBySubject(lectureNo);
	}
	// 학생별 출석률
	public List<Map<String, Object>> selectAttendanceRateByStudent(int lectureNo){
		return managerChartRestMapper.selectAttendanceRateByStudent(lectureNo);
	}
	// 강좌별 별점 점수
	public List<Map<String, Object>> selectStarRatingByLecture(){
		return managerChartRestMapper.selectStarRatingByLecture();
	}
	// 강좌별 출석 시도와 출석 횟수
	public List<Map<String, Object>> selectAttendanceCountByLecture(int lectureNo){
		return managerChartRestMapper.selectAttendanceCountByLecture(lectureNo);
	}
	// 학생별 과제 점수
	public List<Map<String, Object>> selectReportCountByStudent(int reportNo, int lectureNo){
		Map<String,Integer> map = new HashMap<String, Integer>();
		map.put("reportNo",reportNo);
		map.put("lectureNo",lectureNo);
		return managerChartRestMapper.selectReportCountByStudent(map);
	}
	// 강좌별 과제 제출률
	public List<Map<String, Object>> selectReportSubmissionRateByLecture(int lectureNo){
		return managerChartRestMapper.selectReportSubmissionRateByLecture(lectureNo);
	}
	// 월별 로그인 횟수
	public List<Map<String, Object>> selectLoginCountByMonth(int year, int month){
		Map<String,Integer> map = new HashMap<String, Integer>();
		map.put("year", year);
		map.put("month", month);
		return managerChartRestMapper.selectLoginCountByMonth(map);
	}
	// 강의별 과제 점수 평균
	public List<Map<String, Object>> selectAvgReportByLecture(int lectureNo){
		return managerChartRestMapper.selectAvgReportByLecture(lectureNo);
	}
	// 학생별 과제 점수 평균
	public List<Map<String, Object>> selectAvgReportByStudent(int lectureNo){
		return managerChartRestMapper.selectAvgReportByStudent(lectureNo);
	}
}
