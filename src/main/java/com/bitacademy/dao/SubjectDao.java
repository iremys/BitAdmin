package com.bitacademy.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bitacademy.vo.SubjectCateVo;
import com.bitacademy.vo.SubjectVo;

@Repository
public class SubjectDao {
    
	@Autowired
    private SqlSession sqlSession;

    /*카테고리 리스트 가져오기*/
    public List<SubjectCateVo> selectSubjectCateList(){
        return sqlSession.selectList("subject.selectSubjectCateList");
    }
    
    /*카테고리 등록하기*/
    public int insertSubjectCate(SubjectCateVo subjectCateVo){
        return sqlSession.insert("subject.insertSubjectCate", subjectCateVo);
    }
    
    /*카테고리 제목만 수정하기*/
    public int updateSubjectCateName(SubjectCateVo subjectCateVo) {
        return sqlSession.update("subject.updateSubjectCateName", subjectCateVo);
    }
    
    /*카테고리 삭제하기*/
    public int deleteSubjectCate(SubjectCateVo subjectCateVo) {
        return sqlSession.delete("subject.deleteSubjectCate", subjectCateVo);
    }
    
    /*카테고리 이동하기*/
    public int updateSubjectCateParent_id(SubjectCateVo subjectCateVo) {
        return sqlSession.update("subject.updateSubjectCateParent_id", subjectCateVo);
    }

    
    
    /*과목 리스트 가져오기*/
    public List<SubjectVo> selectSubjectList(){
        return sqlSession.selectList("subject.selectSubjectList");
    }
    
    
    
    /*과목 등록하기*/
    public int insertSubject(SubjectVo subjectVo){
        return sqlSession.insert("subject.insertSubject", subjectVo);
    }
    
    /*과목 제목만 수정하기*/
    public int updateSubjectName(SubjectVo subjectVo){
        return sqlSession.update("subject.updateSubjectName", subjectVo);
    }
    
    /*과목 삭제하기*/
    public int deleteSubject(SubjectVo subjectVo){
        return sqlSession.delete("subject.deleteSubject", subjectVo);
    }
 
    /*과목 이동*/
    public int updateSubjectCateSubjectCate_id(SubjectVo subjectVo) {
        return sqlSession.update("subject.updateSubjectCateSubjectCate_id", subjectVo);
    }
    
    /*과목 정보 가져오기*/
    public SubjectVo selectSubject(SubjectVo subjectVo) {
        return sqlSession.selectOne("subject.selectSubject", subjectVo);
    }

    
    /*과목 수정하기*/
    public int updateSubject(SubjectVo subjectVo){
        return sqlSession.update("subject.updateSubject", subjectVo);
    }
   

}
