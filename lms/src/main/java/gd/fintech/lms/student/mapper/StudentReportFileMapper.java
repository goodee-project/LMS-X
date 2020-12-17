package gd.fintech.lms.student.mapper;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.ReportSubmitFile;

@Mapper
public interface StudentReportFileMapper {
	// 과제 제출 파일 추가
	public int insertReportSubmitFile(ReportSubmitFile reportSubmitFile);
}
