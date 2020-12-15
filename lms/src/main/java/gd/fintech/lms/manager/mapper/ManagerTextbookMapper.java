package gd.fintech.lms.manager.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Textbook;

@Mapper
public interface ManagerTextbookMapper {
	List<Textbook> selectTextbookList();
}
