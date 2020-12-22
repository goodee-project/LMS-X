package gd.fintech.lms.student.restservice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gd.fintech.lms.student.restmapper.StudentSyllabusRestMapper;

@Service
public class StudentSyllabusRestService {
	@Autowired StudentSyllabusRestMapper StudentSyllabusRestMapper;
	
	// 강의 계획서 게시판 첨부파일 다운로드 횟수 증가
	public int updateSyllabusFileCount(String syllabusFileUuid) {
		
		StudentSyllabusRestMapper.updateStudentSyllabusFileCount(syllabusFileUuid);
		
		return StudentSyllabusRestMapper.selectStudentSyllabusFileCount(syllabusFileUuid);
	}
}
