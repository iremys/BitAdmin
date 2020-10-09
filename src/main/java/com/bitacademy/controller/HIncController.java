package com.bitacademy.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitacademy.service.HIncService;
import com.bitacademy.vo.HIncCateVo;
import com.bitacademy.vo.HIncludeVo;
import com.bitacademy.vo.JSONResult;

@Controller
@RequestMapping("/hInc")
public class HIncController {

	@Autowired
	private HIncService hIncService;
	
	/* 홈페이지관리 메인(카테고리 + 컨텐츠 리스트) */
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String hIncList(@RequestParam(value="hInclude_id", defaultValue="0") int hInclude_id, Model model) {
		System.out.println("hIncList()");
		/*hIncService.selectHIncCate();*/
		model.addAttribute("hInclude_id", hInclude_id);
		return "hPageMng/hInclude";
	}
	
	
	/*인크루드 카테고리+인클루드 데이타 가져오기*/
	@ResponseBody
	@RequestMapping(value = "/getCateAndHIncList", method = RequestMethod.POST)
	public JSONResult getCateAndHIncList() {
		System.out.println("getCateAndHIncList()");
		List<HIncCateVo> hIncCateList = hIncService.selectHIncCate();
		List<HIncludeVo> hIncludeList = hIncService.selectHIncludeList();
		
		Map<String, Object> getCateAndHIncList = new HashMap<String, Object>();
		getCateAndHIncList.put("hIncCateList", hIncCateList);
		getCateAndHIncList.put("hIncludeList", hIncludeList);
		System.out.println("getCateAndHIncList()-->getCateAndHIncList " +  getCateAndHIncList.toString());
		return JSONResult.success(getCateAndHIncList);
	}
	
	
	/*인클루드 데이타 가져오기*/
	@ResponseBody
	@RequestMapping(value = "/getHInclude", method = RequestMethod.POST)
	public JSONResult getHInclude(@RequestParam("hInclude_id") int hInclude_id) {
		System.out.println("getInclude()-->hInclude_id " + hInclude_id);
		HIncludeVo hIncludeVo = hIncService.getHInclude(hInclude_id);
		System.out.println("getInclude()-->hIncludeVo " +  hIncludeVo.toString());
		return JSONResult.success(hIncludeVo);
	}
	
	/*인클루드 데이타 수정*/
	@RequestMapping(value = "/modifyHInclude", method = RequestMethod.POST)
	@ResponseBody
	public JSONResult getHInclude(@ModelAttribute HIncludeVo hIncludeVo) {
		System.out.println("modifyHInclude()-->hIncludeVo " + hIncludeVo.toString());
		int modifyCnt = hIncService.modifyHInclude(hIncludeVo);
		//modifyCnt 로 정상 판단
		System.out.println("modifyCnt()--> " + modifyCnt);
		return JSONResult.success(modifyCnt);
	}
	
}
