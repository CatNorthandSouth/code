package cn.ts.serviceimpl;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.ts.entity.BsFile;
import cn.ts.mapper.BsFileMapper;
import cn.ts.service.BsFileService;
@Service
public class BsFileServiceImpl implements BsFileService {

	@Autowired
	BsFileMapper BsFileMapper;
	@Override
	public int deletefile(Integer fileId) {
		// TODO Auto-generated method stub
		return BsFileMapper.deletefile(fileId);
	}

	@Override
	public int insertfile(BsFile record) {
		// TODO Auto-generated method stub
		return BsFileMapper.insertfile(record);
	}

	@Override
	public List<BsFile> selectfile() {
		// TODO Auto-generated method stub
		return BsFileMapper.selectfile();
	}

	@Override
	public List<BsFile> selectfileloadcountsort() {
		// TODO Auto-generated method stub
		return BsFileMapper.selectfileloadcountsort();
	}

	@Override
	public List<BsFile> selectfiletimesort() {
		// TODO Auto-generated method stub
		return BsFileMapper.selectfiletimesort();
	}

	@Override
	public List<BsFile> selectfileloadcountsortByfileType(int num) {
		// TODO Auto-generated method stub
		return BsFileMapper.selectfileloadcountsortByfileType(num);
	}

	@Override
	public List<BsFile> selectfiletimesortyfileType(int num) {
		// TODO Auto-generated method stub
		return BsFileMapper.selectfiletimesortyfileType(num);
	}

	@Override
	public BsFile selectfileByid(int id) {
		// TODO Auto-generated method stub
		return BsFileMapper.selectfileByid(id);
	}

	@Override
	public List<BsFile> selectBySearchLoadCount(BsFile record) {
		// TODO Auto-generated method stub
		return BsFileMapper.selectBySearchLoadCount(record);
	}

	@Override
	public List<BsFile> selectBySearchTimeSort(BsFile record) {
		// TODO Auto-generated method stub
		return BsFileMapper.selectBySearchTimeSort(record);
	}

	@Override
	public List<BsFile> selectBySearchLoadCountNo(BsFile record) {
		// TODO Auto-generated method stub
		return BsFileMapper.selectBySearchLoadCountNo(record);
	}

	@Override
	public List<BsFile> selectBySearchTimeSortNo(BsFile record) {
		// TODO Auto-generated method stub
		return BsFileMapper.selectBySearchTimeSortNo(record);
	}

	@Override
	public List<BsFile> selectByTimeANDName(@Param("starttime") Date start,@Param("endtime") Date end,@Param("fileName") String fileName) {
		// TODO Auto-generated method stub
		return BsFileMapper.selectByTimeANDName(start, end, fileName);
	}

	@Override
	public List<BsFile> selectByTime(@Param("starttime") Date start,@Param("endtime") Date end) {
		// TODO Auto-generated method stub
		return BsFileMapper.selectByTime(start,end);
	}

	@Override
	public List<BsFile> selectByFileTitle(BsFile record) {
		// TODO Auto-generated method stub
		return BsFileMapper.selectByFileTitle(record);
	}

	@Override
	public int updateByPrimaryKeySelective(BsFile record) {
		// TODO Auto-generated method stub
		return BsFileMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public List<BsFile> selectfileUpId(int fileupid) {
		// TODO Auto-generated method stub
		return BsFileMapper.selectfileUpId(fileupid);
	}

	@Override
	public List<BsFile> selectMY_filetimesortyfileType(BsFile bsFile) {
		// TODO Auto-generated method stub
		return BsFileMapper.selectMY_filetimesortyfileType(bsFile);
	}

	@Override
	public List<BsFile> selectMY_BySearchTimeSortNo(BsFile bsFile) {
		// TODO Auto-generated method stub
		return BsFileMapper.selectMY_BySearchTimeSortNo(bsFile);
	}

	@Override
	public List<BsFile> selectMY_BySearchTimeSort(BsFile bsFile) {
		// TODO Auto-generated method stub
		return BsFileMapper.selectMY_BySearchTimeSort(bsFile);
	}



}
