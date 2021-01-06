package gd.fintech.lms.manager.restmapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface ManagerChartRestMapper {
	// 강의별 성적 평균
	public List<Map<String, Object>> selectAvgGradeByLecture();
	// 강의별 최대/ 최소 성적
	public List<Map<String, Object>> selectMinMaxGradeByLecture();
	// 과목별 학생 성적
	public List<Map<String, Object>> selectGradeBySubject(int lectureNo);
	// 학생별 출석률
	public List<Map<String, Object>> selectAttendanceRateByStudent(int lectureNo);
	// 강좌별 별점 점수
	public List<Map<String, Object>> selectStarRatingByLecture();
	// 강좌별 출석 시도와 출석 횟수
	public List<Map<String, Object>> selectAttendanceCountByLecture(int letureNo);
	// 학생별 과제 점수
	public List<Map<String, Object>> selectReportCountByStudent(Map<String, Integer> map);
	// 강좌별 과제 제출률
	public List<Map<String, Object>> selectReportSubmissionRateByLecture(int lectureNo);
	// 학생 성적 평균
	public List<Map<String, Object>> selectAvgGradeByStudent(int lectureNo);
	// 월별 로그인 횟수
	public List<Map<String, Object>> selectLoginCountByMonth(Map<String, Integer> map);
	// 강의별 과제 점수 평균
	public List<Map<String, Object>> selectAvgReportByLecture(int lectureNo);
	// 학생별 과제 점수 평균
	public List<Map<String, Object>> selectAvgReprotByStudent(int lectureNo);
}
