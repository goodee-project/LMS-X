package gd.fintech.lms.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Question;

@Mapper
public interface ManagerQuestionMapper {
	List<Question> selectQuestionList();
}