package gd.fintech.lms.student.restmapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface StudentSyllabusRestMapper {

	// 강의 계획서 첨부파일 다운로드 횟수 증가
	int updateStudentSyllabusFileCount(String syllabusFileUuid);
	
	// 강의 계획서 첨부파일 다운로드 횟수 구하기
	int selectStudentSyllabusFileCount(String syllabusFileUuid);
}
