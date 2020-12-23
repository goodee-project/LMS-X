package gd.fintech.lms.teacher.mapper;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Career;
import gd.fintech.lms.vo.License;
import gd.fintech.lms.vo.Teacher;

@Mapper
public interface TeacherMypageMapper {
	// 강사 마이페이지 정보
	public Teacher selectTeacherMypage(String accountId);
	
	// 강사 마이페이지 수정
	public int updateTeacherMypage(Teacher teacher);
	
	// 강사 마이페이지 경력 추가
	public int insertTeacherMypageCareer(Career career);
	
	// 경력 및 자격증 추가시 강사 수정시간 변경
	public int updateTeacherUpdatedate(String accountId);
	
	// 강사 마이페이지 경력 삭제
	public int deleteTeacherMypageCareer(int careerNo);
	
	// 강사 마이페이지 자격증 추가
	public int insertTeacherMypageLicense(License license);
	
	// 강사 마이페이지 자격증 삭제
	public int deleteTeacherMypageLicense(int licenseNo);
}
