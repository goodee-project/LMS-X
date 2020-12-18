package gd.fintech.lms.manager.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Faq;

@Mapper
public interface ManagerFaqMapper {
	List<Faq> selectFaqList(); // FAQ 리스트
	int insertFaq(Faq faq); // FAQ 추가
	int deleteFaq(int faqNo); // FAQ 삭제
	int updateFaq(Faq faq); // FAQ 수정
	Faq selectFaqOne(int faqNo); // FAQ 정보
}
