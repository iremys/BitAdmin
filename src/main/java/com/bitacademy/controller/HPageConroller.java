package com.bitacademy.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bitacademy.service.HPageService;
import com.bitacademy.vo.FileVo;
import com.bitacademy.vo.HCateVo;
import com.bitacademy.vo.HContentVo;
import com.bitacademy.vo.HIncludeVo;
import com.bitacademy.vo.JSONResult;

@Controller
@RequestMapping("/hPage")
public class HPageConroller {

	@Autowired
	private HPageService hPageService;

	/* 홈페이지관리 메인(카테고리 + 컨텐츠 리스트) */
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String hPageList(@RequestParam(value="hCate_id", defaultValue="0") int hCate_id, Model model) {
		System.out.println("hPageList()");
		model.addAttribute("hCate_id", hCate_id);
		return "hPageMng/hList";
	}
	
	
	/*홈페이지 관리 카테고리 리스트 가져오기 zTree*/
	@ResponseBody
	@RequestMapping(value = "/getHCateList", method = RequestMethod.POST)
	public JSONResult getHCateList() {
		System.out.println("getHCateList()");
		List<HCateVo> hCateList = hPageService.getHCateList();
		System.out.println(hCateList.toString());
		return JSONResult.success(hCateList);
	}
	

	/*코스(홈페이지) 리스트 가져오기 by hCourseCate_id*/
	@ResponseBody
	@RequestMapping(value = "/getHContentList", method = RequestMethod.POST)
 	public JSONResult getHContentList(@RequestParam("hCate_id") int hCate_id){
		System.out.println("getHContentList()  " + hCate_id );
		List<HContentVo> hContentList = hPageService.getHContentList(hCate_id);
		System.out.println(hContentList.toString());
      return JSONResult.success(hContentList);
	}
	
	
	/*홈페이지관리 컨텐츠 등록(제목, 카테고리) 하기*/
	@RequestMapping(value = "/writeTitle", method = RequestMethod.POST)
	public String writeTitle(@ModelAttribute HContentVo hContentVo, Model model) {
		System.out.println("writeTitle()-->등록전 " + hContentVo.toString());
		hPageService.addHContent(hContentVo);
		System.out.println("writeTitle()-->등록후 " + hContentVo.toString());
		
		return "redirect:/hPage/modifyForm?hContent_id="+ hContentVo.gethContent_id();
	}
	
	
	/*홈페이지관리 컨텐츠수정 폼*/
	@RequestMapping(value = "/modifyForm", method = RequestMethod.GET)
	public String modifyForm(@RequestParam("hContent_id") int hContent_id, Model model) {
		System.out.println("modifyForm() hContent_id --> " + hContent_id);
		HContentVo hContentVo = hPageService.getHContet(hContent_id);
		List<HIncludeVo> aSideList = hPageService.getAsideList();
		System.out.println("modifyForm() hContentVo --> " + hContentVo.toString());
		model.addAttribute("hContentVo", hContentVo);
		model.addAttribute("aSideList", aSideList);
		return "hPageMng/hModifyForm";
	}
	
	
	/*홈페이지 관리 컨텐츠 수정하기*/
	@ResponseBody
	@RequestMapping(value = "/modifyHContent", method = RequestMethod.POST)
	public JSONResult modifyHContent(@ModelAttribute HContentVo hContentVo) {
		System.out.println("modifyHContent()--> " + hContentVo.toString());
		int modifyCnt = hPageService.modifyHContnet(hContentVo);
		//modifyCnt 로 정상 판단
		System.out.println("modifyCnt()--> " + modifyCnt);
		return JSONResult.success(modifyCnt);
	}
	
	
	/*홈페이지 관리 컨텐츠삭제하기*/
	@ResponseBody
	@RequestMapping(value = "/removeHContent", method = RequestMethod.POST)
	public JSONResult removeHContent(@RequestParam("hContent_id") int hContent_id) {
		System.out.println("removeContent() hContent_id--> " + hContent_id);
		int removeCnt = hPageService.removeHContent(hContent_id);
		//modifyCnt 로 정상 판단
		System.out.println("removeCnt--> " + removeCnt);
		return JSONResult.success(removeCnt);
	}
	
	
	/*홈페이지 관리 파일업로드하기*/
	@ResponseBody
	@RequestMapping(value = "/fileUpload", method = RequestMethod.POST)
	public JSONResult fileUpload(@RequestParam("file") MultipartFile file, @RequestParam("hContent_id") int hContent_id ) {
		System.out.println("fileUpload() file--> " + file.getOriginalFilename());
		System.out.println("fileUpload() hContent_id--> " + hContent_id);
		int addCnt = hPageService.fileUpload(file, hContent_id);
		return JSONResult.success(addCnt);
	}
	
	/*홈페이지 관리 파일첨부 리스트 가져오기*/
	@ResponseBody
	@RequestMapping(value = "/getHContentFileList", method = RequestMethod.POST)
	public JSONResult getHContentFileList(@RequestParam("parent_id") int parent_id ) {
		System.out.println("getHContentFileList() parent_id--> " + parent_id);
		List<FileVo> fileList = hPageService.getHContentFileList(parent_id);
		
		System.out.println(fileList);
		return JSONResult.success(fileList);
	}
	
	/*홈페이지 관리 파일첨부 삭제하기*/
	@ResponseBody
	@RequestMapping(value = "/removeHContentFile", method = RequestMethod.POST)
	public JSONResult removeHContentFile(@RequestParam("file_id") int file_id ) {
		System.out.println("removeHContentFile() file_id--> " + file_id);
		int removeCnt = hPageService.removeHContentFile(file_id);
		return JSONResult.success(removeCnt);
	}
	
}
