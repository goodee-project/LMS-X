package gd.fintech.lms.teacher.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Report;
import gd.fintech.lms.vo.ReportSubmit;

@Mapper
public interface TeacherReportMapper {
	// 강사 과제 목록 페이지에서 목록 페이징
	// 강사 아이디(teacherId), 시작 데이터 번호(beginRow), 페이지당 표시 데이터 수(rowPerPage)를 이용
	List<Report> selectTeacherReportListByPage(Map<String, Integer> map);
	
	// 강사 과제 목록 페이지 카운트
	// 강좌 고유번호(lectureNo)를 이용
	int selectTeacherReportListCount(int lectureNo);
	
	// 강사 과제 정보 조회
	// 과제 고유번호(reportNo)를 이용
	Report selectTeacherReportOne(int reportNo);
	
	// 학생 과제 제출 목록
	// 강좌 고유번호(lectureNo), 과제 고유번호(reportNo)를 이용
	List<ReportSubmit> selectTeacherReportSubmitList(Map<String, Object> map);
	
	// 강사 과제 출제
	// Report 객체에 담겨있는 정보를 이용
	int insertTeacherReport(Report report);
	
	// 강사 과제 수정
	// Report 객체에 담겨있는 정보를 이용
	int updateTeacherReport(Report report);
	
	// 학생 과제 제출 조회
	// 과제 제출 고유번호(reportSubmitNo)를 이용
	List<ReportSubmit> selectTeacherReportSubmitOne(int reportSubmitNo);
	
	// 학생 과제 평가 입력
	// 과제 제출 고유번호(reportSubmitNo)
	int insertTeacherReportSubmit(Map<String, Object> map);
	
	// 학생 과제 평가 수정
	// 과제 제출 고유번호(reportSubmitNo)
	int updateTeacherReportSubmit(Map<String, Object> map);
}
