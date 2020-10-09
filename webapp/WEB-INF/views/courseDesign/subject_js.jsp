<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script type="text/javascript">
/***************************************************************/
/** 로딩될때 */
/***************************************************************/
$(document).ready(function(){
	getCateAndSubjectList(0, "cate");
	cateMode();
});


/***************************************************************/
/** zTree관련 기본세팅 */
/***************************************************************/
//아이콘
var i_cate_open = "${pageContext.request.contextPath}/assets/plugins/ztree/img/OpenCate.png";
var i_cate_close = "${pageContext.request.contextPath}/assets/plugins/ztree/img/CloseCate.png";
var i_item = "${pageContext.request.contextPath}/assets/plugins/ztree/img/item.png";

var zTreeObj; //현재 zTree 객체
var rMenu = $("#rMenu"); //오른쪽 팝업메뉴 객체
var rMenuNode; //오른쪽 마우스 클릭시 선택된 노드

//카테+과목 관련
var cnsNodes = [];  
var cnsSetting = {
	edit: {
		enable: true,
		showRemoveBtn: false,
		showRenameBtn: false,
		editNameSelectAll: true
	},
	data: {
		simpleData: {
			enable: true
		}
	},
	view: {
		dblClickExpand: dblClickExpand //더블클릭시 expand설정
	},
	callback: {
		beforeDrag: beforeDrag,
		beforeDrop: beforeDrop,
		onDrop: onDrop,
		onRightClick: onRightClick, //오른쪽 마우스
		beforeClick: beforeClick, // 클릭시
		beforeRename: beforeRename, //수정관련 
		onRename: onRename,//수정관련
		beforeRemove: beforeRemove, //삭제관련
		onRemove: onRemove//삭제관련
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
	var subject_id = treeNode.subject_id;
	
	if(tag == "file"){
		subjectMode(subject_id);
	}else if(tag == "cate"){
		cateMode();
	}
}

//카테고리 선택시
function cateMode(){
	$(".cateDiv").show();
	$(".fileDiv").hide();
	formClear("#frm_subject"); //폼초기화
}


//과목선택시 
function subjectMode(subject_id){
	$(".fileDiv").show();
	$(".cateDiv").hide();
	formClear("#frm_subject"); //폼초기화
	getSubject(subject_id); //과목정보 가져오기
}



/**** 오른쪽 메뉴 관련 ************************************/
//오른쪽메뉴 클릭이벤트
function onRightClick(event, treeId, treeNode) {
	showRMenu(event.clientX, event.clientY, treeNode);
}

//오른쪽메뉴 보이기
function showRMenu(x, y, treeNode) {
	console.log("오른쪽메뉴클릭");
	if(treeNode != null){
		rMenuNode = treeNode; //메뉴클릭시 선태된 노드값 전역으로 전달
		if (treeNode.tag == "cate") {
			console.log("카테고리 선택");
			if(treeNode.subjectCate_id==0 ){
				console.log("루트일때");
				selectNodeById(treeNode.subjectCate_id, "cate")
				$("#rMenu_cateTitle").show();
				$("#m_cate_remove").hide();
				$("#m_cate_modify").hide();
				$("#m_cate_add").show();
				$(".rMemu_line").show();
				$("#rMenu_subjectTitle").show();
				$("#m_subject_remove").hide();
				$("#m_subject_modify").hide();
				$("#m_subject_add").show();
			}else{
				console.log("루트아닐때");
				selectNodeById(treeNode.subjectCate_id, "cate")
				$("#rMenu_cateTitle").show();
				$("#m_cate_remove").show();
				$("#m_cate_modify").show();
				$("#m_cate_add").show();
				$(".rMemu_line").show();
				$("#rMenu_subjectTitle").show();
				$("#m_subject_remove").hide();
				$("#m_subject_modify").hide();
				$("#m_subject_add").show();
			}
		}else if(treeNode.tag == "file") {
			selectNodeById(treeNode.subject_id, "file")
			$("#rMenu_cateTitle").hide();
			$("#m_cate_remove").hide();
			$("#m_cate_modify").hide();
			$("#m_cate_add").hide();
			$(".rMemu_line").hide();
			$("#rMenu_subjectTitle").show();
			$("#m_subject_remove").show();
			$("#m_subject_modify").show();
			$("#m_subject_add").hide();
		}
		$("#rMenu ul").show();
		y += document.body.scrollTop;
	  	x += document.body.scrollLeft;
	  	rMenu.css({"top":y+"px", "left":x+"px", "visibility":"visible"});
		
	  	$("body").bind("mousedown", onBodyMouseDown);
	}
}

//오른쪽 메뉴 숨기기
function hideRMenu() {
	if (rMenu) rMenu.css({"visibility": "hidden"});
	$("body").unbind("mousedown", onBodyMouseDown);
}
//오른쪽 메뉴 숨기기 정의
function onBodyMouseDown(event){
	if (!(event.target.id == "rMenu" || $(event.target).parents("#rMenu").length>0)) {
		rMenu.css({"visibility" : "hidden"});
	}
}

//오른쪽 메뉴 숨기기 이벤트
$("body").on("click", function(){
	hideRMenu();
});


/**** 오른쪽 메뉴 관련 ************************************/
//오른쪽메뉴 > 카테고리 추가
$("#m_cate_add").on("click", function(){
	hideRMenu();
	addSubjectCate(rMenuNode);
});
	
//오른쪽메뉴 > 카테고리 이름변경
$("#m_cate_modify").on("click", function(){
	hideRMenu();
	zTreeObj.editName(rMenuNode); //beforeRename(), onRename() 연결됨
});

//오른쪽메뉴 > 카테고리 삭제
$("#m_cate_remove").on("click", function(){
	hideRMenu();
	zTreeObj.removeNode(rMenuNode, true); //beforeRemove(), onRemove() 연결됨
});


//오른쪽메뉴 > 과목 추가
$("#m_subject_add").on("click", function(event){
	hideRMenu();
	addSubject(rMenuNode);
});

//오른쪽메뉴 > 과목 이름바꾸기
$("#m_subject_modify").on("click", function(){
	hideRMenu();
	zTreeObj.editName(rMenuNode); //beforeRename(), onRename() 연결됨
});

//오른쪽메뉴 > 과목 삭제
$("#m_subject_remove").on("click", function(){
	hideRMenu();
	zTreeObj.removeNode(rMenuNode, true); //beforeRemove(), onRemove() 연결됨
});



/**** 이름변경 관련(카테고리, 과목 둘다) ************************************/
//*수정버튼 세팅  true면 onRename 호출
function beforeRename(treeId, treeNode, newName, isCancel){
	console.log("beforeRename");
	if(newName.length > 0){
		return true;	
	}else {
		alert("이름을 입력해주세요");
		return false;
	}
}

//*카테고리 수정완료
function onRename(event, treeId, treeNode, isCancel) {
	var tag = treeNode.tag;
	if(tag == "file"){
		console.log("과목이름변경");
		modifySubjectName(treeNode);
	}else if(tag == "cate"){
		console.log("카테고리이름변경");
		modifySubjectCateName(treeNode);
	}
}


/**** 삭제 관련(카테고리) ************************************/
//카테고리 삭제버튼 세팅  true면 onRemove 호출
function beforeRemove(treeId, treeNode, newName, isCancel){
	console.log("beforeRemove()");
	var tag = treeNode.tag;
	if(tag == "cate"){
		if(treeNode.check_Child_State == -1){ 
			return confirm("["+treeNode.name + "]  카테고리를 정말로 삭제 하시겠습니까?");
		}else { //자식 카테고리나 과목이 있는경우
			alert("빈 카테고리가 아닙니다.");
			return false;
		}
	}else if(tag == "file"){
		//하위가 있는지는 통신 후 판단-->커리큘럼에 사용되었으면 삭제안됨
		console.log("과목 삭제 시작=======>");
		var subjectCnt = getCntCurriSubjectBySubject_id(treeNode);//과목에 커리 구성에 사용되었는지 확인
		console.log("subjectCnt=======>"+ subjectCnt);
		if(subjectCnt > 0){
			alert("커리큘럼에 사용되고 있어 삭제 할 수 없습니다."+ subjectCnt);
			return false;
		}else {
			return confirm("["+treeNode.name + "]  과목을 정말로 삭제 하시겠습니까?");
		}
	}
} 

//카테고리 삭제완료
function onRemove(event, treeId, treeNode, isCancel) {
	var tag = treeNode.tag;
	if(tag == "cate"){
		removeSubjectCate(treeNode); //삭제 후 루트 디렉토리 선택
	}else if(tag == "file"){
		removeSubject(treeNode);
	}
	
}

/**** 드레그 & 드롭 관련 ************************************/
//드래그 전
function beforeDrag(treeId, treeNodes) {
	console.log("드래그전");
	console.log(treeNodes);
	for (var i=0,l=treeNodes.length; i<l; i++) {
		if (treeNodes[i].drag === false) {
			return false;
		}
	}
	return true;
}

//드롭 전
function beforeDrop(treeId, treeNodes, targetNode, moveType) {
	console.log("beforeDrop()");
	console.log(targetNode.drop);
	if(targetNode.drop == false){
		alert("이동할수 없습니다.");
		return false;
	}
	return true;
}

//드롭 후
function onDrop(event, treeId, treeNodes, targetNode, moveType) {
	console.log("onDrop()");
	var tag = treeNodes[0].tag
	console.log(tag);
	if(tag == "file"){
		moveSubject(treeNodes, targetNode);
	}else if(tag == "cate"){
		moveSubjectCate(treeNodes, targetNode);
	}
};


/**** 과목상세 관련 ************************************/
//과목상세에서 수정버튼 클릭 할때
$("#btn_subject_modify").on("click", function(){
	modifySubject();
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

//카테고리 추가
function addSubjectCate(treeNode){  
	var parent_id = treeNode.subjectCate_id;
	var subjectCateVo = {
		cateName: "카테고리명을 작성하세요",
		parent_id: parent_id
	}
	$.ajax({
      url: "${pageContext.request.contextPath }/subject/addSubjectCate",
      type: "POST",
      data: subjectCateVo,
      dataType: "json",
      success: function(response) {
    	  var subjectCate_id = response.data.subjectCate_id;
    	  if(subjectCate_id != null){
    		  getCateAndSubjectList(subjectCate_id, "cate");
    		  cateMode();
    	  }
      },
      error: function(XHR, status, error) {
          console.error(status + " : " + error);
      }
  });
	
}

//카테고리 이름만 수정한다.
function modifySubjectCateName(treeNode){
	var subjectCate_id = treeNode.subjectCate_id;
	var cateName = treeNode.name;
	
	var subjectCateVo = {
		subjectCate_id: subjectCate_id,
		cateName: cateName
	}
	
	$.ajax({
    	url: "${pageContext.request.contextPath }/subject/modifySubjectCateName",
    	type: "POST",
   	 	data: subjectCateVo,
    	dataType: "json",
    	success: function(response) {
    		var modifyCnt = response.data;
    		if(modifyCnt >= 1){
    			getCateAndSubjectList(subjectCate_id, "cate");
    			cateMode();
    		}else {
    			alert("수정실패");
    		}
    	},
    	error: function(XHR, status, error) {
       		console.error(status + " : " + error);
    	}
	});
}
 
//카테고리를 삭제한다.
function removeSubjectCate(treeNode){
	var subjectCate_id = treeNode.subjectCate_id;
	
	var subjectCateVo = {
		subjectCate_id: subjectCate_id
	}
	
	$.ajax({
        url: "${pageContext.request.contextPath }/subject/removeSubjectCate",
        type: "POST",
        data: subjectCateVo,
        /* async: false, */
        dataType: "json",
        success: function(response) {
        	var removeCnt = response.data;
        	if(removeCnt >= 1){
        		getCateAndSubjectList(0, "cate");
        		cateMode();
        	}else {
        		console.log("카테고리삭제 실패");
    	}
        },
        error: function(XHR, status, error) {
            console.error(status + " : " + error);
        }
    });
}

//카테고리를 이동 드레그드롭(이동)
function moveSubjectCate(treeNodes, targetNode){
	var parent_id = targetNode.subjectCate_id;
	var subjectCate_id = treeNodes[0].subjectCate_id;
	
	var subjectCateVo = {
		subjectCate_id: subjectCate_id,
		parent_id: parent_id
	}
	$.ajax({
	    url: "${pageContext.request.contextPath }/subject/moveSubjectCate",
	    type: "POST",
	    data: subjectCateVo,
	    dataType: "json",
	    success: function(response) {
	    	var modifyCnt = response.data;
    		if(modifyCnt >= 1){
    			getCateAndSubjectList(subjectCate_id, "cate");
    			cateMode();
    		}else {
    			alert("이동실패");
    		}
	    },
	    error: function(request, status, error) {
	    	 console.error(status + " : " + error);
	    }
	});
	
}

/***************************************************************/
/* 과목 통신관련
/***************************************************************/
//과목 저장한다.
function addSubject(treeNode){
	var subjectCate_id = treeNode.subjectCate_id;
	var subjectVo = {
		subjectCate_id: subjectCate_id,
		subjectName: "과목제목을 입력하세요"
	}
	$.ajax({
	    url: "${pageContext.request.contextPath }/subject/addSubject",
	    type: "POST",
	    data: subjectVo,
	    dataType: "json",
	    success: function(response) {
	    	var subject_id = response.data.subject_id;
	    	if(subject_id != null){
	    		getCateAndSubjectList(subject_id, "file");
	    		subjectMode(subject_id);
	    	}else {
	    		alert("과목등록실패");
	    	}
	    },
	    error: function(request, status, error) {
	    	 console.error(status + " : " + error);
	    }
	});
}


//과목 제목만 수정
function modifySubjectName(treeNode){
	var subjectName = treeNode.name;
	var subject_id = treeNode.subject_id;
	
	var subjectVo = {
		subjectName: subjectName,
		subject_id: subject_id
	}
	
	$.ajax({
	    url: "${pageContext.request.contextPath }/subject/modifySubjectName",
	    type: "POST",
	    data: subjectVo,
	    dataType: "json",
	    success: function(response) {
	    	var modifyCnt = response.data;
	    	if(modifyCnt == 1){
	    		getCateAndSubjectList(subject_id, "file");
	    		subjectMode(subject_id);
	    	}else {
	    		alert("과목수정실패");
	    	}
	    },
	    error: function(XHR, status, error) {
	        console.error(status + " : " + error);
	    }
	});
}

//사용된 과목갯수(커리_과목) 조회 (과목 삭제시 사용)
function getCntCurriSubjectBySubject_id(treeNode){
	var subject_id = treeNode.subject_id;
	var subjectVo = {
		subject_id: subject_id
	}
	var subjectCnt ;
	
	$.ajax({
	    url: "${pageContext.request.contextPath }/curri/getCntCurriSubjectBySubject_id",
	    type: "POST",
	    data: subjectVo,
	    async: false,
	    dataType: "json",
	    success: function(response) {
	    	subjectCnt = response.data;
	    },
	    error: function(request, status, error) {
	    	 console.error(status + " : " + error);
	    }
	}); 
	
	return subjectCnt;
}



//과목 삭제
function removeSubject(treeNode){
	var subject_id = treeNode.subject_id;
	var subjectVo = {
		subject_id: subject_id
	}
	
	$.ajax({
	    url: "${pageContext.request.contextPath }/subject/removeSubject",
	    type: "POST",
	    data: subjectVo,
	   /*  async: false, */
	    dataType: "json",
	    success: function(response) {
	    	var removeCnt = response.data;
	    	if(removeCnt > 0){
	    		getCateAndSubjectList(0, "cate");
	    		cateMode();
	    	}else {
	    		alert("삭제된 데이타가 없습니다."+ removeCnt)
	    	}
	    },
	    error: function(request, status, error) {
	    	 console.error(status + " : " + error);
	    }
	}); 
}


//과목 상세정보를 가져온다.
function getSubject(subject_id){
	$.ajax({
	    url: "${pageContext.request.contextPath }/subject/getSubject",
	    type: "POST",
	    data: {"subject_id": subject_id},
	    /* async: false, */
	    dataType: "json",
	    success: function(response) {
	    	var subjectVo = response.data;
	    	subjectRender(subjectVo);
	    },
	    error: function(XHR, status, error) {
	        console.error(status + " : " + error);
	    }
	});	
}

//과목을 수정한다.
function modifySubject(){
	var subject_id = $("#frm_subject input[name='subject_id']").val();
	var subjectDesc = $("#frm_subject textarea[name='subjectDesc']").val();
	var subjectVo = {
		subject_id: subject_id,
		subjectDesc: subjectDesc
	}
	
	$.ajax({
	    url: "${pageContext.request.contextPath }/subject/modifySubject",
	    type: "POST",
	    data: subjectVo,
	    dataType: "json",
	    success: function(response) {
	    	var modifyCnt = response.data;
	    	if(modifyCnt == 1){
	    		getCateAndSubjectList(subject_id, "file");
	    		subjectMode(subject_id);
	    		alert("수정되었습니다.")
	    	}else {
	    		alert("과목수정실패");
	    	}
	    },
	    error: function(XHR, status, error) {
	        console.error(status + " : " + error);
	    }
	});
}

//과목을 이동 드레그드롭(이동)
function moveSubject(treeNodes, targetNode){
	var subject_id = treeNodes[0].subject_id;
	var subjectCate_id = targetNode.subjectCate_id;
	var subjectVo = {
		subject_id: subject_id,
		subjectCate_id: subjectCate_id
	}
	$.ajax({
	    url: "${pageContext.request.contextPath }/subject/moveSubject",
	    type: "POST",
	    data: subjectVo,
	    dataType: "json",
	    success: function(response) {
	    	var modifyCnt = response.data;
    		if(modifyCnt >= 1){
    			getCateAndSubjectList(subject_id, "file");
    			subjectMode(subject_id);
    		}else {
    			alert("이동실패");
    		}
	    },
	    error: function(request, status, error) {
	    	 console.error(status + " : " + error);
	    }
	});
	
}

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


/***************************************************************/
/* 과목 관련 랜더링
/***************************************************************/
//과목상세정보출력
function subjectRender(subjectVo){
	console.log("aaaa");
	console.log(subjectVo);
	$("#frm_subject #text_cateName").text(subjectVo.cateName);
	$("#frm_subject #text_subjectName").text(subjectVo.subjectName);
	$("#frm_subject textarea[name='subjectDesc']").val(subjectVo.subjectDesc);
	
	$("#frm_subject input[name='subjectCate_id']").val(subjectVo.subjectCate_id);
	$("#frm_subject input[name='subject_id']").val(subjectVo.subject_id); //과목정보영역과 커리큘럼 추가 모달창 두곳다 적요
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
}

</script>
