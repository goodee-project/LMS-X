package gd.fintech.lms.teacher.service;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import gd.fintech.lms.common.PathUtil;
import gd.fintech.lms.teacher.mapper.TeacherLectureArchiveFileMapper;
import gd.fintech.lms.teacher.mapper.TeacherLectureArchiveMapper;
import gd.fintech.lms.vo.LectureArchive;
import gd.fintech.lms.vo.LectureArchiveFile;
import gd.fintech.lms.vo.LectureArchiveForm;

@Service
@Transactional
public class TeacherLectureArchiveService {
	@Autowired private TeacherLectureArchiveMapper teacherLectureArchiveMapper;
	@Autowired private TeacherLectureArchiveFileMapper teacherLectureArchiveFileMapper;
	
	// Logger 사용
	private final Logger logger = LoggerFactory.getLogger(getClass());
	
	// 첨부파일 경로
	private String PATH = PathUtil.PATH() + "archiveFile\\";
	
	// 강좌 자료실 목록
	// 강좌 고유번호(lectureNo)
	public List<LectureArchive> getTeacherLectureArchiveListByPage(int lectureNo, int beginRow, int rowPerPage) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("lectureNo", lectureNo);		// 강좌 고유번호
		map.put("beginRow", beginRow);			// 시작 데이터
		map.put("rowPerPage", rowPerPage);		// 한 페이지당 표시할 데이터 수
		
		List<LectureArchive> lectureArchiveList = teacherLectureArchiveMapper.selectTeacherLectureArchiveListByPage(map);
		
		// [Logger] 자료 목록(lectureArchiveList)
		logger.trace("lectureArchiveList[" + lectureArchiveList + "]");
		
