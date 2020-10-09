package com.bitacademy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitacademy.dao.HIncDao;
import com.bitacademy.vo.HIncCateVo;
import com.bitacademy.vo.HIncludeVo;

@Service
public class HIncService {

	@Autowired
	private HIncDao hIncDao;
	
	/*카테고리 데이타 리스트 가져오기*/
	public List<HIncCateVo> selectHIncCate(){
		return hIncDao.selectHIncCate();
	}

	/*이클루드 데이타 리스트 가져오기*/
	public List<HIncludeVo> selectHIncludeList(){
		return hIncDao.selectHIncludeList();
	}
	
	 /*인크루드 데이타 가져오기*/
    public HIncludeVo getHInclude(int hInclude_id){
        return hIncDao.getHInclude(hInclude_id);
    }
	
    /*인크루드 데이타 저장하기*/
    public int modifyHInclude(HIncludeVo hIncludeVo){
        return hIncDao.updateHInclude(hIncludeVo);
    }
	
}
