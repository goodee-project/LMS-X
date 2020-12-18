package gd.fintech.lms.student.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.ClassRegistration;
import gd.fintech.lms.vo.Report;
import gd.fintech.lms.vo.ReportSubmit;

@Mapper
public interface StudentReportMapper {
	// 강사가 출제한 과제 목록
	public List<Report> selectReportListByPage(Map<String, Object> map);
	// 강사가 출제한 과제 개수
	public int selectReportListCount(int classNo);
	// 과제 상세보기
	public Report selectReportOne(int reportNo);
	// 제출한 과제 정보 가져오기
	public ReportSubmit selectReportSubmitOne(ReportSubmit reportSubmit);
	// 과제 제출하기
	public int insertReportSubmit(ReportSubmit reportSubmit);
	
	// 과제 제출 수정하기
	public int updateReportSubmit(ReportSubmit reportSubmit);
	
	// 과제 제출 삭제하기
	public int deleteReportSubmit(int reportSubmitNo);
}
