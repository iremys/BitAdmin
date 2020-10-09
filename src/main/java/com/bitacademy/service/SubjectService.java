package com.bitacademy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitacademy.dao.SubjectDao;
import com.bitacademy.vo.SubjectCateVo;
import com.bitacademy.vo.SubjectVo;

@Service
public class SubjectService {
   
	@Autowired
    private SubjectDao subjectDao;
	
    /*카테고리 리스트 가져오기*/
    public List<SubjectCateVo> getSubjectCateList(){
        return subjectDao.selectSubjectCateList();
    }
    
    /*카테고리 등록하기*/
    public SubjectCateVo addSubjectCate(SubjectCateVo subjectCateVo){
    	subjectDao.insertSubjectCate(subjectCateVo);
        return subjectCateVo;
    }
    
    /*카테고리 제목만 수정하기*/
    public int modifySubjectCateName(SubjectCateVo subjectCateVo) {
        return subjectDao.updateSubjectCateName(subjectCateVo);
    }
    
    /*카테고리 삭제하기*/
    public int removeSubjectCate(SubjectCateVo subjectCateVo) {
        return subjectDao.deleteSubjectCate(subjectCateVo);
    }
    
    /*카테고리 이동하기*/
    public int moveSubjectCateParent_id(SubjectCateVo subjectCateVo) {
        return subjectDao.updateSubjectCateParent_id(subjectCateVo);
    }
    
    
    /*과목 리스트 가져오기*/
    public List<SubjectVo> getSubjectList(){
        return subjectDao.selectSubjectList();
    }
    
    
    /*과목 등록하기*/
    public SubjectVo addSubject(SubjectVo subjectVo){
    	subjectDao.insertSubject(subjectVo);
        return subjectVo;
    }
    
    /*과목정보 제목만 수정하기*/
    public int modifySubjectName(SubjectVo subjectVo) {
        return subjectDao.updateSubjectName(subjectVo);
    }
    
    
    /*과목 삭제하기*/
    public int removeSubject(SubjectVo subjectVo) {
    	//커리-과목 에 사용되었는지 검사는 화면에서
    	return subjectDao.deleteSubject(subjectVo); //삭제된 과목수 리턴;
    }
    
    /*과목 이동*/
    public int moveSubjectCateSubjectCate_id(SubjectVo subjectVo) {
        return subjectDao.updateSubjectCateSubjectCate_id(subjectVo);
    }
    
    
    
    
    /*과목정보 가져오기*/
    public SubjectVo getSubject(SubjectVo subjectVo) {
        return subjectDao.selectSubject(subjectVo);
    }
    
    /*과목정보 수정하기*/
    public int modifySubject(SubjectVo subjectVo) {
        return subjectDao.updateSubject(subjectVo);
    }
   

    
}
