package gd.fintech.lms.student.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.student.mapper.StudentQnaFileMapper;
import gd.fintech.lms.student.mapper.StudentQnaMapper;
import gd.fintech.lms.vo.Question;

@Service
@Transactional
public class StudentQnaService {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	//	private final String PATH = "/////"
	@Autowired StudentQnaMapper studentQnaMapper;
	@Autowired StudentQnaFileMapper studentQnaFileMapper;
	
	// 학생 : 질문 게시판 상세보기
	public Question getStudentQnaOne(int questionNo) {
		return studentQnaMapper.selectStudentQnaOne(questionNo);
	}
	
	// 학생 : 질문 게시판 리스트 페이지별 보기 (페이징)
	public List<Question> getStudenQnaListByPage(Map<String, Object>map) {
		return studentQnaMapper.selectStudentQnaListByPage(map);
	}
	
	// 질문 게시판의 게시글 수를 확인, endPage 수를 구하기
	public int getCountStudentQnaList(int rowPerPage) {
		int endPage = studentQnaMapper.selectQnaCount();
		
		if(endPage % rowPerPage == 0) {
			return endPage / rowPerPage;
		} else {
			return endPage / rowPerPage +1;
		}
		
	}
}
