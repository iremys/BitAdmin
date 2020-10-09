<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script type="text/javascript">
/***************************************************************/
/** 로딩될때 */
/***************************************************************/
$(document).ready(function(){
	var hCate_id = "${hCate_id}"; 
	console.log("시작");
	getHCateList( hCate_id, "cate");
	/* cateMode(); */
});



/***************************************************************/
/** zTree관련 기본세팅 */
/***************************************************************/
//아이콘
var i_cate_open = "${pageContext.request.contextPath}/assets/plugins/ztree/img/OpenCate.png";
var i_cate_close = "${pageContext.request.contextPath}/assets/plugins/ztree/img/CloseCate.png";

var zTreeObj; //현재 zTree 객체

//카테+과목 관련
var hcNodes = [];  
var hcSetting = {
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



//삭제버튼 클릭시
$("#hContentListArea").on("click", ".btn_hConent_remove", function(){
	$thisDom = $(this).closest("tr");
	console.log(this);
	
	if(confirm("정말로 삭제하시겠습니까?")){
		console.log("삭제");
		removeHContent($thisDom);
	}
	else{
		console.log("안삭제");
	}
});




/***************************************************************/
/* 과목+카테고리 영역
/***************************************************************/

/**** 카테고리 or 노드 클릭시 ************************************/
//zTree에서 노드클릭시 상세정보 가져오기 ----------------------------------->
function beforeClick(treeId, treeNode, clickFlag){
	if(treeNode.check_Child_State == -1){
		console.log("마지막노드");
		contentMode(treeNode.hCate_id);
	}else {
		cateMode();
	}
	/* 	var tag = treeNode.tag;
	var subject_id = treeNode.subject_id;
	
	if(tag == "file"){
		subjectMode(subject_id);
	}else if(tag == "cate"){
		cateMode();
	} */
}

//카테고리 선택시
function cateMode(){
	$(".fileDiv").hide();
	$(".cateDiv").show();
	/* formClear("#frm_subject"); */ //폼초기화 */
}

function contentMode(hCate_id){
	$(".cateDiv").hide();
	$(".fileDiv").show();
	
	/* formClear("#frm_subject"); */ //폼초기화 */
	console.log("hCate_id-->", hCate_id);
	console.log("#tbl_content input[name='hCate_id]-->", $("#tbl_content input[name='hCate_id']"));
	$("#modal_contnetTitle input[name='hCate_id']").val(hCate_id);
	getHContentList(hCate_id);
}







/***************************************************************/
/* 통신관련
/***************************************************************/
//카테 리스트 가져온다.
function getHCateList(id, tag){  
	console.log("카테고리통신");
	$.ajax({
        url: "${pageContext.request.contextPath }/hPage/getHCateList",
        type: "POST",
        /* data: data, */
        /* async: false, */
        dataType: "json",
        success: function(response) {
        	var hCateList = response.data;
        	console.log(hCateList);
        	hCateRender(hCateList);
        	selectNodeById(id, tag);
        },
        error: function(XHR, status, error) {
            console.error(status + " : " + error);
        }
    });
}

//컨텐츠(홈페이지) 리스트 가져오기 by hCate_id
function getHContentList(hCate_id){  
	console.log("getHContentList().hCate_id--> ", hCate_id);
	$.ajax({
        url: "${pageContext.request.contextPath }/hPage/getHContentList",
        type: "POST",
        data: {hCate_id: hCate_id},
        /* async: false, */
        dataType: "json",
        success: function(response) {
        	var hContentList = response.data;
        	console.log("hContentList", hContentList);
        	hContentListRender(hContentList);
        	/*selectNodeById(id, tag); */
        },
        error: function(XHR, status, error) {
            console.error(status + " : " + error);
        }
    });
}


//컨텐츠(홈페이지) 삭제하기
function removeHContent($thisDom){  
	var hContent_id = $thisDom.data("hcontent_id");
	console.log("removeHContent().hContent_id--> ", hContent_id);
	$.ajax({
        url: "${pageContext.request.contextPath }/hPage/removeHContent",
        type: "POST",
        data: {hContent_id: hContent_id},
        /* async: false, */
        dataType: "json",
        success: function(response) {
        	var removeCnt = response.data;
        	console.log("removeCnt", removeCnt);
        	if(removeCnt == 1){
        		$thisDom.remove();
        	}else{
        		console.log("오류발생");
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
function hCateRender(hCateList){
	hcNodes = []; //비우기
	for(var i in hCateList){
		var node = {
			id: "c_" + hCateList[i].hCate_id, 
			pId: "c_" + hCateList[i].parent_id, 
			name: hCateList[i].cateName, 
			open: open,
			icon: i_cate_open, 
			iconClose: i_cate_close,
			hCate_id: hCateList[i].hCate_id,
			parent_id: hCateList[i].parent_id,
			tag:"cate"
		}
		hcNodes.push(node);
	}
	
	$.fn.zTree.init($("#ztree_hc"), hcSetting, hcNodes);
	zTreeObj = $.fn.zTree.getZTreeObj("ztree_hc");
}


/***************************************************************/
/* 과목 관련 랜더링
/***************************************************************/
//과목상세정보출력
function hContentListRender(hContentList){
	var html ="";
	html += "<table id ='' class='table table-condensed'>";
	html += "	<colgroup>";
	html += "		<col width='40%' />";
	html += "		<col width='' />";
	html += "   	<col width='' />";
	html += "   	<col width=3% />";
	html += "	</colgroup>";
	html += "   <thead id=''>";
	html += "		<tr>";
	html += "			<th>제목</th>";
	html += "			<th>url</th>";
	html += "			<th>서브메뉴</th>";
	html += "			<th></th>";
	html += "		</tr>";
	html += "   </thead>";
	html += "   <tbody id=''>";

	for(var i in hContentList){
		html += "			<td><a href='${pageContext.request.contextPath}/hPage/modifyForm?hContent_id="+hContentList[i].hContent_id+"'>"+hContentList[i].title+"</a></td>";
		html += "			<td>";
		html += "				<span>  /hContent/getHContent?hContent_id='"+hContentList[i].hContent_id+"' </span>";
		html += "				<span class='pull-right'>";
		html += "					<a href='/hContent/getHContent?hContent_id="+hContentList[i].hContent_id+"' target='_blank'>";
		html += "						<span class='label label-primary mouse'>바로가기</span>";
		html += "					</a>";
		html += "				</span>";
		html += "			</td>";
		html += "			<td>"+hContentList[i].asideName+"</td>";
		html += "			<td><span class='label label-danger mouse btn_hConent_remove'>X</span></td>";
		html += "		</tr>";
	}
	html += "   </thead>";
	html += "</table>";
	$("#hContentListArea").html(html);
	
	
	/* 	console.log("aaaa");
	console.log(subjectVo);
	$("#frm_subject #text_cateName").text(subjectVo.cateName);
	$("#frm_subject #text_subjectName").text(subjectVo.subjectName);
	$("#frm_subject textarea[name='subjectDesc']").val(subjectVo.subjectDesc);
	
	$("#frm_subject input[name='subjectCate_id']").val(subjectVo.subjectCate_id);
	$("#frm_subject input[name='subject_id']").val(subjectVo.subject_id); //과목정보영역과 커리큘럼 추가 모달창 두곳다 적요
 */
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
		contentMode(node.hCate_id);
	}else {
		cateMode();
	}
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
