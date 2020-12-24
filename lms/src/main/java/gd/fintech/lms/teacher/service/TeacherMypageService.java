package gd.fintech.lms.teacher.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import gd.fintech.lms.teacher.mapper.TeacherMypageMapper;
import gd.fintech.lms.vo.Career;
import gd.fintech.lms.vo.License;
import gd.fintech.lms.vo.MypageImage;
import gd.fintech.lms.vo.Teacher;
import gd.fintech.lms.vo.TeacherForm;

@Service
@Transactional
public class TeacherMypageService {
	@Autowired private TeacherMypageMapper teacherMypageMapper;
	
	// 강사 마이페이지 정보
	public Teacher selectTeacherMypage(String accountId) {
		
		return teacherMypageMapper.selectTeacherMypage(accountId);
	}
	
	// 강사 마이페이지 정보 수정
	public void updateTeacherMypage(TeacherForm teacherForm) {
		
		Teacher teacher = new Teacher();
		teacher.setTeacherId(teacherForm.getTeacherId());
		teacher.setTeacherEmail(teacherForm.getTeacherEmail());
		teacher.setTeacherName(teacherForm.getTeacherName());
		teacher.setTeacherPhone(teacherForm.getTeacherPhone());
		teacher.setTeacherGender(teacherForm.getTeacherGender());
		teacher.setTeacherBirth(teacherForm.getTeacherBirth());
		teacher.setTeacherAddressMain(teacherForm.getTeacherAddressMain());
		teacher.setTeacherAddressSub(teacherForm.getTeacherAddressSub());
		
		teacherMypageMapper.updateTeacherMypage(teacher);
		
		MypageImage mypageImage = null;
		
		if(teacherForm.getTeacherImage() != null) {
			mypageImage = new MypageImage();
			MultipartFile mf = teacherForm.getTeacherImage();
			int p = mf.getOriginalFilename().lastIndexOf(".");
		}
		
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
