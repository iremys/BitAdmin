package com.bitacademy.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitacademy.service.CurriService;
import com.bitacademy.vo.AutoSaveVo;
import com.bitacademy.vo.CurriCateVo;
import com.bitacademy.vo.CurriSubjectVo;
import com.bitacademy.vo.CurriVo;
import com.bitacademy.vo.JSONResult;
import com.bitacademy.vo.SubjectVo;

@Controller
@RequestMapping("/curri")
public class CurriController {
	
	@Autowired
    private CurriService curriService;
	
    @RequestMapping("/")
    public String curritMain() {
        return "courseDesign/curri";
    }
    
    /*카테+커리큘럼 리스트 가져오기*/
    @ResponseBody
    @RequestMapping(value="/getCateAndCurriList", method=RequestMethod.POST)
    public Map<String, Object> getCateAndCurriList(){
    	List<CurriCateVo> curriCateList = curriService.getCurriCateList();
    	List<CurriVo> curriList = curriService.getCurriList();

		Map<String, Object> cateAndCurriList = new HashMap<String, Object>();
		cateAndCurriList.put("curriCateList", curriCateList);
		cateAndCurriList.put("curriList", curriList);
    	return cateAndCurriList;
    }
    
    /*카테고리 추가*/
    @ResponseBody
    @RequestMapping(value = "/addCurriCate",  method=RequestMethod.POST)
    public JSONResult addCurriCatet(@ModelAttribute CurriCateVo curriCateVo) {
    	curriService.addCurriCate(curriCateVo);
    	return JSONResult.success(curriCateVo);
    }
    
    
    /*카테고리 제목만 수정하기*/
    @ResponseBody
    @RequestMapping(value = "/modifyCurriCateName",  method=RequestMethod.POST)
    public JSONResult modifyCurriCateName(@ModelAttribute CurriCateVo curriCateVo) {
    	int modifyCnt = curriService.modifyCurriCateName(curriCateVo);
    	return JSONResult.success(modifyCnt);
    }
    
    /*카테고리 삭제하기*/
    @ResponseBody
    @RequestMapping(value = "/removeCurriCate",  method=RequestMethod.POST)
    public JSONResult removeCurriCate(@ModelAttribute CurriCateVo curriCateVo) {
    	int removeCnt = curriService.removeCurriCate(curriCateVo);
    	return JSONResult.success(removeCnt);
    }			
    
    /*카테고리 이동*/
    @ResponseBody
    @RequestMapping(value = "/moveCurriCate",  method=RequestMethod.POST)
    public JSONResult moveCurriCate(@ModelAttribute CurriCateVo curriCateVo) {
    	int modifyCnt = curriService.moveCurriCateParent_id(curriCateVo);
    	return JSONResult.success(modifyCnt);
    }			
    
    
    
    /*커리큐럼 등록 하기*/
    @ResponseBody
    @RequestMapping(value = "/addCurri",  method=RequestMethod.POST)
    public JSONResult addCurri(@ModelAttribute CurriVo curriVo) {
    	curriService.addCurri(curriVo);
    	return JSONResult.success(curriVo);
    }
    
    /*커리큐럼 제목만 수정*/
    @ResponseBody
    @RequestMapping(value="/modifyCurriName", method=RequestMethod.POST)
    public JSONResult modifyCurriName(@ModelAttribute CurriVo curriVo){
    	int modifyCnt = curriService.modifyCurriName(curriVo);
    	return JSONResult.success(modifyCnt);
    }
    
    
    /*커리큐럼 삭제 하기*/
    @ResponseBody
    @RequestMapping(value = "/removeCurri",  method=RequestMethod.POST)
    public JSONResult removeCurri(@ModelAttribute CurriVo curriVo) {
    	int removeCnt = curriService.removeCurri(curriVo);
    	return JSONResult.success(removeCnt);
    }   
    
    /*커리큐럼 이동*/
    @ResponseBody
    @RequestMapping(value = "/moveCurri",  method=RequestMethod.POST)
    public JSONResult moveCurri(@ModelAttribute CurriVo curriVo) {
    	System.out.println(curriVo.toString());
    	int modifyCnt = curriService.moveCurriCateCurriCate_id(curriVo);
    	return JSONResult.success(modifyCnt);
    }
    
    
    
