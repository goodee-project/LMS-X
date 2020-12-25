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

import gd.fintech.lms.common.PathUtil;
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
	private String PATH = PathUtil.PATH("syllabusFile");
	
	// 강의계획서 상세보기
	public Syllabus selectSyllabusOne(int lectureNo) {
		return teacherSyllabusMapper.selectTeacherSyllabusOne(lectureNo);
	}
	
	// 첨부파일 등록
	public SyllabusForm insertTeacherSyllabus(SyllabusForm syllabusForm) {
		//System.out.println("Debug : " + syllabusForm);
		List<Syllabus> syllabusList = null;
		// 첨부파일이 존재하는 경우
		if (syllabusForm.getSyllabusFileList() != null) {
			//System.out.println("Debug2 : 파일 리스트 if 문 진입" );
			syllabusList = new ArrayList<Syllabus>();
			
			for (MultipartFile mf : syllabusForm.getSyllabusFileList()) {
				//System.out.println("Debug3 : MultipartFile For문 진입 ");
				Syllabus s = new Syllabus();
				
				s.setLectureNo(syllabusForm.getLectureNo());
				
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
				
				//System.out.println("Debug 4: " + filename + ext);
				
				//System.out.println("Debug 5 : 리스트 추가");
				
				syllabusList.add(s);
				
				// 서버에 파일 저장
				try {
					// 파일을 지정된 경로에 저장
					mf.transferTo(new File(PATH + filename + ext));
					//System.out.println("Debug6 : 파일 저장");
				} catch (Exception e) { // 예외처리
					// 디버깅 코드 출력
					e.printStackTrace();
					
					// 트랜잭션 중단
					throw new RuntimeException();
				}
			}
		}
		
		// 파일이 존재하는 경우
		if(syllabusList != null) {
			for (Syllabus s : syllabusList) {
				// 데이터베이스에 파일 정보 저장
				teacherSyllabusMapper.insertTeacherSyllabus(s);
			}
		}
		return syllabusForm;
	}
	
	// 파일 삭제
	public void deleteTeacherSyllabus(int lectureNo) {
		// 강좌에 속해 있는 첨부파일 목록 조회
		List<String> teacherSyllabusFileList = teacherSyllabusMapper.selectTeacherSyllabusFileList(lectureNo);
		
		// 첨부파일 목록에서 파일을 하나씩 불러온다
		for (String s : teacherSyllabusFileList) {
			// 첨부파일 경로 + 첨부파일 이름
			File file = new File(PATH + s);
			
			// 파일이 존재하는 경우
			if (file.exists()) {
				// 파일 삭제
				file.delete();
			}
		}
		
		//데이터베이스의 첨부 파일 목록 삭제
		teacherSyllabusMapper.delteTeacherSyllabus(lectureNo);
	}
	
}
