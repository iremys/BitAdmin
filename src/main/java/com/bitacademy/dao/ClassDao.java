package com.bitacademy.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bitacademy.vo.AutoSaveVo;
import com.bitacademy.vo.ClassCateVo;
import com.bitacademy.vo.ClassVo;
import com.bitacademy.vo.TestDateVo;

@Repository
public class ClassDao {

	@Autowired
    private SqlSession sqlSession;

    /*카테고리 리스트 가져오기*/
    public List<ClassCateVo> selectClassCateList(){
        return sqlSession.selectList("class.selectClassCateList");
    }
    
    /*카테고리 등록하기*/
    public int insertClassCate(ClassCateVo classCateVo){
        return sqlSession.insert("class.insertClassCate", classCateVo);
    }
    
    /*카테고리 제목만 수정하기*/
    public int updateClassCateName(ClassCateVo classCateVo) {
        return sqlSession.update("class.updateClassCateName", classCateVo);
    }
    
    /*카테고리 삭제하기*/
    public int deleteClassCate(ClassCateVo classCateVo) {
        return sqlSession.delete("class.deleteClassCate", classCateVo);
    }
    
    /*카테고리 이동하기*/
    public int updateClassCateParent_id(ClassCateVo classCateVo) {
        return sqlSession.update("class.updateClassCateParent_id", classCateVo);
    }
    
    
    
    
    /*클래스(반) 리스트 가져오기*/
    public List<ClassVo> selectClassList(){
        return sqlSession.selectList("class.selectClassList");
    }
    
    
    /*클래스(반) 등록하기*/
    public int insertClass(ClassVo classVo){
        return sqlSession.insert("class.insertClass", classVo);
    }
    
    /*클래스(반) 제목만 수정하기*/
    public int updateClassName(ClassVo classVo){
        return sqlSession.update("class.updateClassName", classVo);
    }
    
    /*클래스(반) 삭제하기*/
    public int deleteClass(ClassVo classVo){
        return sqlSession.delete("class.deleteClass", classVo);
    }
    
    
    /*클래스(반) 이동*/
    public int updateClassCateClassCate_id(ClassVo classVo) {
        return sqlSession.update("class.updateClassCateClassCate_id", classVo);
    }
    
    /*클래스(반) 상세-기본정보*/
    public ClassVo selectClassInfo(int class_id) {
        return sqlSession.selectOne("class.selectClassInfo", class_id);
    }
    
    /*클래스(반) 수정-기본정보*/
    public int updateClassInfo(ClassVo classVo) {
        return sqlSession.update("class.updateClassInfo", classVo);
    }
    
   
    
    
   
    
    
    /*전형일 가져오기*/
    public List<TestDateVo> selectTestDate(int class_id ) {
    	return sqlSession.selectList("class.selectTestDate", class_id);
    }
    
    /*전형일 등록하기*/
    public int insertTestDate(TestDateVo testDateVo) {
        return sqlSession.insert("class.insertTestDate", testDateVo);
    }
    
    /*전형일 수정하기*/
    public int updateTestDate(TestDateVo testDateVo) {
        return sqlSession.update("class.updateTestDate", testDateVo);
    }
    /*전형일자 모두 삭제하기*/
    public int deleteTestDateAll(int class_id) {
    	return sqlSession.insert("class.deleteTestDateAll", class_id);
    }
    
    
    
    
    
    
    

    /*클래스(반) 자동 수정*/
    public int updateClassAuto(AutoSaveVo autoSaveVo ) {
    	return sqlSession.update("class.updateClassInfoAuto", autoSaveVo);
    }
    
    /*전형일자 자동 수정 하기*/
    public int updateTestDateAuto(AutoSaveVo autoSaveVo ) {
    	return sqlSession.update("class.updateTestDateAuto", autoSaveVo);
    }
    
    /*커리큘럼 삭제(클래스info 테이블 정보수정)*/
    public int updateCurriAtClass(int class_id ) {
    	return sqlSession.update("class.updateCurriAtClass", class_id);
    }
    
    
    /*전형일자 등록 하기*/
    public int insertTestDateAuto(AutoSaveVo autoSaveVo ) {
    	return sqlSession.insert("class.insertTestDateAuto", autoSaveVo);
    }
    
  
}
