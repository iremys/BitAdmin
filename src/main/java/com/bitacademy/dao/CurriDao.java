package com.bitacademy.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bitacademy.vo.AutoSaveVo;
import com.bitacademy.vo.CurriCateVo;
import com.bitacademy.vo.CurriStepVo;
import com.bitacademy.vo.CurriSubjectVo;
import com.bitacademy.vo.CurriVo;

@Repository
public class CurriDao {
   
	@Autowired
    private SqlSession sqlSession;

	/*카테고리 리스트 가져오기*/
    public List<CurriCateVo> selectCurriCateList(){
        return sqlSession.selectList("curri.selectCurriCateList");
    }
    
    /*카테고리 등록하기*/
    public int insertCurriCate(CurriCateVo curriCateVo){
        return sqlSession.insert("curri.insertCurriCate", curriCateVo);
    }
    
    /*카테고리 제목만 수정하기*/
    public int updateCurriCateName(CurriCateVo curriCateVo) {
        return sqlSession.update("curri.updateCurriCateName", curriCateVo);
    }
    
    /*카테고리 삭제하기*/
    public int deleteCurriCate(CurriCateVo curriCateVo) {
        return sqlSession.delete("curri.deleteCurriCate", curriCateVo);
    }
    
    /*카테고리 이동하기*/
    public int updateCurriCateParent_id(CurriCateVo curriCateVo) {
        return sqlSession.update("curri.updateCurriCateParent_id", curriCateVo);
    }

    
    
    
    
    /*커리큘럼 리스트 가져오기*/
    public List<CurriVo> selectCurriList(){
        return sqlSession.selectList("curri.selectCurriList");
    }
    
    /*커리큘럼 등록하기*/
    public int insertCurri(CurriVo curriVo){
    	System.out.println(curriVo.toString());
        return sqlSession.insert("curri.insertCurri", curriVo);
    }
    
    /*커리큘럼 제목만 수정하기*/
    public int updateCurriName(CurriVo curriVo){
        return sqlSession.update("curri.updateCurriName", curriVo);
    }
    
    /*커리큘럼 삭제하기*/
    public int deleteCurri(CurriVo curriVo){
        return sqlSession.delete("curri.deleteCurri", curriVo);
    }
    
    /*커리큘럼 이동*/
    public int updateCurriCateCurriCate_id(CurriVo curriVo) {
        return sqlSession.update("curri.updateCurriCateCurriCate_id", curriVo);
    }
    
    
    /*커리큘럼 상세-기본정보*/
    public CurriVo selectCurriInfo(int curri_id) {
        return sqlSession.selectOne("curri.selectCurriInfo", curri_id);
    }
    
    /*커리큘럼 단계정보*/
    public List<CurriStepVo> selectCurriStep(int curri_id) {
        return sqlSession.selectList("curri.selectCurriStep", curri_id);
    }
    
    /*커리큘럼 단계추가하기*/
    public int insertCurriStep(CurriSubjectVo curriSubjectVo) {
    	sqlSession.insert("curri.insertCurriStep", curriSubjectVo);
        return 1;
    }
    
    /*커리큘럼 단계갯수 가져오기 : 커리큘럼 삭제시 판단*/
    public int selectCntCurriStep(CurriVo curriVo) {
        return sqlSession.selectOne("curri.selectCntCurriStep", curriVo);
    }
    
    /*커리큘럼 단계삭제*/
    public int deleteCurriStep(int curriStep_id) {
        return sqlSession.delete("curri.deleteCurriStep", curriStep_id);
    }
    
       
    /*커리큘럼 단계별 과목정보*/
    public List<CurriSubjectVo> selectCurriSubject(int curriStep_id) {
        return sqlSession.selectList("curri.selectCurriSubject", curriStep_id);
    }
    
    /*커리큘럼 단계별 과목개수*/
    public int selectCntCurriSubjectByCurriStep_id (int curriStep_id) {
        return sqlSession.selectOne("curri.selectCntCurriSubjectByCurriStep_id", curriStep_id);
    }
    
    
    /*커리큘럼 커리큐럼별 과목개수   :과목삭제할때 검사용*/
    public int selectCntCurriStepByCurri_id (int curri_id) {
        return sqlSession.selectOne("curri.selectCntCurriStepByCurri_id", curri_id);
    }
    
    
    /*커리큘럼 커리큐럼별 과목개수   :과목삭제할때 검사용*/
    public int selectCntCurriSubjectBySubject_id (int subject_id) {
        return sqlSession.selectOne("curri.selectCntCurriSubjectBySubject_id", subject_id);
    }
    
    
    /*커리큘럼 테이블의 과목 삭제하기*/
    public int deleteCurriSubject(int curriSubject_id ) {
    	return sqlSession.delete("curri.deleteCurriSubject", curriSubject_id);
    }
    

    /*커리큘럼의 과목 등록하기(키값만 생성)*/
    public int insertCurriSubject(CurriSubjectVo curriSubjectVo) {
        return sqlSession.insert("curri.insertCurriSubject", curriSubjectVo);
    }
    
    /*커리큘럼의 과목 등록하기(과목키값 등록)*/
    public int insertCurriSubject_Subject_id(CurriSubjectVo curriSubjectVo) {
        return sqlSession.insert("curri.insertCurriSubject", curriSubjectVo);
    }
    
    /*커리큘럼의--> 커리_과목에 과목 등록하기(과목키값 업데이트)*/
    public int updateCurriSubject(CurriSubjectVo curriSubjectVo) {
        return sqlSession.update("curri.updateCurriSubject", curriSubjectVo);
    }
    
    
    
    
    /*커리큐럼 상세정보 자동저장*/
    public int updateCurriAuto(AutoSaveVo autoSaveVo ) {
    	return sqlSession.update("curri.updateCurriInfoAuto", autoSaveVo);
    }
    
    
    /*커리큐럼 스텝(단계)정보 자동저장*/
    public int updateCurriStepAuto(AutoSaveVo autoSaveVo ) {
    	return sqlSession.update("curri.updateCurriStepAuto", autoSaveVo);
    }
    
    
    /*커리큐럼 과목정보 자동저장*/
    public int updateCurriSubjectAuto(AutoSaveVo autoSaveVo ) {
    	return sqlSession.update("curri.updateCurriSubjectAuto", autoSaveVo);
    }
    
    
    
   
    
    
}
