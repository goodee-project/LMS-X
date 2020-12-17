package gd.fintech.lms.restmapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Address;

@Mapper
public interface SignupRestMapper {
	// 아이디 중복검색
	public String selectAccountId(String accountId);
	
	// 학생 테이블 이메일 중복검색
	public String selectStudentEmail(String email);
	
	// 강사 테이블 이메일 중복검색
	public String selectTeacherEmail(String email);
	
	// 운영자 테이블 이메일 중복검색
	public String selectManagerEmail(String email); 
	
	// 학생 대기 테이블 이메일 중복검색
	public String selectStudentQueueEmail(String email);
	
	// 강사 대기 테이블 이메일 중복검색
	public String selectTeacherQueueEmail(String email);
	
	// 운영자 대기 테이블 이메일 중복검색
	public String selectManagerQueueEmail(String email);
	
	// 관리자 테이블 이메일 중복 검색
	public String selectAdminEmail(String email);
	
	// 주소 검색
	public List<Address> selectAddress(Address address);

}
