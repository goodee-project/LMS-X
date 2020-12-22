package gd.fintech.lms.teacher.restmapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TeacherSyllabusRestMapper {
	// 계획서 다운로드 횟수 증가
	public int updateTeacherSyllabusCountUp(String uuid);
	
	// 계획서 다운로드 횟수 가져오기
	public int selectTeacherSyllabusCountUp(String uuid);
}
