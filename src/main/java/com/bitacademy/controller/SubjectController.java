package com.bitacademy.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitacademy.service.SubjectService;
import com.bitacademy.vo.JSONResult;
import com.bitacademy.vo.SubjectCateVo;
import com.bitacademy.vo.SubjectVo;

@Controller
@RequestMapping("/subject")
public class SubjectController {

    @Autowired
    private SubjectService subjectService;

    @RequestMapping("/")
    public String subjectMain() {
        return "courseDesign/subject";
    }
    
    /*카테+과목 리스트 가져오기*/
    @ResponseBody
    @RequestMapping(value="/getCateAndSubjectList", method=RequestMethod.POST)
    public Map<String, Object> getCateAndSubjectList(){
    	List<SubjectCateVo> subjectCateList = subjectService.getSubjectCateList();
		List<SubjectVo> subjectList = subjectService.getSubjectList();

		Map<String, Object> cateAndSubjectList = new HashMap<String, Object>();
		cateAndSubjectList.put("subjectCateList", subjectCateList);
		cateAndSubjectList.put("subjectList", subjectList);
    	return cateAndSubjectList;
    }
    
    /*카테고리 추가*/
    @ResponseBody
    @RequestMapping(value = "/addSubjectCate",  method=RequestMethod.POST)
    public JSONResult addSubjectCatet(@ModelAttribute SubjectCateVo subjectCateVo) {
    	subjectService.addSubjectCate(subjectCateVo);
    	return JSONResult.success(subjectCateVo);
    }
    
    /*카테고리 제목만 수정하기*/
    @ResponseBody
    @RequestMapping(value = "/modifySubjectCateName",  method=RequestMethod.POST)
    public JSONResult modifySubjectCateName(@ModelAttribute SubjectCateVo subjectCateVo) {
    	int modifyCnt = subjectService.modifySubjectCateName(subjectCateVo);
    	return JSONResult.success(modifyCnt);
    }
    
    /*카테고리 삭제하기*/
    @ResponseBody
    @RequestMapping(value = "/removeSubjectCate",  method=RequestMethod.POST)
    public JSONResult removeSubjectCate(@ModelAttribute SubjectCateVo subjectCateVo) {
    	int removeCnt = subjectService.removeSubjectCate(subjectCateVo);
    	return JSONResult.success(removeCnt);
    }			
    
    /*카테고리 이동*/
    @ResponseBody
    @RequestMapping(value = "/moveSubjectCate",  method=RequestMethod.POST)
    public JSONResult moveSubjectCate(@ModelAttribute SubjectCateVo subjectCateVo) {
    	int modifyCnt = subjectService.moveSubjectCateParent_id(subjectCateVo);
    	return JSONResult.success(modifyCnt);
    }			
    
    
    
    /*과목 등록 하기*/
    @ResponseBody
    @RequestMapping(value = "/addSubject",  method=RequestMethod.POST)
    public JSONResult addSubject(@ModelAttribute SubjectVo subjectVo) {
    	subjectService.addSubject(subjectVo);
    	return JSONResult.success(subjectVo);
    }
    
    /*과목 제목만 수정*/
    @ResponseBody
    @RequestMapping(value="/modifySubjectName", method=RequestMethod.POST)
    public JSONResult modifySubjectName(@ModelAttribute SubjectVo subjectVo){
    	int modifyCnt = subjectService.modifySubjectName(subjectVo);
    	return JSONResult.success(modifyCnt);
    }
    
    
    /*과목 삭제 하기*/
    @ResponseBody
    @RequestMapping(value = "/removeSubject",  method=RequestMethod.POST)
    public JSONResult removeSubject(@ModelAttribute SubjectVo subjectVo) {
    	int removeCnt = subjectService.removeSubject(subjectVo);
    	return JSONResult.success(removeCnt);
    }   
    
    /*과목 이동*/
    @ResponseBody
    @RequestMapping(value = "/moveSubject",  method=RequestMethod.POST)
    public JSONResult moveSubject(@ModelAttribute SubjectVo subjectVo) {
    	System.out.println(subjectVo.toString());
    	int modifyCnt = subjectService.moveSubjectCateSubjectCate_id(subjectVo);
    	return JSONResult.success(modifyCnt);
    }	
    
    
    /*과목정보 가져오기*/
    @ResponseBody
    @RequestMapping(value="/getSubject", method=RequestMethod.POST)
    public JSONResult getSubject(@ModelAttribute SubjectVo subjectVo){
    	SubjectVo resultVo = subjectService.getSubject(subjectVo);
    	return JSONResult.success(resultVo);
    }
    
    /*과목 수정 하기*/
    @ResponseBody
    @RequestMapping(value = "/modifySubject",  method=RequestMethod.POST)
    public JSONResult modifySubject(@ModelAttribute SubjectVo subjectVo) {
    	int modifyCnt = subjectService.modifySubject(subjectVo);
    	return JSONResult.success(modifyCnt);
    }
    
  
    
}
