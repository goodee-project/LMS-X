package gd.fintech.lms.manager.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.common.PathUtil;
import gd.fintech.lms.manager.mapper.ManagerStudentMapper;
import gd.fintech.lms.vo.Account;
import gd.fintech.lms.vo.MypageImage;
import gd.fintech.lms.vo.Student;
import gd.fintech.lms.vo.StudentQueue;

@Service
@Transactional
public class ManagerStudentService {
	@Autowired ManagerStudentMapper managerStudentMapper;
	// 첨부파일 경로
	private String PATH = PathUtil.PATH("mypageImage"); 
	
	// 학생 목록 페이징
	public List<Student> getStudentListByPage(int beginRow, int rowPerPage, String searchText) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("beginRow", beginRow);			// 시작 데이터
		map.put("rowPerPage", rowPerPage);		// 한 페이지당 표시할 데이터 수
		map.put("searchText", searchText);		// 문자열 검색
		return managerStudentMapper.selectStudentListByPage(map);
	}
	
	// 학생 목록 페이징 카운트
	public int getCountStudent(int rowPerPage) {
		return managerStudentMapper.selectStudentCount();
	}
	
	// 학생 목록 상세보기
	public Student getStudentOne(String studentId) {
		return managerStudentMapper.selectStudentOne(studentId);
	}
	
	// 강사 이미지 조회
	public MypageImage getTeacherImage(String teacherId) {
		return managerStudentMapper.selectStudentImage(teacherId);
	}
	
	// 학생 승인 대기 목록
	public List<StudentQueue> getStudentQueueListByPage(Map<String, Object> map){
		return managerStudentMapper.selectStudentQueueListByPage(map);
	}
	
	// 학생 승인 대기 페이징
	public int getCountStudentQueue(int rowPerPage) {
		return managerStudentMapper.selectStudentQueueCount();
	}
	
	// 학생 승인 거절
	public void negativeStudent(String accountId) {
		// 학생 승인대기 테이블 삭제
		managerStudentMapper.deleteStudentQueue(accountId);
		// 계정 테이블 삭제
		managerStudentMapper.deleteAccount(accountId);
	}
	
	// 학생 승인
	public void accessStudent(String accountId, String loginId) {
		Account account = new Account();
		account.setAccountState("활성화");
		account.setAccountId(accountId);
		// 계정 정보 찾기
		Student student = managerStudentMapper.selectStudentQueueOne(accountId);
		student.setManagerIdAccess(loginId);
		// student.setStudentImage("default.jpg");
		// 계정 상태 업데이트
		managerStudentMapper.updateAccountState(account);
		// 학생 테이블 추가
		managerStudentMapper.insertStudent(student);
		// 학생 승인대기 테이블 삭제
		managerStudentMapper.deleteStudentQueue(accountId);
	}
	

	// 학생 계정 탈퇴
	public void deleteStudentAll(String studentId) {
			
		Account account = new Account();
		account.setAccountId(studentId);
		account.setAccountState("탈퇴");
		
		// 이미지 파일 조회
		MypageImage mi = managerStudentMapper.selectStudentImage(studentId);
		
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
			managerStudentMapper.selectStudentImage(studentId);
		}
		// 학생 계정(탈퇴) 업데이트
		managerStudentMapper.updateStudentAccount(account);
		// 학생 정보 삭제
		managerStudentMapper.deleteStudentOne(studentId);
		// 학생 자격증 삭제
		managerStudentMapper.deleteStudentLicense(studentId);
	}
}
