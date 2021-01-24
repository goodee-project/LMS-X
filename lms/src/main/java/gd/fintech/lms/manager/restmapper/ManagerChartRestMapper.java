package gd.fintech.lms.manager.restmapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Report;


@Mapper
public interface ManagerChartRestMapper {
	// 해당 강좌의 과제 리스트 가져오기
	public List<Report> selectReportListByLectureNo(int lectureNo);
	// 최근 10일 접속 트래픽
	public List<Map<String, Object>> selectLatestLoginLog();
	// 강의별 성적 평균
	public List<Map<String, Object>> selectAvgGradeByLecture();
	// 강의별 최대/ 최소 성적
	public List<Map<String, Object>> selectMinMaxGradeByLecture();
	// 학생별 성적
	public List<Map<String, Object>> selectGradeBySubject(int lectureNo);
	// 학생별 출석률
	public List<Map<String, Object>> selectAttendanceRateByStudent(int lectureNo);
	// 강좌별 별점 점수
	public List<Map<String, Object>> selectStarRatingByLecture();
	// 학생별 과제 점수
	public List<Map<String, Object>> selectReportCountByStudent(Map<String, Integer> map);
	// 강좌별 과제 제출률
	public List<Map<String, Object>> selectReportSubmissionRateByLecture(int lectureNo);
	// 월별 로그인 횟수
	public List<Map<String, Object>> selectLoginCountByMonth(Map<String, Integer> map);
	// 강의별 과제 점수 평균
	public List<Map<String, Object>> selectAvgReportByLecture(int lectureNo);
	// 학생별 과제 점수 평균
	public List<Map<String, Object>> selectAvgReportByStudent(int lectureNo);
	// 학생별 별점
	public List<Map<String, Object>> selectStudentStarRating(int lectureNo);
}
