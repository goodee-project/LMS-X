package gd.fintech.lms.teacher.service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import gd.fintech.lms.pathutil.PathUtil;
import gd.fintech.lms.teacher.mapper.TeacherSyllabusMapper;
import gd.fintech.lms.vo.Syllabus;
import gd.fintech.lms.vo.SyllabusForm;

@Service
@Transactional
public class TeacherSyllabusService {
	@Autowired private TeacherSyllabusMapper teacherSyllabusMapper;
	
	// Logger 사용
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// 첨부파일 경로
	File file = new File("");
	String PATH = PathUtil.PATH + "syallbusFile\\";
	
	// 강의계획서 상세보기
	public Syllabus selectSyllabusOne(int lectureNo) {
		return teacherSyllabusMapper.selectTeacherSyllabusOne(lectureNo);
	}
	
	// 첨부파일 등록
	public Syllabus insertTeacherSyllabus(SyllabusForm syllabusForm) {
		Syllabus syllabus = new Syllabus();
		// [Logger] 강의계획서 입력 확인
		logger.trace("syllabus : " + syllabus);
		
		//Mapper 를 통해 syllabus의 내용을 입력
		teacherSyllabusMapper.insertTeacherSyllabus(syllabus);
		
		List<Syllabus> syllabusFileList = null;
		
		// 첨부파일이 존재하는 경우
		if (syllabusForm.getSyllabusFileList() != null) {
			syllabusFileList = new ArrayList<Syllabus>();
			
			for (MultipartFile mf : syllabusForm.getSyllabusFileList()) {
				Syllabus s = new Syllabus();
				
				// 랜덤한 파일 이름을 생성(UUID)
				String filename = UUID.randomUUID().toString().replace("-", "");
				// 확장자 점 위치 확인
				int p = mf.getOriginalFilename().lastIndexOf(".");
				// 확장자를 잘라내어 소문자로 저장
				String ext = mf.getOriginalFilename().substring(p).toLowerCase();
				
				s.setSyllabusFileUuid(filename + ext);
				s.setSyllabusFileOriginal(mf.getOriginalFilename());
				s.setSyllabusFileSize(mf.getSize());
				s.setSyllabusFileType(mf.getContentType());
				
				syllabusFileList.add(s);
				
				// 서버에 파일 저장
				try {
					// 파일을 지정된 경로에 저장
					mf.transferTo(new File(PATH + filename + ext));
				} catch (Exception e) { // 예외처리
					// 디버깅 코드 출력
					e.printStackTrace();
					
					// 트랜잭션 중단
					throw new RuntimeException();
				}
			}
		}
		
		// 파일이 존재하는 경우
		if(syllabusFileList != null) {
			for (Syllabus s : syllabusFileList) {
				// 데이터베이스에 파일 정보 저장
				teacherSyllabusMapper.insertTeacherSyllabus(s);
			}
		}
		
		return syllabus;
	}
}
