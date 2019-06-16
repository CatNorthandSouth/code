package cn.ts.mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.ts.entity.BsFile;

public interface BsFileMapper {
    int deletefile(Integer fileId);
    int insertfile(BsFile record);
    List<BsFile> selectfile();
	List<BsFile> selectfileloadcountsort();
	List<BsFile> selectfiletimesort();
	List<BsFile> selectfileloadcountsortByfileType(int num);
	List<BsFile> selectfiletimesortyfileType(int num);
	BsFile selectfileByid(int id);
	List<BsFile> selectBySearchLoadCount (BsFile record);
	List<BsFile> selectBySearchTimeSort (BsFile record);
	List<BsFile> selectBySearchLoadCountNo (BsFile record);
	List<BsFile> selectBySearchTimeSortNo (BsFile record);
	List<BsFile> selectByTimeANDName (@Param("starttime") Date start,@Param("endtime") Date end,@Param("fileName") String fileName);
	List<BsFile> selectByTime (@Param("starttime") Date start,@Param("endtime") Date end);
	List<BsFile> selectByFileTitle (BsFile record);
	int updateByPrimaryKeySelective(BsFile record);
	List<BsFile> selectfileUpId(int fileupid);
	List<BsFile> selectMY_filetimesortyfileType(BsFile bsFile);
	List<BsFile> selectMY_BySearchTimeSortNo(BsFile bsFile);
	List<BsFile> selectMY_BySearchTimeSort(BsFile bsFile);
}