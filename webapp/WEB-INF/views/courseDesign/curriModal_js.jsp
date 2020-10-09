<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<script type="text/javascript">
/***************************************************************/
/** zTree관련 기본세팅 */
/***************************************************************/
//아이콘
var i_cate_open = "${pageContext.request.contextPath}/assets/plugins/ztree/img/OpenCate.png";
var i_cate_close = "${pageContext.request.contextPath}/assets/plugins/ztree/img/CloseCate.png";
var i_item = "${pageContext.request.contextPath}/assets/plugins/ztree/img/item.png";

var zTreeObjModal; //현재 zTree 객체

//카테+과목 관련
var cnsNodes = [];  
var cnsSetting = {
	data: {
		simpleData: {
			enable: true
		}
	},
	view: {
		dblClickExpand: dblClickExpand //더블클릭시 expand설정
	},
	callback: {
		beforeClick: beforeClick // 클릭시
	}
};

//루트폴더 닫기 안되도록 세팅
function dblClickExpand(treeId, treeNode) {
	return treeNode.level >= 0;
}

/***************************************************************/
/* 모달창 이벤트
/***************************************************************/

var $thisTr; //선택한 과목 돔

/* 과목선택 버튼 클릭시-->모달창오픈 */
$("#tbl_curriSubject").on("click", ".btn_subjectList_modal_open", function(){
	cateModeModal();
	getCateAndSubjectList(0, "cate");
	$thisTr = $(this).closest(".tr_curri"); //선택한 과목 tr을 알려준다.
	console.log($thisTr);
	
	$("#modal_subjectList").modal();
});


//zTree에서 노드클릭시 상세정보 가져오기 ----------------------------------->
function beforeClick(treeId, treeNode, clickFlag){
	var tag = treeNode.tag;
	var subject_id = treeNode.subject_id;
	
	if(tag == "file"){
		subjectModeModal(subject_id);
	}else if(tag == "cate"){
		console.log("cate 클릭");
		cateModeModal();
	}
}

//카테고리 선택시
function cateModeModal(){
	console.log("cateMode");
	//폼초기화
	$("#frm_subject #text_cateName").text("");
	$("#frm_subject #text_subjectName").text("");
	$("#frm_subject #text_subjectDesc").text("");
	
	$("#frm_subject input[name='subjectCate_id']").val(-1);
	$("#frm_subject input[name='subject_id']").val(-1); //과목정보영역과 커리큘럼 추가 모달창 두곳다 적요
}


//과목선택시 
function subjectModeModal(subject_id){
	//폼초기화
	//폼초기화
	$("#frm_subject #text_cateName").text("");
	$("#frm_subject #text_subjectName").text("");
	$("#frm_subject #text_subjectDesc").text("");
	
	$("#frm_subject input[name='subjectCate_id']").val(-1);
	$("#frm_subject input[name='subject_id']").val(-1); //과목정보영역과 커리큘럼 추가 모달창 두곳다 적요

	getSubjectModal(subject_id); //과목정보 가져오기
}



//커리큘럼 선택모달창 선택 클릭시
$("#btn_subject_choice").on("click",  function(){
	console.log("선택클릭!!!");
	var curriSubject_id = $thisTr.data("currisubject_id");
	var subject_id = $("#frm_subject input[name='subject_id']").val();
	
	var curriSubjectVo = {
		curriSubject_id: curriSubject_id,
		subject_id: subject_id
	}
	
	if(subject_id != -1){
		modifyCurriSubject(curriSubjectVo);
	} else{
		alert("과목을 선택해 주세요");
	}
	
}); 



/***************************************************************/
/* 카테고리 통신관련
/***************************************************************/
//카테+과목 리스트 가져온다.
function getCateAndSubjectList(id, tag){  
	$.ajax({
        url: "${pageContext.request.contextPath }/subject/getCateAndSubjectList",
        type: "POST",
        /* data: data, */
        /* async: false, */
        dataType: "json",
        success: function(cateAndSubjectList) {
        	cateAndSubjectRender(cateAndSubjectList);
        	selectNodeById(id, tag);
        },
        error: function(XHR, status, error) {
            console.error(status + " : " + error);
        }
    });
	
}


