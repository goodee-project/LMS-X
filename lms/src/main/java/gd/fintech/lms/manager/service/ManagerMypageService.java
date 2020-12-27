package gd.fintech.lms.manager.service;

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
import gd.fintech.lms.manager.mapper.ManagerMypageMapper;
import gd.fintech.lms.vo.Career;
import gd.fintech.lms.vo.License;
import gd.fintech.lms.vo.Manager;
import gd.fintech.lms.vo.ManagerForm;
import gd.fintech.lms.vo.MypageImage;

@Service
@Transactional
public class ManagerMypageService {
	@Autowired private ManagerMypageMapper managerMypageMapper;
	
	private static final Logger log = LoggerFactory.getLogger(ManagerMypageService.class);
	
	// 첨부파일 경로
	private String PATH = PathUtil.PATH("mypageImage"); 
	
	// 운영자 마이페이지 정보
	public Map<String,Object> selectManagerMypage(String accountId) {
		
		// 운영자 정보
		Manager manager = managerMypageMapper.selectManagerMypage(accountId);
		
		// 강사 이미지
		MypageImage mypageImage = managerMypageMapper.selectMypageImage(accountId);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("manager", manager);
		map.put("mypageImage", mypageImage);
		
		return map;
	}
	
	// 운영자 마이페이지 정보 수정
	public void updateManagerMypage(ManagerForm managerForm) {
		Manager manager = new Manager();
		manager.setManagerId(managerForm.getManagerId());
		manager.setManagerEmail(managerForm.getManagerEmail());
		manager.setManagerName(managerForm.getManagerName());
		manager.setManagerPhone(managerForm.getManagerPhone());
		manager.setManagerGender(managerForm.getManagerGender());
		manager.setManagerBirth(managerForm.getManagerBirth());
		manager.setManagerAddressMain(managerForm.getManagerAddressMain());
		manager.setManagerAddressSub(managerForm.getManagerAddressSub());
		
		log.debug(manager.toString());
		managerMypageMapper.updateManagerMypage(manager);
		
		MypageImage mypageImage = new MypageImage();
		
		MultipartFile mf = managerForm.getManagerImage();
		
		// 입력한 첨부파일 이미지가 있다면
		if(mf.getOriginalFilename() != "") {
			
			
			// 이미지 파일 조회
			MypageImage mi = managerMypageMapper.selectMypageImage(managerForm.getManagerId());
			
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
				managerMypageMapper.deleteMypageImage(managerForm.getManagerId());
			}
			
			// 확장자 점 위치 확인
			int p = mf.getOriginalFilename().lastIndexOf(".");
			// 확장자를 잘라내어 소문자로 저장
			String ext = mf.getOriginalFilename().substring(p).toLowerCase();
			// 랜덤한 파일 이름을 생성
			String imageName = UUID.randomUUID().toString().replace("-", "");
			mypageImage.setAccountId(managerForm.getManagerId());
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
			managerMypageMapper.insertManagerMypageImage(mypageImage);
		}
		
	}
	
	// 운영자 마이페이지 경력 추가
	public void insertManagerMypageCareer(Career career) {
		
		managerMypageMapper.insertManagerMypageCareer(career);
		managerMypageMapper.updateManagerUpdatedate(career.getAccountId());
	}
	
	// 운영자 마이페이지 경력 삭제
	public void deleteManagerMypageCareer(int careerNo, String accountId) {
		
		managerMypageMapper.deleteManagerMypageCareer(careerNo);
		managerMypageMapper.updateManagerUpdatedate(accountId);
	}
	
	// 운영자 마이페이지 자격증 추가
	public void insertManagerMypageLicense(License license) {
		managerMypageMapper.insertManagerMypageLicense(license);
		managerMypageMapper.updateManagerUpdatedate(license.getAccountId());
	}
	
	// 운영자 마이페이지 자격증 삭제
	public void deleteManagerMypageLicense(int licenseNo, String accountId) {
		managerMypageMapper.deleteManagerMypageLicense(licenseNo);
		managerMypageMapper.updateManagerUpdatedate(accountId);
	}
}
