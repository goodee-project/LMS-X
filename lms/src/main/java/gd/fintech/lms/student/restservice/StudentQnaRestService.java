package gd.fintech.lms.student.restservice;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gd.fintech.lms.common.PathUtil;
import gd.fintech.lms.student.restmapper.StudentQnaRestMapper;

@Service
public class StudentQnaRestService {
	@Autowired StudentQnaRestMapper studentQnaRestMapper;
	
	private final String PATH = PathUtil.PATH() + "questionFile\\";
	
	
	// questionFile 한개만 삭제
	public int deleteStudentQnaFileOne(String questionFileUuid) {
		
		File f = new File(PATH + questionFileUuid);
		f.delete();
		
		return studentQnaRestMapper.deleteQnaFileOne(questionFileUuid);
	}
	
	// 질문 게시판 첨부파일 다운로드 횟수 증가
	public int updateQnaFileCount(String questionFileUuid) {
		
		studentQnaRestMapper.updateQnaFileCount(questionFileUuid);
		
		return studentQnaRestMapper.selectQnaFileCount(questionFileUuid);
	}
	
	
}
