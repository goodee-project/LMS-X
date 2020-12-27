package gd.fintech.lms.teacher.service;

import java.io.File;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import gd.fintech.lms.common.PathUtil;
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
	
	private static final Logger log = LoggerFactory.getLogger(TeacherMypageService.class);
	
	// 첨부파일 경로
	private String PATH = PathUtil.PATH("mypageImage"); 
	
	// 강사 마이페이지 정보
	public Map<String,Object> selectTeacherMypage(String accountId) {
		// 강사 정보
		Teacher teacher = teacherMypageMapper.selectTeacherMypage(accountId);
		// 강사 이미지
		MypageImage mypageImage = teacherMypageMapper.selectMypageImage(accountId);
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("teacher", teacher);
		map.put("mypageImage", mypageImage);
		return map;
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
		teacher.setTeacherInfo(teacherForm.getTeacherInfo());
		
		log.debug(teacher.toString());
		teacherMypageMapper.updateTeacherMypage(teacher);
		
		MypageImage mypageImage = new MypageImage();
		
		MultipartFile mf = teacherForm.getTeacherImage();
		
		// 입력한 첨부파일 이미지가 있다면
		if(mf.getOriginalFilename() != "") {
			
			
			// 이미지 파일 조회
			MypageImage mi = teacherMypageMapper.selectMypageImage(teacherForm.getTeacherId());
			
			// 데이터베이스에 기존에 있던 이미지가 있으면 파일삭제
			if(mi != null) {
				// 이미지 경로 + 이미지 이름
				File file = new File(PATH + mi.getMypageImageUuid());
				
				// 이미지가 존재하는 경우
				if (file.exists()) {
					// 이미지 삭제
					file.delete();
				}
				
				// 데이터베이스의 이미지 파일 삭제
				teacherMypageMapper.deleteMypageImage(teacherForm.getTeacherId());
			}
			
			// 확장자 점 위치 확인
			int p = mf.getOriginalFilename().lastIndexOf(".");
			// 확장자를 잘라내어 소문자로 저장
			String ext = mf.getOriginalFilename().substring(p).toLowerCase();
			// 랜덤한 파일 이름을 생성
			String imageName = UUID.randomUUID().toString().replace("-", "");
			mypageImage.setAccountId(teacherForm.getTeacherId());
			mypageImage.setMypageImageUuid(imageName+ext);
			mypageImage.setMypageImageSize(mf.getSize());
			mypageImage.setMypageImageOriginal(mf.getOriginalFilename());
			mypageImage.setMypageImageType(mf.getContentType());
			// 서버에 파일 저장
			try {
				// 파일을 지정된 경로에 저장
				mf.transferTo(new File(PATH+imageName+ext));
			} catch (Exception e) {
				// 디버깅 코드 출력
				e.printStackTrace();
				
				// 트랜잭션 중단
				throw new RuntimeException();
			}
			
			log.debug(mypageImage.toString());
			// 데이터베이스에 이미지정보 추가
			teacherMypageMapper.insertTeacherMypageImage(mypageImage);
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
