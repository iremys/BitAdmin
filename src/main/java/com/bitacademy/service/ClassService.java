package com.bitacademy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bitacademy.dao.ClassDao;
import com.bitacademy.vo.AutoSaveVo;
import com.bitacademy.vo.ClassCateVo;
import com.bitacademy.vo.ClassVo;
import com.bitacademy.vo.TestDateVo;

@Service
public class ClassService {

	@Autowired
    private ClassDao classDao;
	
	/*카테고리 리스트 가져오기*/
    public List<ClassCateVo> getClassCateList(){
        return classDao.selectClassCateList();
    }
    
    /*카테고리 등록하기*/
    public ClassCateVo addClassCate(ClassCateVo classCateVo){
    	classDao.insertClassCate(classCateVo);
        return classCateVo;
    }
    
    /*카테고리 제목만 수정하기*/
    public int modifyClassCateName(ClassCateVo classCateVo) {
        return classDao.updateClassCateName(classCateVo);
    }
    
    /*카테고리 삭제하기*/
    public int removeClassCate(ClassCateVo classCateVo) {
        return classDao.deleteClassCate(classCateVo);
    }
    
    /*카테고리 이동하기*/
    public int moveClassCateParent_id(ClassCateVo classCateVo) {
        return classDao.updateClassCateParent_id(classCateVo);
    }
    
    
    
    
    /*클래스(반) 리스트 가져오기*/
    public List<ClassVo> getClassList(){
        return classDao.selectClassList();
    }
    
    /*클래스(반) 등록하기*/
    public int addClass(ClassVo classVo){
        return classDao.insertClass(classVo);
    }
    
    /*클래스(반) 제목만 수정하기*/
    public int modifyClassName(ClassVo classVo) {
        return classDao.updateClassName(classVo);
    }

    /*클래스(반) 삭제하기*/
    /*과목 삭제하기*/
    @Transactional
    public int removeClass(ClassVo classVo) {
    	//삭제조건(지원자 없는지는 화면에서)
    	//전형일 삭제
    	classDao.deleteTestDateAll(classVo.getClass_id());
    	return classDao.deleteClass(classVo); //삭제된 클래스(반) 리턴;
    }
    
    /*클래스(반) 이동하기*/
    public int moveClassCateClassCate_id(ClassVo classVo) {
        return classDao.updateClassCateClassCate_id(classVo);
    }
    
    /*클래스(반) 상세-기본정보*/
    public ClassVo selectClass(int class_id) {
    	ClassVo classVo = classDao.selectClassInfo(class_id);
    	List<TestDateVo> testDateList = classDao.selectTestDate(class_id);
    	classVo.setTestDateList(testDateList);
        return classVo;
    }
    
    
    @Transactional
    /*클래스(반) 수정*/
    public int updateClass(ClassVo classVo) {
    	//기본정보 수정
    	classDao.updateClassInfo(classVo);
    	
    	//전형일 수정, 저장
    	classDao.deleteTestDateAll(classVo.getClass_id()); //기존 전형일을 모두 지운다.
    	List<TestDateVo> testDateList = classVo.getTestDateList();
    	for(TestDateVo testDateVo: testDateList) {
    		classDao.insertTestDate(testDateVo); //전형일을 모두 저장한다.
    	}	
        return 1;
    }
    
    
    
    
    
    /*클래스(반) 자동 수정*/
    public int modifyClassAuto(AutoSaveVo autoSaveVo ) {
    	return classDao.updateClassAuto(autoSaveVo);
    }
    
       
    /*전형일자 자동 수정 하기*/
    public int modifytestDateAuto(AutoSaveVo autoSaveVo ) {
    	return classDao.updateTestDateAuto(autoSaveVo);
    }
    
    /*커리큘럼 삭제(클래스info 테이블 정보수정)*/
    public int removeCurriAtClass(int class_id ) {
    	return classDao.updateCurriAtClass(class_id);
    }
    
    /*전형일자 등록 하기*/
    public int addTestDateAuto(AutoSaveVo autoSaveVo ) {
    	return classDao.insertTestDateAuto(autoSaveVo);
    }
}