    /*커리큐럼 상세정보 모두다*/
    @ResponseBody
    @RequestMapping(value = "/getCurri",  method=RequestMethod.POST)
    public JSONResult getCurri(@RequestParam("curri_id") int curri_id) {
    	CurriVo curriVo = curriService.getCurri(curri_id);
    	return JSONResult.success(curriVo);
    }
    
    
    /*커리큘럼 단계+과목 세트 추가하기 vo가 어색함*/
    @ResponseBody
    @RequestMapping(value = "/addCurriStep",  method=RequestMethod.POST)
    public JSONResult addCurriStep(@ModelAttribute CurriSubjectVo curriSubjectVo) {
    	System.out.println("addCurriStep()  curriSubjectVo-->" +  curriSubjectVo );
    	curriService.addCurriStep(curriSubjectVo);
    	
    	System.out.println("컨트롤러 리턴전  " +curriSubjectVo.toString());
        return JSONResult.success(curriSubjectVo);
    }
    
    
    /*커리큘럼의 단계 삭제하기*/
    @ResponseBody
    @RequestMapping(value = "/removeCurriStep",  method=RequestMethod.POST)
    public JSONResult removeCurriStep(@RequestParam("curriStep_id") int curriStep_id) {
    	System.out.println("removeCurriStep   curriStep_id--> " + curriStep_id);
    	int removeCnt = curriService.removeCurriStep(curriStep_id);
        return JSONResult.success(removeCnt);
    }
    
   
    
    
    
    
    
    
    /*커리큘럼의 과목 삭제하기*/
    @ResponseBody
    @RequestMapping(value = "/removeCurriSubject",  method=RequestMethod.POST)
    public JSONResult removeCurriSubject(@RequestParam("curriSubject_id") int curriSubject_id) {
    	System.out.println("curriSubject_id--> " + curriSubject_id);
    	int removeCnt = curriService.removeCurriSubject(curriSubject_id);
        return JSONResult.success(removeCnt);
    }
    
    
    /*커리큘럼의 과목 등록하기(키값만 생성)*/
    @ResponseBody
    @RequestMapping(value = "/addCurriSubject",  method=RequestMethod.POST)
    public JSONResult addCurriSubject(@ModelAttribute CurriSubjectVo curriSubjectVo) {
    	System.out.println("addCurriSubject--> " + curriSubjectVo.toString());
    	curriService.addCurriSubject(curriSubjectVo);
        return JSONResult.success(curriSubjectVo);
    }
    
    /*커리큘럼의--> 커리_과목에 과목 등록하기(과목키값 업데이트)*/
    @ResponseBody
    @RequestMapping(value = "/modifyCurriSubject",  method=RequestMethod.POST)
    public JSONResult modifyCurriSubject(@ModelAttribute CurriSubjectVo curriSubjectVo) {
    	System.out.println("addCurriSubject_Subject_id--> " + curriSubjectVo.toString());
    	int addCnt = curriService.modifyCurriSubject(curriSubjectVo);
        return JSONResult.success(addCnt);
    }
    
    
    /*커리큐럼 상세정보 자동저장*/
    @ResponseBody
    @RequestMapping(value = "/modifyCurriAuto",  method=RequestMethod.POST)
    public JSONResult modifyCurriAuto(@ModelAttribute AutoSaveVo autoSaveVo ) {
    	System.out.println("modifyCurriAuto-->"+ autoSaveVo.toString());
    	int modifyCnt = curriService.modifyCurriAuto(autoSaveVo);
    	return JSONResult.success(modifyCnt);
    }

    
    /*커리큘럼 스텝(단계)정보 자동저장*/
    @ResponseBody
    @RequestMapping(value = "/modifyCurriStepAuto",  method=RequestMethod.POST)
    public JSONResult modifyCurriStepAuto(@ModelAttribute AutoSaveVo autoSaveVo ) {
    	System.out.println("modifyCurriStepAuto-->"+ autoSaveVo.toString());
    	int modifyCnt = curriService.modifyCurriStepAuto(autoSaveVo);
    	return JSONResult.success(modifyCnt);
    }
    
    /*커리큐럼 과목정보 자동저장*/
    @ResponseBody
    @RequestMapping(value = "/modifyCurriSubjectAuto",  method=RequestMethod.POST)
    public JSONResult modifyCurriSubjectAuto(@ModelAttribute AutoSaveVo autoSaveVo ) {
    	System.out.println("modifyCurriSubjectAuto-->"+ autoSaveVo.toString());
    	int modifyCnt = curriService.modifyCurriSubjectAuto(autoSaveVo);
    	return JSONResult.success(modifyCnt);
    }
    
    
    /*사용된(커리_과목) 과목수 조회 (과목 삭제시 사용)*/
    @ResponseBody
    @RequestMapping(value = "/getCntCurriSubjectBySubject_id",  method=RequestMethod.POST)
    public JSONResult getSubject(@ModelAttribute SubjectVo subjectVo) {
    	int subjectCnt = curriService.getCntCurriSubjectBySubject_id(subjectVo);
    	return JSONResult.success(subjectCnt);
    }   
  
    
    /*사용된(커리스탭) 커리스탭수  조회 (커리큘럼 삭제시 사용)*/
    @ResponseBody
    @RequestMapping(value = "/getCntCurriStepByCurri_id",  method=RequestMethod.POST)
    public JSONResult getCntCurriStepByCurri_id(@ModelAttribute CurriVo curriVo) {
    	int curriStepCnt = curriService.getCntCurriStepByCurri_id(curriVo);
    	return JSONResult.success(curriStepCnt);
    }   
    
    
    
    
}
