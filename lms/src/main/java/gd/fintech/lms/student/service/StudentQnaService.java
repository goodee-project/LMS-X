package gd.fintech.lms.student.service;

import java.io.File;
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

import gd.fintech.lms.pathutil.PathUtil;
import gd.fintech.lms.student.mapper.StudentQnaFileMapper;
import gd.fintech.lms.student.mapper.StudentQnaMapper;
import gd.fintech.lms.vo.Question;
import gd.fintech.lms.vo.QuestionFile;
import gd.fintech.lms.vo.QuestionForm;

@Service
@Transactional
public class StudentQnaService {
	
	// Logger
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	// localhost 서버용
	private final String PATH = PathUtil.PATH + "questionFile\\";
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
	
	// 질문 게시판 게시글 작성
	public void insertQuestion(QuestionForm questionForm) {
		//question 변수 생성
		Question question = new Question();
		
		//set -> questionForm.get 질문 내용 추가
		question.setAccountId(questionForm.getAccountId());
		question.setQuestionWriter(questionForm.getQuestionWriter());
		question.setLectureNo(questionForm.getLectureNo());
		question.setQuestionTitle(questionForm.getQuestionTitle());
		question.setQuestionContent(questionForm.getQuestionContent());
		question.setQuestionCreatedate(questionForm.getQuestionCreatedate());
		question.setQuestionUpdatedate(questionForm.getQuestionUpdatedate());
		question.setQuestionPassword(questionForm.getQuestionPassword());
		studentQnaMapper.insertStudentQna(question);
		
		// List questionFile = null로 설정
		List<QuestionFile> questionFile = null;
		
		if (questionForm.getQuestionFile() != null) {
			// ArrayList 생성
			questionFile = new ArrayList<QuestionFile>();
			// for문 생성
			for (MultipartFile mf : questionForm.getQuestionFile()) {
				QuestionFile qf = new QuestionFile();
				
				// 오리지널 파일 네임 뒤에.
				int p = mf.getOriginalFilename().lastIndexOf(".");
				logger.debug("p :" + p);
				
				// 확장자
				String ext = mf.getOriginalFilename().substring(p).toLowerCase();  
				
				// UUID로 생성
				String fileName = UUID.randomUUID().toString().replace("-", " ");
				
				// 파일 정보 저장
				qf.setQuestionNo(question.getQuestionNo());
				qf.setQuestionFileUuid(fileName + ext);
				qf.setQuestionFileOriginal(mf.getOriginalFilename());
				qf.setQuestionFileSize(mf.getSize());
				qf.setQuestionFileType(mf.getContentType());
				qf.setQuestionFileCreatedate(qf.getQuestionFileCreatedate());
				qf.setQuestionFileCount(qf.getQuestionFileCount());
				
				
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
		return;
	}
	// questionNo에 따라 질문 삭제
	public void deleteStudentQnaByQnaNo(int questionNo) {
		List<String> qnaFileList = studentQnaFileMapper.selectStudentQnaFileNameList(questionNo);
		
		// 실제 파일 삭제
		for(String s : qnaFileList) {
			File f = new File(PATH + s);
			f.delete();
		}
		
		studentQnaFileMapper.deleteStudentQnaFile(questionNo);
		
		studentQnaMapper.deleteStudentQna(questionNo);
		
		return;
	}

	// 질문 게시판 게시글 수정
	public void updateStudentQna(QuestionForm questionForm) {
		//question 변수 생성
		Question question = new Question();
		
		//set -> questionForm.get 질문 내용 추가
		question.setQuestionNo(questionForm.getQuestionNo());
		question.setQuestionTitle(questionForm.getQuestionTitle());
		question.setQuestionContent(questionForm.getQuestionContent());
		question.setQuestionUpdatedate(questionForm.getQuestionUpdatedate());
		question.setQuestionPassword(questionForm.getQuestionPassword());
		studentQnaMapper.updateStudentQna(question);
		
		// List questionFile = null로 설정
		List<QuestionFile> questionFile = null;
		
		if (questionForm.getQuestionFile() != null) {
			// ArrayList 생성
			questionFile = new ArrayList<QuestionFile>();
			// for문 생성
			// 파일을 각각 저장하고 파일의 갯수만큼 반복
			for (MultipartFile mf : questionForm.getQuestionFile()) {
				QuestionFile qf = new QuestionFile();
				
				// 오리지널 파일 네임 뒤에.
				int p = mf.getOriginalFilename().lastIndexOf(".");
				logger.debug("p :" + p);
				
				// 확장자
				String ext = mf.getOriginalFilename().substring(p).toLowerCase();  
				
				// UUID로 생성
				String fileName = UUID.randomUUID().toString().replace("-", " ");
				
				// 파일 정보 저장
				qf.setQuestionNo(question.getQuestionNo());
				qf.setQuestionFileUuid(fileName + ext);
				qf.setQuestionFileOriginal(mf.getOriginalFilename());
				qf.setQuestionFileSize(mf.getSize());
				qf.setQuestionFileType(mf.getContentType());
				qf.setQuestionFileCreatedate(qf.getQuestionFileCreatedate());
				qf.setQuestionFileCount(qf.getQuestionFileCount());
				
				//파일에 추가
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
		return;
	}
	
}
