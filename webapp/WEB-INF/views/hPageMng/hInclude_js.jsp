<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script type="text/javascript">

//코드 에디터(코드미러) 세팅
var textarea = document.getElementById('hIncludeHtml');
var mixedMode = {
	name: "htmlmixed",
    scriptTypes: [{matches: /\/x-handlebars-template|\/x-mustache/i, mode: null},
        		  {matches: /(text|application)\/(x-)?vb(a|script)/i, mode: "vbscript"}]
};

var config = {                  
	lineNumbers: true,
	lineWrapping: true,
	dragDrop: true,
	mode: mixedMode
};

var editor = CodeMirror.fromTextArea(textarea, config );
editor.setSize(null, 450);



/***************************************************************/
/** 로딩될때 */
/***************************************************************/
$(document).ready(function(){
	var hInclude_id = "${hInclude_id}";
	console.log("시작");
	if(hInclude_id == 0){
		getCateAndHIncList( hInclude_id, "cate");
	}else {
		getCateAndHIncList( hInclude_id, "file");
	}
	
	/* cateMode(); */
});


$("#btn_hInclude_modify").on("click", function(){
	console.log("수정버튼 클릭");
	modifyHInclud();
});






/***************************************************************/
/** zTree관련 기본세팅 */
/***************************************************************/
//아이콘
var i_cate_open = "${pageContext.request.contextPath}/assets/plugins/ztree/img/OpenCate.png";
var i_cate_close = "${pageContext.request.contextPath}/assets/plugins/ztree/img/CloseCate.png";
var i_item = "${pageContext.request.contextPath}/assets/plugins/ztree/img/item.png";

var zTreeObj; //현재 zTree 객체

//카테+과목 관련
var mcNodes = [];  
var mcSetting = {
	data: {
		simpleData: {
			enable: true
		}
	},
	view: {
		dblClickExpand: dblClickExpand //더블클릭시 expand설정
	},
	callback: {
		beforeClick: beforeClick, // 클릭시
	}
};

//루트폴더 닫기 안되도록 세팅
function dblClickExpand(treeId, treeNode) {
	return treeNode.level >= 0;
}


/***************************************************************/
/* 과목+카테고리 영역
/***************************************************************/

/**** 카테고리 or 노드 클릭시 ************************************/
//zTree에서 노드클릭시 상세정보 가져오기 ----------------------------------->
function beforeClick(treeId, treeNode, clickFlag){
	var tag = treeNode.tag;
	var hInclude_id = treeNode.hInclude_id;
	
	if(tag == "file"){
		console.log("inc파일");
		incMode(hInclude_id);
	}else if(tag == "cate"){
		console.log("카테");
		cateMode();
	}
}

//카테고리 선택시
function cateMode(){
	$(".fileDiv").hide();
	$(".cateDiv").show();
	/* formClear("#frm_subject"); */ //폼초기화 */
}

function incMode(hInclude_id){
	$(".cateDiv").hide();
	$(".fileDiv").show();
	getHInclude(hInclude_id)
	$("#frm_hInclude input[name='hInclude_id']").val(hInclude_id);
	
	
	/* formClear("#frm_subject"); */ //폼초기화 */
	/* console.log("hCate_id-->", hCate_id);
	console.log("#tbl_content input[name='hCate_id]-->", $("#tbl_content input[name='hCate_id']"));
	$("#modal_contnetTitle input[name='hCate_id']").val(hCate_id);
	getHContentList(hCate_id); */
}





/***************************************************************/
/* 카테고리 통신관련
/***************************************************************/
//카테고리와 인클루드 데이타를 리스트 가져온다.
function getCateAndHIncList(id, tag){  
	$.ajax({
        url: "${pageContext.request.contextPath }/hInc/getCateAndHIncList",
        type: "POST",
        /* data: data, */
        /* async: false, */
        dataType: "json",
        success: function(response) {
        	var cateAndHIncList = response.data
        	console.log(cateAndHIncList);
        	cateAndIncRender(cateAndHIncList);
        	selectNodeById(id, tag);
        /* 	var hCateList = response.data;
        	console.log(hCateList);
        	 */
        },
        error: function(XHR, status, error) {
            console.error(status + " : " + error);
        }
    });
	
}

