package gd.fintech.lms.student.service;

import java.io.File;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import gd.fintech.lms.common.PathUtil;
import gd.fintech.lms.student.mapper.StudentMypageMapper;
import gd.fintech.lms.vo.License;
import gd.fintech.lms.vo.MypageImage;
import gd.fintech.lms.vo.Student;
import gd.fintech.lms.vo.StudentForm;

@Service
@Transactional
public class StudentMypageService {
	@Autowired StudentMypageMapper studentMypageMapper;
	
	private static final Logger log = LoggerFactory.getLogger(StudentMypageService.class);

	// 첨부파일 경로
	private String PATH = PathUtil.PATH("mypageImage"); 
	
	// 학생 마이페이지 정보
		public Student selectstudentMypage(String accountId) {
			
			return studentMypageMapper.selectStudentMypage(accountId);
		}
		
		// 학생 이미지 조회
		public MypageImage selectManagerImage(String accountId) {
			
			return studentMypageMapper.selectMypageImage(accountId);
		}
		
		// 학생 마이페이지 정보 수정
		public void updatestudentMypage(StudentForm studentForm) {
			
			Student student = new Student();
			student.setStudentId(studentForm.getStudentId());
			student.setStudentEmail(studentForm.getStudentEmail());
			student.setStudentName(studentForm.getStudentName());
			student.setStudentPhone(studentForm.getStudentPhone());
			student.setStudentGender(studentForm.getStudentGender());
			student.setStudentBirth(studentForm.getStudentBirth());
			student.setStudentAddressMain(studentForm.getStudentAddressMain());
			student.setStudentAddressSub(studentForm.getStudentAddressSub());
			
			log.debug(student.toString());
			studentMypageMapper.updateStudentMypage(student);
			
			MypageImage mypageImage = new MypageImage();
			
			MultipartFile mf = studentForm.getStudentImage();
			
			// 입력한 첨부파일 이미지가 있다면
			if(mf.getOriginalFilename() != "") {
				
				
				// 이미지 파일 조회
				MypageImage mi = studentMypageMapper.selectMypageImage(studentForm.getStudentId());
				
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
					studentMypageMapper.deleteMypageImage(studentForm.getStudentId());
				}
				
				// 확장자 점 위치 확인
				int p = mf.getOriginalFilename().lastIndexOf(".");
				// 확장자를 잘라내어 소문자로 저장
				String ext = mf.getOriginalFilename().substring(p).toLowerCase();
				// 랜덤한 파일 이름을 생성
				String imageName = UUID.randomUUID().toString().replace("-", "");
				mypageImage.setAccountId(studentForm.getStudentId());
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
				studentMypageMapper.insertStudentMypageImage(mypageImage);
			}
		}
		
	
		
		// 학생 마이페이지 자격증 추가
		public void insertStudentMypageLicense(License license) {
			studentMypageMapper.insertStudentMypageLicense(license);
			studentMypageMapper.updateStudentUpdatedate(license.getAccountId());
		}
		
		// 학생 마이페이지 자격증 삭제
		public void deleteStudentMypageLicense(int licenseNo, String accountId) {
			studentMypageMapper.deleteStudentMypageLicense(licenseNo);
			studentMypageMapper.updateStudentUpdatedate(accountId);
		}
}
