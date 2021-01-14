package gd.fintech.lms.student.service;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import gd.fintech.lms.common.PathUtil;
import gd.fintech.lms.student.mapper.StudentReportFileMapper;
import gd.fintech.lms.student.mapper.StudentReportMapper;
import gd.fintech.lms.vo.ClassRegistration;
import gd.fintech.lms.vo.Report;
import gd.fintech.lms.vo.ReportSubmit;
import gd.fintech.lms.vo.ReportSubmitFile;
import gd.fintech.lms.vo.ReportSubmitForm;

@Service
@Transactional
public class StudentReportService {
	@Autowired StudentReportMapper studentReportMapper;
	@Autowired StudentReportFileMapper studentReportFileMapper;
	@Autowired private PathUtil pathUtil;
	// Logger
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	
	// 과제 제출 (입력)
	public void insertReportSubmit(ReportSubmitForm reportSubmitForm, HttpServletRequest request) {
		// 과제 내용 추가
		ReportSubmit reportSubmit = new ReportSubmit();
		reportSubmit.setReportNo(reportSubmitForm.getReportNo());
		reportSubmit.setAccountId(reportSubmitForm.getAccountId());
		reportSubmit.setReportSubmitWriter(reportSubmitForm.getReportSubmitWriter());
		reportSubmit.setReportSubmitTitle(reportSubmitForm.getReportSubmitTitle());
		reportSubmit.setReportSubmitContent(reportSubmitForm.getReportSubmitContent());
		studentReportMapper.insertReportSubmit(reportSubmit);
		
		// 공지사항 파일 추가
		// 파일이 들어 올 시 실제 파일 저장, 리스트에 파일 정보 저장
		List<ReportSubmitFile> reportFile = null;
		if(reportSubmitForm.getReportSubmitFileList() != null) {
			reportFile = new ArrayList<ReportSubmitFile>();
			
			// 파일을 각각 저장 -> 파일의 개수만큼 반복
			for(MultipartFile mf : reportSubmitForm.getReportSubmitFileList()) {
				ReportSubmitFile rsf = new ReportSubmitFile();
				int p = mf.getOriginalFilename().lastIndexOf("."); // 확장자 저장
				String ext = mf.getOriginalFilename().substring(p).toLowerCase(); // 확장자
				String filename = UUID.randomUUID().toString().replace("-", ""); // uuid 생성

				// 파일 정보 저장
				rsf.setReportSubmitNo(reportSubmit.getReportSubmitNo());
				rsf.setReportSubmitFileOriginal(mf.getOriginalFilename()); // 오리지널 이름
				rsf.setReportSubmitFileUuid(filename + ext); // uuid
				rsf.setReportSubmitFileSize(mf.getSize());
				rsf.setReportSubmitFileType(mf.getContentType());
				
				// 리스트에 저장
				reportFile.add(rsf);
				
				try {
					mf.transferTo(new File(pathUtil.PATH("reportSubmitFile", request) + filename + ext));
				} catch(Exception e) {
					e.printStackTrace();
					throw new RuntimeException();
				}
			}
		}
		// logger
		logger.trace("reportFile["+reportFile+"]");
		
		// 파일이 들어 올 시 리스트를 DB에 저장
		if(reportFile != null) {
			for(ReportSubmitFile nf : reportFile) {
				studentReportFileMapper.insertReportSubmitFile(nf);
			}
		}
			
		return;
	}
	
	// 강사가 출제한 과제 목록
	public List<Report> selectReportListByPage(Map<String, Object> map){
		return studentReportMapper.selectReportListByPage(map);
	}
	// 강사가 출제한 과제 개수
	public int selectStudentReportListEndPage(int classNo){
		return studentReportMapper.selectReportListCount(classNo);	
	}
	// 과제 상세보기
	public Report selectReportOne(int reportNo) {
		return studentReportMapper.selectReportOne(reportNo);
	}
	// 제출한 과제 상세보기
	public ReportSubmit selectReportSubmitOne(ReportSubmit reportSubmit) {
		return studentReportMapper.selectReportSubmitOne(reportSubmit);
	}
	
	// 과제 제출 수정
	public void updateReportSubmit(ReportSubmitForm reportSubmitForm, HttpServletRequest request) {
		// 과제 내용 추가
		ReportSubmit reportSubmit = new ReportSubmit();
		reportSubmit.setReportSubmitNo(reportSubmitForm.getReportSubmitNo());
		reportSubmit.setReportSubmitTitle(reportSubmitForm.getReportSubmitTitle());
		reportSubmit.setReportSubmitContent(reportSubmitForm.getReportSubmitContent());
		studentReportMapper.updateReportSubmit(reportSubmit);
		
		// 공지사항 파일 추가
		// 파일이 들어 올 시 실제 파일 저장, 리스트에 파일 정보 저장
		List<ReportSubmitFile> reportFile = null;
		if(reportSubmitForm.getReportSubmitFileList() != null) {
			reportFile = new ArrayList<ReportSubmitFile>();
			
			// 파일을 각각 저장 -> 파일의 개수만큼 반복
			for(MultipartFile mf : reportSubmitForm.getReportSubmitFileList()) {
				ReportSubmitFile rsf = new ReportSubmitFile();
				int p = mf.getOriginalFilename().lastIndexOf("."); // 확장자 저장
				String ext = mf.getOriginalFilename().substring(p).toLowerCase(); // 확장자
				String filename = UUID.randomUUID().toString().replace("-", ""); // uuid 생성

				// 파일 정보 저장
				rsf.setReportSubmitNo(reportSubmit.getReportSubmitNo());
				rsf.setReportSubmitFileOriginal(mf.getOriginalFilename()); // 오리지널 이름
				rsf.setReportSubmitFileUuid(filename + ext); // uuid
				rsf.setReportSubmitFileSize(mf.getSize());
				rsf.setReportSubmitFileType(mf.getContentType());
				
				// 리스트에 저장
				reportFile.add(rsf);
				
				try {
					mf.transferTo(new File(pathUtil.PATH("reportSubmitFile", request) + filename + ext));
				} catch(Exception e) {
					e.printStackTrace();
					throw new RuntimeException();
				}
			}
		}
		// logger
		logger.trace("reportFile["+reportFile+"]");
		
		// 파일이 들어 올 시 리스트를 DB에 저장
		if(reportFile != null) {
			for(ReportSubmitFile nf : reportFile) {
				studentReportFileMapper.insertReportSubmitFile(nf);
			}
		}
			
		return;
	}
	
	// 과제 제출 삭제하기
	public void deleteReportSubmit(int reportSubmitNo, HttpServletRequest request) {
		
		// 실제 파일 이름들 가져오기
		List<String> fileNameList= studentReportFileMapper.selectReportSubmitFileName(reportSubmitNo);
		for(String fn : fileNameList) {
			File f = new File(pathUtil.PATH("reportSubmitFile", request) + fn);
			f.delete();		
		}
		// DB 삭제
		studentReportFileMapper.deleteReportSubmitFile(reportSubmitNo);
		studentReportMapper.deleteReportSubmit(reportSubmitNo);
	}
}