//과목 상세정보를 가져온다.
function getSubjectModal(subject_id){
	$.ajax({
	    url: "${pageContext.request.contextPath }/subject/getSubject",
	    type: "POST",
	    data: {"subject_id": subject_id},
	    /* async: false, */
	    dataType: "json",
	    success: function(response) {
	    	var subjectVo = response.data;
	    	subjectRenderModal(subjectVo);
	    },
	    error: function(XHR, status, error) {
	        console.error(status + " : " + error);
	    }
	});	
}

//커리_과목에 과목 등록하기(과목키값 업데이트). 
function modifyCurriSubject(curriSubjectVo){
	$.ajax({
	    url: "${pageContext.request.contextPath }/curri/modifyCurriSubject",
	    type: "POST",
	    data: curriSubjectVo,
	   /*  async: false, */
	    dataType: "json",
	    success: function(response) {
	    	var addCnt = response.data;
	    	if(addCnt == 1){
	    		subjectRenderCurrl();
	    		$("#modal_subjectList").modal("hide");
	    	}else{
	    		$("#modal_subjectList").modal("hide");
	    		alert("과목선택 실패");
	    	}
	    },
	    error: function(XHR, status, error) {
	        console.error(status + " : " + error);
	    }
	});	
}

1


/***************************************************************/
/* 과목+카테고리 관련 랜더링
/***************************************************************/
//메인에 카테고리 + 과목 리스트를 출력한다.zTree
function cateAndSubjectRender(cateAndSubjectList){
	var subjectCateList = cateAndSubjectList.subjectCateList;
	var subjectList = cateAndSubjectList.subjectList;
	cnsNodes = []; //비우기
	for(var i in subjectCateList){
		var node = {
			id: "c_" + subjectCateList[i].subjectCate_id, 
			pId: "c_" + subjectCateList[i].parent_id, 
			name: subjectCateList[i].cateName, 
			open: open,
			icon: i_cate_open, 
			iconClose: i_cate_close,
			subjectCate_id: subjectCateList[i].subjectCate_id,
			parent_id: subjectCateList[i].parent_id,
			tag:"cate"
		}
		cnsNodes.push(node);
	}
	for(var i in subjectList){
		var node = {
			id: "f_" + subjectList[i].subject_id, 
			pId: "c_" + subjectList[i].subjectCate_id, 
			name: subjectList[i].subjectName, 
			open: open,
			drop: false,
			icon: i_item, 
			iconClose: i_item,
			subject_id: subjectList[i].subject_id,
			tag:"file"
		}
		cnsNodes.push(node);
	}
	
	$.fn.zTree.init($("#ztree_cns"), cnsSetting, cnsNodes);
	zTreeObj = $.fn.zTree.getZTreeObj("ztree_cns");
}

//과목상세정보출력
function subjectRenderModal(subjectVo){
	console.log("aaaa");
	console.log(subjectVo);
	$("#frm_subject #text_cateName").text(subjectVo.cateName);
	$("#frm_subject #text_subjectName").text(subjectVo.subjectName);
	$("#frm_subject #text_subjectDesc").text(subjectVo.subjectDesc);
	
	$("#frm_subject input[name='subjectCate_id']").val(subjectVo.subjectCate_id);
	$("#frm_subject input[name='subject_id']").val(subjectVo.subject_id); //과목정보영역과 커리큘럼 추가 모달창 두곳다 적요
}


//모달창에서 선택한 과목정보를 구성과목 에 출력한다.
function subjectRenderCurrl(subjectVo){
	console.log("과목 적용");
	var subjectName = $("#frm_subject #text_subjectName").text();
	var subjectDesc = $("#frm_subject #text_subjectDesc").text();
	console.log(subjectName);
	console.log(subjectDesc);
	
	$thisTr.find(".div_subjectName").text(subjectName);
	$thisTr.find(".div_subjectDesc").text(subjectDesc);
	
}



</script>

