package com.bitacademy.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitacademy.service.ClassService;
import com.bitacademy.vo.AutoSaveVo;
import com.bitacademy.vo.ClassCateVo;
import com.bitacademy.vo.ClassVo;
import com.bitacademy.vo.JSONResult;

@Controller
@RequestMapping("/class")
public class ClassConroller {

	@Autowired
	private ClassService classService;

	@RequestMapping("/")
	public String classMain() {
		return "classMng/class";
	}

	/* 카테+과목 리스트 가져오기 */
	@ResponseBody
	@RequestMapping(value = "/getCateAndClassList", method = RequestMethod.POST)
	public JSONResult getCateAndClassList() {
		List<ClassCateVo> classCateList = classService.getClassCateList();
		List<ClassVo> classList = classService.getClassList();

		Map<String, Object> cateAndClassList = new HashMap<String, Object>();
		cateAndClassList.put("classCateList", classCateList);
		cateAndClassList.put("classList", classList);
		return JSONResult.success(cateAndClassList);
	}

	/*카테고리 추가*/
    @ResponseBody
    @RequestMapping(value = "/addClassCate",  method=RequestMethod.POST)
    public JSONResult addClassCatet(@ModelAttribute ClassCateVo classCateVo) {
    	System.out.println("카테고리추가");
    	classService.addClassCate(classCateVo);
    	return JSONResult.success(classCateVo);
    }
	
    /*카테고리 제목만 수정하기*/
    @ResponseBody
    @RequestMapping(value = "/modifyClassCateName",  method=RequestMethod.POST)
    public JSONResult modifyClassCateName(@ModelAttribute ClassCateVo classCateVo) {
    	int modifyCnt = classService.modifyClassCateName(classCateVo);
    	return JSONResult.success(modifyCnt);
    }

    /*카테고리 삭제하기*/
    @ResponseBody
    @RequestMapping(value = "/removeClassCate",  method=RequestMethod.POST)
    public JSONResult removeClassCate(@ModelAttribute ClassCateVo classCateVo) {
    	int removeCnt = classService.removeClassCate(classCateVo);
    	return JSONResult.success(removeCnt);
    }			
    
    /*카테고리 이동*/
    @ResponseBody
    @RequestMapping(value = "/moveClassCate",  method=RequestMethod.POST)
    public JSONResult moveClassCate(@ModelAttribute ClassCateVo classCateVo) {
    	int modifyCnt = classService.moveClassCateParent_id(classCateVo);
    	return JSONResult.success(modifyCnt);
    }			
    
    
    
    
    
    
    /*클래스(반) 등록 하기*/
    @ResponseBody
    @RequestMapping(value = "/addClass",  method=RequestMethod.POST)
    public JSONResult addClass(@ModelAttribute ClassVo classVo) {
    	classService.addClass(classVo);
    	return JSONResult.success(classVo);
    }
    
    /*클래스(반) 제목만 수정*/
    @ResponseBody
    @RequestMapping(value="/modifyClassName", method=RequestMethod.POST)
    public JSONResult modifyClassName(@ModelAttribute ClassVo classVo){
    	int modifyCnt = classService.modifyClassName(classVo);
    	return JSONResult.success(modifyCnt);
    }
    
    /*클래스(반) 삭제 하기*/
    @ResponseBody
    @RequestMapping(value = "/removeClass",  method=RequestMethod.POST)
    public JSONResult removeClass(@ModelAttribute ClassVo classVo) {
    	int removeCnt = classService.removeClass(classVo);
    	return JSONResult.success(removeCnt);
    }  
    
    /*클래스(반) 이동*/
    @ResponseBody
    @RequestMapping(value = "/moveClass",  method=RequestMethod.POST)
    public JSONResult moveClass(@ModelAttribute ClassVo classVo) {
    	System.out.println(classVo.toString());
    	int modifyCnt = classService.moveClassCateClassCate_id(classVo);
    	return JSONResult.success(modifyCnt);
    }	
    
    /*클래스(반) 가져오기*/
    @ResponseBody
    @RequestMapping(value = "/getClass",  method=RequestMethod.POST)
    public JSONResult getClass(@RequestParam("class_id") int class_id) {
    	System.out.println(class_id);
    	ClassVo classVo = classService.selectClass(class_id);
    	System.out.println(classVo.toString());
    	return JSONResult.success(classVo);
    }	
    
    
    /*클래스(반) 수정 하기*/
    @ResponseBody
    @RequestMapping(value = "/modifyClass",  method=RequestMethod.POST)
    public JSONResult modifyClass(@RequestBody ClassVo classVo) {
    	System.out.println("size-->"+ classVo.getTestDateList().size());
    	System.out.println("testDateList-->"+ classVo.getTestDateList().toString());
    	System.out.println("modifyClass-->"+ classVo.toString());
    	int modifyCnt = classService.updateClass(classVo);
    	return JSONResult.success(modifyCnt);
    }	
    
    
    
    
    /*클래스(반) 자동 수정 하기*/
    @ResponseBody
    @RequestMapping(value = "/modifyClassAuto",  method=RequestMethod.POST)
    public JSONResult modifyClassAuto(@ModelAttribute AutoSaveVo autoSaveVo) {
    	System.out.println("modifyClassAuto-->"+ autoSaveVo.toString());
    	int modifyCnt = classService.modifyClassAuto(autoSaveVo);
    	return JSONResult.success(modifyCnt);
    }	
    
    
    /*전형일자 자동 수정 하기*/
    @ResponseBody
    @RequestMapping(value = "/modifyTestDateAuto",  method=RequestMethod.POST)
    public JSONResult modifytestDateAuto(@ModelAttribute AutoSaveVo autoSaveVo) {
    	System.out.println("modifytestDateAuto-->"+ autoSaveVo.toString());
    	int modifyCnt = classService.modifytestDateAuto(autoSaveVo);
    	return JSONResult.success(modifyCnt);
    }	
    
    
    /*커리큘럼 삭제(클래스info 테이블 정보수정)*/
    @ResponseBody
    @RequestMapping(value = "/removeCurriAtClass",  method=RequestMethod.POST)
    public JSONResult removeCurriAtClass(@RequestParam("class_id") int class_id) {
    	int removeCnt = classService.removeCurriAtClass(class_id);
    	return JSONResult.success(removeCnt);
    }
    
    
    /*전형일자 등록 하기*/
    @ResponseBody
    @RequestMapping(value = "/addTestDateAuto",  method=RequestMethod.POST)
    public JSONResult addTestDateAuto(@ModelAttribute AutoSaveVo autoSaveVo) {
    	System.out.println("addTestDateAuto-->"+ autoSaveVo.toString());
    	int modifyCnt = classService.addTestDateAuto(autoSaveVo);
    	return JSONResult.success(autoSaveVo);
    }	
    
}
