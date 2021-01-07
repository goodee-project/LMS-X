package gd.fintech.lms.manager.restservice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gd.fintech.lms.manager.restmapper.ManagerChartRestMapper;
import gd.fintech.lms.vo.Report;

@Service
public class ManagerChartRestService {
	@Autowired ManagerChartRestMapper managerChartRestMapper;
	
	// 해당 강좌의 과제 리스트 가져오기
	public List<Report> selectReportListByLectureNo(int lectureNo){
		return managerChartRestMapper.selectReportListByLectureNo(lectureNo);
	}
	// 최근 2주일 접속 트래픽
	public List<Map<String, Object>> selectLatestLoginLog(){
		return managerChartRestMapper.selectLatestLoginLog();
	}
	
	//  강의별 성적 평균
	public List<Map<String, Object>> selectAvgGradeByLecture(){
		return managerChartRestMapper.selectAvgGradeByLecture();
	}
	// 강의별 최대/최소 성적
	public List<Map<String, Object>> selectMinMaxGradeByLecture(){
		return managerChartRestMapper.selectMinMaxGradeByLecture();
	}
	// 학생별 성적
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
	// 학생별 별점 점수
	public List<Map<String, Object>> selectStudentStarRatingScore(int lectureNo){
		return managerChartRestMapper.selectStudentStarRating(lectureNo);
	}
}