		return lectureArchiveList;
	}
	
	// 자료실 총 데이터 수
	// 강좌 고유번호(lectureNo)
	public int getCountTeacherLectureArchive(int lectureNo) {
		return teacherLectureArchiveMapper.selectTeacherLectureArchiveListCount(lectureNo);
	}
	
	// 자료 조회
	// 자료 고유번호(lectureArchiveNo)
	public List<LectureArchive> selectTeacherLectureArchiveOne(int archiveNo) {
		List<LectureArchive> lectureArchiveOne = teacherLectureArchiveMapper.selectTeacherLectureArchiveOne(archiveNo);
		
		return lectureArchiveOne;
	}
	
	// 자료 조회 조회수 증가
	// 자료 고유번호(lectureArchiveNo)
	public int updateTeacherLectureArchiveCountUp(int archiveNo) {
		return teacherLectureArchiveMapper.updateTeacherLectureArchiveCountUp(archiveNo);
	}
	
	// 자료 입력
	// 자료 Form(LectureArchiveForm)
	public LectureArchive insertTeacherLectureArchive(LectureArchiveForm lectureArchiveForm) {
		LectureArchive lectureArchive = new LectureArchive();
		
		// lectureArchiveForm의 강좌 고유번호, 아이디, 작성자, 제목, 내용을 lectureArchive 객체에 넣어준다
		// 자바스크립트가 데이터베이스에 입력되는 것을 방지
		lectureArchive.setLectureNo(lectureArchiveForm.getLectureNo());
		lectureArchive.setAccountId(lectureArchiveForm.getAccountId());
		lectureArchive.setLectureArchiveWriter(lectureArchiveForm.getLectureArchiveWriter());
		lectureArchive.setLectureArchiveTitle(lectureArchiveForm.getLectureArchiveTitle().replaceAll("(?i)<script", "&lt;script"));
		lectureArchive.setLectureArchiveContent(lectureArchiveForm.getLectureArchiveContent().replaceAll("(?i)<script", "&lt;script"));
		
		// [Logger] 강좌 자료 입력 확인
		logger.trace("lectureArchive - " + lectureArchive);
		
		// Mapper를 통해 lectureArchive의 내용을 입력
		teacherLectureArchiveMapper.insertTeacherLectureArchive(lectureArchive);
		
		List<LectureArchiveFile> lectureArchiveFileList = null;
		
		// 첨부파일이 존재하는 경우
		if (lectureArchiveForm.getLectureArchiveFileList() != null) {
			lectureArchiveFileList = new ArrayList<LectureArchiveFile>();
			
			for (MultipartFile mf : lectureArchiveForm.getLectureArchiveFileList()) {
				LectureArchiveFile laf = new LectureArchiveFile();
				
				// lectureArchive 객체에 존재하는 lectureArchiveNo를 이용해 첨부파일의 외래키를 설정한다
				laf.setLectureArchiveNo(lectureArchive.getLectureArchiveNo());
				
				// 랜덤한 파일 이름을 생성 (UUID)
				String filename = UUID.randomUUID().toString().replace("-", "");
				// 확장자 점 위치 확인
				int p = mf.getOriginalFilename().lastIndexOf(".");
				// 확장자를 잘라내어 소문자로 저장
				String ext = mf.getOriginalFilename().substring(p).toLowerCase();
				
				laf.setLectureArchiveFileUuid(filename + ext);
				laf.setLectureArchiveFileOriginal(mf.getOriginalFilename());
				laf.setLectureArchiveFileSize(mf.getSize());
				laf.setLectureArchiveFileType(mf.getContentType());
				
				lectureArchiveFileList.add(laf);
				
				// 서버에 파일 저장
				try {
					// 파일을 지정된 경로에 저장한다
					mf.transferTo(new File(PATH + filename + ext));
				} catch (Exception e) {	// 예외처리
					// 디버깅 코드 출력
					e.printStackTrace();
					
					// 트랜잭션 중단 및 작업 취소
					throw new RuntimeException();
				}
			}
		}
		
		// 파일이 존재하는 경우
		if (lectureArchiveFileList != null) {
			for (LectureArchiveFile laf : lectureArchiveFileList) {
				// 데이터베이스에 파일 정보 저장
				teacherLectureArchiveFileMapper.insertTeacherLectureArchiveFile(laf);
			}
		}
		
		// lectureArchiveNo를 반환하여 페이지를 이동할 수 있도록 한다
		return lectureArchive;
	}
	
	// 자료 수정
	// 자료 Form(LectureArchiveForm)
	public void updateTeacherLectureArchive(LectureArchiveForm lectureArchiveForm) {
		LectureArchive lectureArchive = new LectureArchive();
		
		// lectureArchiveForm의 자료 고유번호, 강좌 고유번호, 아이디, 작성자, 제목, 내용을 lectureArchive 객체에 넣어준다
		// 자바스크립트가 데이터베이스에 입력되는 것을 방지
		lectureArchive.setLectureArchiveNo(lectureArchiveForm.getLectureArchiveNo());
		lectureArchive.setLectureNo(lectureArchiveForm.getLectureNo());
		lectureArchive.setAccountId(lectureArchiveForm.getAccountId());
		lectureArchive.setLectureArchiveWriter(lectureArchiveForm.getLectureArchiveWriter());
		lectureArchive.setLectureArchiveTitle(lectureArchiveForm.getLectureArchiveTitle().replaceAll("(?i)<script", "&lt;script"));
		lectureArchive.setLectureArchiveContent(lectureArchiveForm.getLectureArchiveContent().replaceAll("(?i)<script", "&lt;script"));
		
		// [Logger] 강좌 자료 입력 확인
		logger.trace("lectureArchive - " + lectureArchive);
		
		// Mapper를 통해 lectureArchive의 내용을 수정
		teacherLectureArchiveMapper.updateTeacherLectureArchive(lectureArchive);
		
		List<LectureArchiveFile> lectureArchiveFileList = null;
		
		// 첨부파일이 존재하는 경우
		if (lectureArchiveForm.getLectureArchiveFileList() != null) {
			lectureArchiveFileList = new ArrayList<LectureArchiveFile>();
			
			for (MultipartFile mf : lectureArchiveForm.getLectureArchiveFileList()) {
				LectureArchiveFile laf = new LectureArchiveFile();
				
				// lectureArchive 객체에 존재하는 lectureArchiveNo를 이용해 첨부파일의 외래키를 설정한다
				laf.setLectureArchiveNo(lectureArchive.getLectureArchiveNo());
				
				// 랜덤한 파일 이름을 생성 (UUID)
				String filename = UUID.randomUUID().toString().replace("-", "");
				// 확장자 점 위치 확인
				int p = mf.getOriginalFilename().lastIndexOf(".");
				// 확장자를 잘라내어 소문자로 저장
				String ext = mf.getOriginalFilename().substring(p).toLowerCase();
				
				laf.setLectureArchiveFileUuid(filename + ext);
				laf.setLectureArchiveFileOriginal(mf.getOriginalFilename());
				laf.setLectureArchiveFileSize(mf.getSize());
				laf.setLectureArchiveFileType(mf.getContentType());
				
				lectureArchiveFileList.add(laf);
				
				// 서버에 파일 저장
				try {
					// 파일을 지정된 경로에 저장한다
					mf.transferTo(new File(PATH + filename + ext));
				} catch (Exception e) {	// 예외처리
					// 디버깅 코드 출력
					e.printStackTrace();
					
					// 트랜잭션 중단 및 작업 취소
					throw new RuntimeException();
				}
			}
		}
		
		// 파일이 존재하는 경우
		if (lectureArchiveFileList != null) {
			for (LectureArchiveFile laf : lectureArchiveFileList) {
				// 데이터베이스에 파일 정보 저장
				teacherLectureArchiveFileMapper.insertTeacherLectureArchiveFile(laf);
			}
		}
	}
	
	// 자료 삭제
	public void deleteTeacherLectureArchive(int archiveNo) {
		// 게시물에 속해있는 첨부파일 목록 조회
		List<String> teacherLectureArchiveFileList = teacherLectureArchiveFileMapper.selectTeacherLectureArchiveFileList(archiveNo);
		
		// 첨부파일 목록에서 파일을 하나씩 불러온다
		for (String s: teacherLectureArchiveFileList) {
			// 첨부파일 경로 + 첨부파일 이름
			File file = new File(PATH + s);
			
			// 파일이 존재하는 경우
			if (file.exists()) {
				// 파일 삭제
				file.delete();
			}
		}
		
		// 데이터베이스의 첨부파일 목록 삭제
		teacherLectureArchiveFileMapper.deleteTeacherLectureArchiveFileAll(archiveNo);
		
		// 데이터베이스의 게시물 삭제
		teacherLectureArchiveMapper.deleteTeacherLectureArchive(archiveNo);
	}
}
