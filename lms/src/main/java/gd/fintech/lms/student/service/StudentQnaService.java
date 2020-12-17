package gd.fintech.lms.student.service;

import java.io.File;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import gd.fintech.lms.student.mapper.StudentQnaFileMapper;
import gd.fintech.lms.student.mapper.StudentQnaMapper;
import gd.fintech.lms.vo.Question;
import gd.fintech.lms.vo.QuestionFile;
import gd.fintech.lms.vo.QuestionForm;

@Service
@Transactional
public class StudentQnaService {
	// aws 서버용
	private final String PATH = "C:\\Users\\wntjd\\Documents\\teamproject\\maven.1608002103348\\lms\\src\\main\\webapp\\resource\\questionFile\\";
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
	public int getCountStudentQnaList() {
		return studentQnaMapper.selectQnaCount();
	}
	
	// 질문 게시판 게시글 작성 폼
	public void insertQuestion(QuestionForm questionForm) {
		//question 변수 생성
		Question question = new Question();
		
		//set -> questionForm.get
		question.setQuestionTitle(questionForm.getQuestionTitle());
		question.setQuestionContent(questionForm.getQuestionContent());
		question.setQuestionCreatedate(questionForm.getQuestionCreatedate());
		question.setQuestionUpdatedate(questionForm.getQuestionUpdatedate());
		studentQnaMapper.insertStudentQna(question);
		
		// List questionFile = null로 설정
		List<QuestionFile> questionFile = null;
		
		if (questionForm.getQuestionFile() != null) {
			//ArrayList 생성
			questionFile = new ArrayList<QuestionFile>();
			//for문 생성
			for (MultipartFile mf : questionForm.getQuestionFile()) {
				QuestionFile qf = new QuestionFile();
				qf.setQuestionNo(question.getQuestionNo());
				
				// 오리지널 파일 네임 뒤에.을 붙여줘서 확장자 형식 구분
				int p = mf.getOriginalFilename().lastIndexOf(".");
				logger.debug("p :" + p);
				
				String ext = qf.getQuestionFileOriginal().substring(p).toLowerCase();
				
				//UUID로 생성
				String fileName = UUID.randomUUID().toString().replace("-", " ");
				
				qf.setQuestionNo(question.getQuestionNo());
				qf.setQuestionFileUuid(fileName + ext);
				qf.setQuestionFileSize(qf.getQuestionFileSize());
				qf.setQuestionFileType(qf.getQuestionFileType());
				questionFile.add(qf);

				// try ~ catch 문 생성 (예외처리)
				try {
					mf.transferTo(new File(PATH + fileName + ext));
					logger.debug("debug :" + PATH + fileName + ext);

				} catch (Exception e) {
					e.printStackTrace();
					throw new RuntimeException();
				}
			}
		}
		if (questionFile != null) {
			for (QuestionFile qf : questionFile) {
				studentQnaFileMapper.insertStudentQnaFile(qf);
			}
		}
	}
}
