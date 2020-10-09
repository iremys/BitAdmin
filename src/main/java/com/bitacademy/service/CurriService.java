package com.bitacademy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitacademy.dao.CurriDao;
import com.bitacademy.vo.AutoSaveVo;
import com.bitacademy.vo.CurriCateVo;
import com.bitacademy.vo.CurriStepVo;
import com.bitacademy.vo.CurriSubjectVo;
import com.bitacademy.vo.CurriVo;
import com.bitacademy.vo.SubjectVo;

@Service
public class CurriService {
   
	@Autowired
    private CurriDao curriDao;

	/*카테고리 리스트 가져오기*/
    public List<CurriCateVo> getCurriCateList(){
        return curriDao.selectCurriCateList();
    }
    
    /*카테고리 등록하기*/
    public CurriCateVo addCurriCate(CurriCateVo curriCateVo){
    	curriDao.insertCurriCate(curriCateVo);
        return curriCateVo;
    }
    
    /*카테고리 제목만 수정하기*/
    public int modifyCurriCateName(CurriCateVo curriCateVo) {
        return curriDao.updateCurriCateName(curriCateVo);
    }
    
    /*카테고리 삭제하기*/
    public int removeCurriCate(CurriCateVo curriCateVo) {
        return curriDao.deleteCurriCate(curriCateVo);
    }
    
    /*카테고리 이동하기*/
    public int moveCurriCateParent_id(CurriCateVo curriCateVo) {
        return curriDao.updateCurriCateParent_id(curriCateVo);
    }
    
    
    /*커리큘럼 리스트 가져오기*/
    public List<CurriVo> getCurriList(){
        return curriDao.selectCurriList();
    }
	
    /*커리큘럼 등록하기*/
    public CurriVo addCurri(CurriVo curriVo){
    	curriDao.insertCurri(curriVo);
        return curriVo;
    }
    
    /*커리큘럼 제목만 수정하기*/
    public int modifyCurriName(CurriVo curriVo) {
        return curriDao.updateCurriName(curriVo);
    }
    
    /*커리큘럼 삭제하기*/
    public int removeCurri(CurriVo curriVo) {
    	//커리큘럼 있는지 판단은 화면에서
    	return curriDao.deleteCurri(curriVo); //삭제된 과목수 리턴;
    }
    
    /*커리큘럼 이동*/
    public int moveCurriCateCurriCate_id(CurriVo curriVo) {
        return curriDao.updateCurriCateCurriCate_id(curriVo);
    }
    
    /*커리큘럼 상세정보 : 모든정보 조합하기*/
    public CurriVo getCurri(int curri_id) {
    	CurriVo curriVo = curriDao.selectCurriInfo(curri_id);
    	List<CurriStepVo> curriStepList = curriDao.selectCurriStep(curri_id);
    	curriVo.setCurriStepList(curriStepList);
    	
    	//커리큘럼단계별 과목정보
    	for(int i = 0; i<curriStepList.size(); i++) {
    		int curriStep_id = curriStepList.get(i).getCurriStep_id();
    		List<CurriSubjectVo> curriSubjectList = curriDao.selectCurriSubject(curriStep_id);
    		curriStepList.get(i).setCurriSubjectList(curriSubjectList);
    	}
    	System.out.println(curriVo.toString());
        return curriVo;
    }

    
    
    /*커리큘럼 단계+과목 세트 추가하기  vo가 어색함*/
    public CurriSubjectVo addCurriStep(CurriSubjectVo curriSubjectVo) {
    	System.out.println("후 커리큘럼 단계+과목 세트 추가하기 전 dao  " +curriSubjectVo.toString());

    	//커리큘럼 단계 추가하기(키값만 생성한다)
    	curriDao.insertCurriStep(curriSubjectVo);
    	System.out.println("커리큘럼 단계 추가하기 후 dao  " +curriSubjectVo.toString());

    	//커리큘럼 과목 추가하기(키값만 생성한다)
    	curriDao.insertCurriSubject(curriSubjectVo);
    	System.out.println("커리큘럼 과목 추가하기 후 dao  " +curriSubjectVo.toString());
        return curriSubjectVo;
    }
    

    /*커리큘럼의 단계 삭제하기: 사용안된 경우만 호출됨*/
    public int removeCurriStep(int curriStep_id ) {
    	//사용여부 검사는 화면에서 체크
    	return curriDao.deleteCurriStep(curriStep_id);
    }
    
    
    
    /*커리큘럼 테이블의 과목 삭제하기*/
    public int removeCurriSubject(int curriSubject_id ) {
    	return curriDao.deleteCurriSubject(curriSubject_id);
    }
    

    /*커리큘럼의 과목 등록하기(키값만 생성)*/
    public int addCurriSubject(CurriSubjectVo curriSubjectVo) {
        return curriDao.insertCurriSubject(curriSubjectVo);
    }
    
    /*커리큘럼의--> 커리_과목에 과목 등록하기(과목키값 업데이트)*/
    public int modifyCurriSubject(CurriSubjectVo curriSubjectVo) {
        return curriDao.updateCurriSubject(curriSubjectVo);
    }
    
    
    /*사용된(커리_과목) 과목수 조회 (과목 삭제시 사용)*/
    public int getCntCurriSubjectBySubject_id(SubjectVo subjectVo) {
        return curriDao.selectCntCurriSubjectBySubject_id(subjectVo.getSubject_id());
    }
    
    /*사용된(커리스탭) 커리스탭수  조회 (커리큘럼 삭제시 사용)*/
    public int getCntCurriStepByCurri_id(CurriVo curriVo) {
        return curriDao.selectCntCurriStepByCurri_id(curriVo.getCurri_id());
    }
    
    
    /*커리큐럼 상세정보 자동저장*/
    public int modifyCurriAuto(AutoSaveVo autoSaveVo ) {
    	return curriDao.updateCurriAuto(autoSaveVo);
    }
    

    
    /*커리큐럼 스텝(단계)정보 자동저장*/
    public int modifyCurriStepAuto(AutoSaveVo autoSaveVo ) {
    	return curriDao.updateCurriStepAuto(autoSaveVo);
    }
    
    /*커리큐럼 과목정보 자동저장*/
    public int modifyCurriSubjectAuto(AutoSaveVo autoSaveVo ) {
    	return curriDao.updateCurriSubjectAuto(autoSaveVo);
    }
    
    
   
    
    
    
    
    
    
    
   
    
    
    
    
    

    
    
    
}
