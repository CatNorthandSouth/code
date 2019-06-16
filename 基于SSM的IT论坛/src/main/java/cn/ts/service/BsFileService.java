package cn.ts.service;

import java.util.Date;
import java.util.List;

import cn.ts.entity.BsFile;

public interface BsFileService {
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

	List<BsFile> selectByFileTitle (BsFile record);
	List<BsFile> selectByTime(Date start, Date end);
	List<BsFile> selectByTimeANDName(Date start, Date end, String fileName);
	int updateByPrimaryKeySelective(BsFile record);
	List<BsFile> selectfileUpId(int fileupid);
	List<BsFile> selectMY_filetimesortyfileType(BsFile bsFile);
	List<BsFile> selectMY_BySearchTimeSortNo(BsFile bsFile);
	List<BsFile> selectMY_BySearchTimeSort(BsFile bsFile);
}
