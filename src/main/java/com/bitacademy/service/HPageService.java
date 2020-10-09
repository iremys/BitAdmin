package com.bitacademy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.bitacademy.dao.HPageDao;
import com.bitacademy.util.FileUpload;
import com.bitacademy.vo.FileVo;
import com.bitacademy.vo.HCateVo;
import com.bitacademy.vo.HContentVo;
import com.bitacademy.vo.HIncludeVo;

@Service
public class HPageService {

	@Autowired
    private HPageDao hPageDao;
	
    /*코스카테고리(홈페이지) 리스트 가져오기*/
    public List<HCateVo> getHCateList(){
        return hPageDao.selectHCateList();
    }
    
    /*코스(홈페이지) 리스트 가져오기 by hCourseCate_id*/
    public List<HContentVo> getHContentList(int hCate_id){
        return hPageDao.selectHContentList(hCate_id);
    }
    
    
    /*컨텐츠 등록(제목, 카테고리번호) 하기                                                   */
    @Transactional
    public int addHContent(HContentVo hContentVo) {
    	return hPageDao.insertHContent(hContentVo);
    }
    
    /* 컨텐츠 상세 가져오기*/
    public HContentVo getHContet(int hContent_id) {
    	return hPageDao.selectHContent(hContent_id);
    }
    
    
    /*aside 리스트 가져오기*/
    public List<HIncludeVo> getAsideList() {
    	return hPageDao.selectAsideList();
    }
    
    
    /*컨텐츠수정하기*/
    public int modifyHContnet(HContentVo hContentVo) {
    	return hPageDao.updateHContnet(hContentVo);
    }
    
    
    /*컨텐츠삭제하기*/
    public int removeHContent(int hContent_id) {
    	return hPageDao.deleteHContent(hContent_id);
    }
    
    /*컨텐츠 파일첨부 하기*/
    public int fileUpload(MultipartFile file, int hContent_id) {
    	FileUpload fileUpload = new FileUpload();
    	FileVo fileVo = fileUpload.upload("hContent", file);
    	fileVo.setParent_id(hContent_id);
    	return hPageDao.insertHContentFile(fileVo);
    }
    
    /*컨텐츠 파일첨부 리스트 가져오기*/
    public List<FileVo> getHContentFileList(int parent_id) {
    	return hPageDao.selectHContentFileList(parent_id);
    }
    
    /* 컨텐츠 첨부파일 삭제하기*/
    public int removeHContentFile(int file_id) {
    	return hPageDao.deleteHContentFile(file_id);
    }
}