//이클루드 데이타 상세정보 가져오기 by hInclude_id
function getHInclude(hInclude_id){  
	console.log("getHInclude().hInclude_id--> ", hInclude_id);
	$.ajax({
        url: "${pageContext.request.contextPath }/hInc/getHInclude",
        type: "POST",
        data: {hInclude_id: hInclude_id},
        /* async: false, */
        dataType: "json",
        success: function(response) {
        	var hIncludeVo = response.data;
        	console.log("hIncludeVo", hIncludeVo);
        	hIncludeRender(hIncludeVo);
        },
        error: function(XHR, status, error) {
            console.error(status + " : " + error);
        }
    });
}


//인클루드 파일 내용 수정하기
function modifyHInclud(){
	var hIncludeHtml = editor.getValue();
	var hInclude_id = $("#frm_hInclude input[name='hInclude_id']").val();
	var contentHtml = editor.getValue()
	var hIncludeVo = {
		hIncludeHtml: hIncludeHtml,
		hInclude_id: hInclude_id
	}
	
	$.ajax({
		url: "${pageContext.request.contextPath }/hInc/modifyHInclude",
		data: hIncludeVo,
		type: 'POST',
		success: function(response){
			console.log(response.data);
			var modifyCnt = response.data;
			if(modifyCnt == 1){
				console.log("modifyCnt-->", modifyCnt);
				notiBox("수정되었습니다");
			}else {
				console.log("수정오류");
			}
		},
	 	error: function(XHR, status, error) {
            console.error(status + " : " + error);
        }
	});

}




/***************************************************************/
/* 카테고리 관련 랜더링
/***************************************************************/
//메인에 카테고리 리스트를 출력한다.zTree
function cateAndIncRender(cateAndHIncList){
	var hIncCateList = cateAndHIncList.hIncCateList;
	var hIncludeList = cateAndHIncList.hIncludeList;
	mcNodes = []; //비우기
	for(var i in hIncCateList){
		var node = {
			id: "c_" + hIncCateList[i].hIncCate_id, 
			pId: "c_" + hIncCateList[i].parent_id, 
			name: hIncCateList[i].cateName, 
			open: open,
			icon: i_cate_open, 
			iconClose: i_cate_close,
			hIncCate_id: hIncCateList[i].hIncCate_id,
			parent_id: hIncCateList[i].parent_id,
			tag:"cate"
		}
		mcNodes.push(node);
	}
	for(var i in hIncludeList){
		var node = {
			id: "f_" + hIncludeList[i].hInclude_id, 
			pId: "c_" + hIncludeList[i].hIncCate_id, 
			name: hIncludeList[i].hIncludeName, 
			open: open,
			drop: false,
			icon: i_item, 
			iconClose: i_item,
			hInclude_id: hIncludeList[i].hInclude_id,
			tag:"file"
		}
		mcNodes.push(node);
	}
	
	$.fn.zTree.init($("#ztree_mc"), mcSetting, mcNodes);
	zTreeObj = $.fn.zTree.getZTreeObj("ztree_mc");
}


/***************************************************************/
/* 인클루드 데이타 관련 랜더링
/***************************************************************/
//인클루드 상세 데이타 출력
function hIncludeRender(hIncludeVo){
	console.log("hIncludeRender()-->hIncludeVo " , hIncludeVo);
	editor.setValue(hIncludeVo.hIncludeHtml); 
	/* $("#frm_hInclude #hIncludeHtml").val(hIncludeVo.hIncludeHtml); */
}



/***************************************************************/
/* 공통
/***************************************************************/
// 폼 클리어  ---->한번더 확인
function formClear(formID){
	$(formID)[0].reset();
	$(formID).find("textarea").val("");
	
	$("#frm_subject #text_cateName").text("");
	$("#frm_subject #text_subjectName").text("");
}


//id 값으로 노드 선택
function selectNodeById(id, tag){
	var node;
	if(tag == "cate"){
		node = zTreeObj.getNodesByParam("id", "c_"+id, null)[0];
	} else if(tag == "file"){
		node = zTreeObj.getNodesByParam("id", "f_"+id, null)[0];
	}
	zTreeObj.selectNode(node);	
	if(id == 0){
		$("#cateBox").scrollTop(0);
	}
	
	if(node.check_Child_State == -1){
		console.log("마지막노드");
		incMode(id);
	}else {
		cateMode();
	}
}



//알림 박스
function notiBox(msg){
	$("#notiBox").text(msg);
	$("#notiBox").fadeIn();
	setTimeout(function(){
		//$("#notiBox").css('display','none');
		$("#notiBox").fadeOut();
	},2000);
}

/***************************************************************/
/* 모달창 영역
/***************************************************************/
/* $("#btn_contentTile_save").on("click", function(){
	console.log("제목저장");
	$("#modal_contnetTitle").modal("hide");
}); 
 */

</script>
