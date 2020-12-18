package gd.fintech.lms.student.restmapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface StudentReportRestMapper {
	// 과제 제출 첨부파일 다운로드 횟수 증가
	int updateReportSubmitFileCount(String uuid);
	
	// 과제 제출 첨부파일 다운로드 횟수 가져오기
	int selectReportSubmitFileCount(String uuid);
	
	// 과제 제출 첨부파일 한개 삭제
	int deleteReportSubmitFileOne(String uuid);
	
	// 해당 과제가 제출 기간인지
	int selectCheckReportSubmitDate(int reportNo);
}
