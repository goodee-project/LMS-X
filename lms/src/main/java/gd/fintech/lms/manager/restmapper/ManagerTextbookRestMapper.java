package gd.fintech.lms.manager.restmapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ManagerTextbookRestMapper {
	public String selectTextbookOne(String textbookIsbn);
}
