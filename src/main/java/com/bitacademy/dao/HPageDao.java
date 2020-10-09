package com.bitacademy.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bitacademy.vo.FileVo;
import com.bitacademy.vo.HCateVo;
import com.bitacademy.vo.HContentVo;
import com.bitacademy.vo.HIncludeVo;

@Repository
public class HPageDao {

	@Autowired
    private SqlSession sqlSession;

    /*코스카테고리(홈페이지) 리스트 가져오기*/
    public List<HCateVo> selectHCateList(){
        return sqlSession.selectList("hPage.selectHCateList");
    }
    
    /*코스(홈페이지) 리스트 가져오기 by hCourseCate_id*/
    public List<HContentVo> selectHContentList(int hCate_id){
        return sqlSession.selectList("hPage.selectHContentList", hCate_id);
    }
    
    
    /*컨텐츠 1차 등록(제목, 카테고리)하기*/
    public int insertHContent(HContentVo hContentVo) {
    	return sqlSession.insert("hPage.insertHContent", hContentVo);
    }
    
    /* 컨텐츠 상세 가져오기*/
    public HContentVo selectHContent(int hContent_id) {
    	return sqlSession.selectOne("hPage.selectHContent", hContent_id);
    }
    
    
    /*aside 리스트 가져오기*/
    public List<HIncludeVo> selectAsideList() {
    	return sqlSession.selectList("hPage.selectAsideList");
    }
    
    /*컨텐츠수정하기*/
    public int updateHContnet(HContentVo hContentVo) {
    	return sqlSession.update("hPage.updateHContnet", hContentVo);
    }
    
    /*컨텐츠삭제하기*/
    public int deleteHContent(int hContent_id) {
    	return sqlSession.delete("hPage.deleteHContent", hContent_id);
    }
    
    /*컨텐츠 파일첨부 하기*/
    public int insertHContentFile(FileVo fileVo) {
    	return sqlSession.insert("hPage.insertHContentFile", fileVo);
    }
    
    /*컨텐츠 파일첨부 리스트 가져오기*/
    public List<FileVo> selectHContentFileList(int parent_id) {
    	return sqlSession.selectList("hPage.selectHContentFileList", parent_id);
    }
    
    /* 컨텐츠 첨부파일 삭제하기*/
    public int deleteHContentFile(int file_id) {
    	return sqlSession.delete("hPage.deleteHContentFile", file_id);
    }
    
    
}
