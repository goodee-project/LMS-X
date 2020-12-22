package gd.fintech.lms.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

// 강의 계획서 Form Vo
// 강의 계획서 입력 시 사용된다.

@Data
public class SyllabusForm {
	private int lectureNo; // 강좌 고유번호
	private List<MultipartFile> syllabusFileList; // 강의 계획서 첨부파일 목록
}