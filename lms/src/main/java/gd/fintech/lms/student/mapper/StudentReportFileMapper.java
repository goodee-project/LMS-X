package gd.fintech.lms.student.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.ReportSubmitFile;

@Mapper
public interface StudentReportFileMapper {
	// 과제 제출 파일 추가
	public int insertReportSubmitFile(ReportSubmitFile reportSubmitFile);
	
	// 과제 제출 파일 이름 가져오기
	public List<String> selectReportSubmitFileName(int reportSubmitNo);
	
	// 제출된 해당 과제의 파일들 삭제
	public int deleteReportSubmitFile(int reportSubmitNo);
}
