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
var cncmNodes = [];   
var cncmSetting = {
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
var crtNode; //선택한 과목 돔


/* 커리큘럼선택 버튼 클릭시-->모달창오픈 */
$("#btn_curri_modal_open").on("click", function(){
	getCateAndCurriList(0, "cate");
	$("#modal_curriList").modal();
});


//zTree에서 노드클릭시 선택되도록(히든값)----------------------------------->
function beforeClick(treeId, treeNode, clickFlag){
	crtNode = treeNode //선택된 노드를 전역에 둔다
}


//커리큘럼 선택모달창 선택버튼 클릭시
$("#btn_curri_choice").on("click",  function(){
	var tag = crtNode.tag;
	if(tag == "file"){
		var curri_id = crtNode.curri_id;
		var curriName = crtNode.name;
		
		$("#text_curriName").text(curriName);
		$("#btn_curri_remove").show();
		$("#frm_class input[name='curri_id']").val(curri_id);		

		crtNode = null //전역 노드를 비운다	
		$("#modal_curriList").modal("hide");
	}else if(tag == "cate"){
		alert("커리큘럼을 선택해 주세요")
		return;
	}	
}); 



/***************************************************************/
/* 카테고리 통신관련
/***************************************************************/
//카테+과목 리스트 가져온다.
function getCateAndCurriList(id, tag){  
	$.ajax({
        url: "${pageContext.request.contextPath }/curri/getCateAndCurriList",
        type: "POST",
        dataType: "json",
        success: function(cateAndCurriList) {
        	cateAndCurriRender(cateAndCurriList);
        	selectNodeById(id, tag);
        },
        error: function(XHR, status, error) {
            console.error(status + " : " + error);
        }
    });
}




/***************************************************************/
/* 과목+카테고리 관련 랜더링
/***************************************************************/
//메인에 카테고리 + 과목 리스트를 출력한다.zTree
function cateAndCurriRender(cateAndCurriList){
	var curriCateList = cateAndCurriList.curriCateList;
	var curriList = cateAndCurriList.curriList;
	cncmNodes = []; //비우기
	for(var i in curriCateList){
		var node = {
			id: "c_" + curriCateList[i].curriCate_id, 
			pId: "c_" + curriCateList[i].parent_id, 
			name: curriCateList[i].cateName, 
			open: open,
			icon: i_cate_open, 
			iconClose: i_cate_close,
			curriCate_id: curriCateList[i].curriCate_id,
			parent_id: curriCateList[i].parent_id,
			tag:"cate"
		}
		cncmNodes.push(node);
	}
	for(var i in curriList){
		var node = {
			id: "f_" + curriList[i].curri_id, 
			pId: "c_" + curriList[i].curriCate_id, 
			name: curriList[i].curriName, 
			open: open,
			drop: false,
			icon: i_item, 
			iconClose: i_item,
			curri_id: curriList[i].curri_id,
			tag:"file"
		}
		cncmNodes.push(node);
	}
	
	$.fn.zTree.init($("#ztree_cncm"), cncmSetting, cncmNodes);
	zTreeObj = $.fn.zTree.getZTreeObj("ztree_cncm");
}




/***************************************************************/
/* 공통
/***************************************************************/
// 폼 클리어  ---->한번더 확인
function formClear(formID){
	$(formID)[0].reset();
	$(formID).find("textarea").val("");
	
	/* $("#frm_subject #text_cateName").text("");
	$("#frm_subject #text_subjectName").text(""); */
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
}


</script>

