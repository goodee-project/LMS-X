package gd.fintech.lms.manager.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.FaqCategory;

@Mapper
public interface ManagerFaqCategoryMapper {
	public List<FaqCategory> selectFaqCategoryList();
}
