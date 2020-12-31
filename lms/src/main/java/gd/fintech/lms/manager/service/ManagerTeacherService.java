package gd.fintech.lms.manager.service;

import java.io.File;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.common.PathUtil;
import gd.fintech.lms.manager.mapper.ManagerTeacherMapper;
import gd.fintech.lms.vo.Account;
import gd.fintech.lms.vo.MypageImage;
import gd.fintech.lms.vo.Teacher;
import gd.fintech.lms.vo.TeacherQueue;

@Service
@Transactional
public class ManagerTeacherService {
	@Autowired ManagerTeacherMapper managerTeacherMapper;
	
	// 첨부파일 경로
	private String PATH = PathUtil.PATH("mypageImage"); 
	
	// 강사 목록 페이징
	public List<Teacher> getTeacherListByPage(Map<String, Object> map) {
		return managerTeacherMapper.selectTeacherListByPage(map);
	}
	
	// 강사 목록 페이징 카운트
	public int getCountTeacher(int rowPerPage) {
		return managerTeacherMapper.selectTeacherCount();
	}
	
	// 강사 목록 상세보기
	public Teacher getTeacherOne(String teacherId) {
		return managerTeacherMapper.selectTeacherOne(teacherId);
	}
	// 강사 이미지 조회
	public MypageImage getTeacherImage(String teacherId) {
		return managerTeacherMapper.selectTeacherImage(teacherId);
	}
	
	// 강사 승인대기 목록
	public List<TeacherQueue> getTeacherQueueListByPage(Map<String, Object> map){
		return managerTeacherMapper.selectTeacherQueueListByPage(map);
	}
	
	// 강사 승인대기 페이징
	public int getCountTeacherQueue(int rowPerPage) {
		return managerTeacherMapper.selectTeacherQueueCount();
	}
	
	// 강사 승인 거절
	public void negativeTeacher(String accountId) {
		// 강사 승인대기 테이블 삭제
		managerTeacherMapper.deleteTeacherQueue(accountId);
		// 계정 테이블 삭제
		managerTeacherMapper.deleteAccount(accountId);
	}
	
	// 강사 승인
	public void accessTeacher(String accountId, String loginId) {
		Account account = new Account();
		account.setAccountState("활성화");
		account.setAccountId(accountId);
		// 계정 정보 찾기
		Teacher teacher = managerTeacherMapper.selectTeacherQueueOne(accountId);
		teacher.setManagerIdAccess(loginId);
		// 계정 상태 업데이트
		managerTeacherMapper.updateAccountState(account);
		// 강사 테이블 추가
		managerTeacherMapper.insertTeacher(teacher);
		// 강사 승인대기 테이블 삭제
		managerTeacherMapper.deleteTeacherQueue(accountId);
	}
	
	// 강사 탈퇴
	public void deleteTeacherOneAll(String accountId) {
		Account account = new Account();
		account.setAccountId(accountId);
		account.setAccountState("탈퇴");
		
		// 강사 계정 탈퇴 업데이트
		managerTeacherMapper.updateAccountState(account);
		// 강사 정보 삭제
		managerTeacherMapper.deleteTeacher(accountId);
		// 강사 자격증 삭제
		managerTeacherMapper.delteTeacherLicense(accountId);
		// 강사 경력 삭제
		managerTeacherMapper.deleteTeacherCareer(accountId);
		// 강사 이미지 삭제
		// 이미지 파일 조회
		MypageImage mi = managerTeacherMapper.selectTeacherImage(accountId);
		
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
			managerTeacherMapper.deleteTeacherImage(accountId);
		}
	}
}
