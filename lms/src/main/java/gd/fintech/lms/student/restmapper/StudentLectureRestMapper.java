package gd.fintech.lms.student.restmapper;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.ClassRegistration;

@Mapper
public interface StudentLectureRestMapper {
	// 이미 해당 강좌를 수강신청 했는지 확인
	int selectCheckClassRegistration(ClassRegistration classRegistration);
	
	// 과제 제출 첨부파일 다운로드 횟수 증가
	int updateReportSubmitFileCount(String uuid);
	
	// 과제 제출 첨부파일 다운로드 횟수 가져오기
	int selectReportSubmitFileCount(String uuid);
}
