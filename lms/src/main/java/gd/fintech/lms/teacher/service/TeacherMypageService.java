package gd.fintech.lms.teacher.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.teacher.mapper.TeacherMypageMapper;
import gd.fintech.lms.vo.Career;
import gd.fintech.lms.vo.License;
import gd.fintech.lms.vo.Teacher;

@Service
@Transactional
public class TeacherMypageService {
	@Autowired private TeacherMypageMapper teacherMypageMapper;
	
	// 강사 마이페이지 정보
		public Teacher selectTeacherMypage(String accountId) {
			
			return teacherMypageMapper.selectTeacherMypage(accountId);
		}
		
		// 강사 마이페이지 정보 수정
		public int updateTeacherMypage(Teacher Teacher) {
			
			return teacherMypageMapper.updateTeacherMypage(Teacher);
		}
		
		// 강사 마이페이지 경력 추가
		public void insertTeacherMypageCareer(Career career) {
			
			teacherMypageMapper.insertTeacherMypageCareer(career);
			teacherMypageMapper.updateTeacherUpdatedate(career.getAccountId());
		}
		
		// 강사 마이페이지 경력 삭제
		public void deleteTeacherMypageCareer(int careerNo, String accountId) {
			
			teacherMypageMapper.deleteTeacherMypageCareer(careerNo);
			teacherMypageMapper.updateTeacherUpdatedate(accountId);
		}
		
		// 강사 마이페이지 자격증 추가
		public void insertTeacherMypageLicense(License license) {
			teacherMypageMapper.insertTeacherMypageLicense(license);
			teacherMypageMapper.updateTeacherUpdatedate(license.getAccountId());
		}
		
		// 강사 마이페이지 자격증 삭제
		public void deleteTeacherMypageLicense(int licenseNo, String accountId) {
			teacherMypageMapper.deleteTeacherMypageLicense(licenseNo);
			teacherMypageMapper.updateTeacherUpdatedate(accountId);
		}
}
