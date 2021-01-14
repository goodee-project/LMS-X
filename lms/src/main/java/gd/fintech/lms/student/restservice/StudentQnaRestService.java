package gd.fintech.lms.student.restservice;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gd.fintech.lms.common.PathUtil;
import gd.fintech.lms.student.restmapper.StudentQnaRestMapper;

@Service
public class StudentQnaRestService {
	@Autowired StudentQnaRestMapper studentQnaRestMapper;
	@Autowired private PathUtil pathUtil;
	
	
	// questionFile 한개만 삭제
	public int deleteStudentQnaFileOne(String questionFileUuid, HttpServletRequest request) {
		
		File f = new File(pathUtil.PATH("questionFile", request) + questionFileUuid);
		f.delete();
		
		return studentQnaRestMapper.deleteQnaFileOne(questionFileUuid);
	}
	
	// 질문 게시판 첨부파일 다운로드 횟수 증가
	public int updateQnaFileCount(String questionFileUuid) {
		
		studentQnaRestMapper.updateQnaFileCount(questionFileUuid);
		
		return studentQnaRestMapper.selectQnaFileCount(questionFileUuid);
	}
	
	// 질문 비밀글 비밀번호 확인
	public String selectQnaPassword(int questionNo) {
		return studentQnaRestMapper.selectQnaPassword(questionNo);
	}
	
}
