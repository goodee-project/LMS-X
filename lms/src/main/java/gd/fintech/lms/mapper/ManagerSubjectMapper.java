package gd.fintech.lms.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Subject;

@Mapper
public interface ManagerSubjectMapper {
	List<Subject> selectSubjectList();
}
