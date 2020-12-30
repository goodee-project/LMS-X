package gd.fintech.lms.student.mapper;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.License;
import gd.fintech.lms.vo.MypageImage;
import gd.fintech.lms.vo.Student;

@Mapper
public interface StudentMypageMapper {
	// 학생 마이페이지 정보
	public Student selectStudentMypage(String accountId);
	
	// 학생 마이페이지 수정
	public int updateStudentMypage(Student student);
	
	// 자격증 추가시 학생 수정시간 변경
	public int updateStudentUpdatedate(String accountId);
	
	// 학생 마이페이지 자격증 추가
	public int insertStudentMypageLicense(License license);
	
	// 학생 마이페이지 자격증 삭제
	public int deleteStudentMypageLicense(int licenseNo);
	
	// 학생 마이페이지 이미지 추가
	public int insertStudentMypageImage(MypageImage mypageImage);
	
	// 이미지 조회
	public MypageImage selectMypageImage(String accountId);
	
	// 이미지 삭제
	public int deleteMypageImage(String accountId);
}
