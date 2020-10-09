<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script type="text/javascript">
/***************************************************************/
/** 로딩될때 */
/***************************************************************/
$(document).ready(function(){
	getCateAndCurriList(0, "cate");
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
var cncNodes = [];  
var cncSetting = {
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
/* 커리큘럼+카테고리 영역
/***************************************************************/
/**** 카테고리 or 노드 클릭시 ************************************/
//zTree에서 노드클릭시 상세정보 가져오기 ----------------------------------->
function beforeClick(treeId, treeNode, clickFlag){
	var tag = treeNode.tag;
	var curri_id = treeNode.curri_id;
	
	if(tag == "file"){
		console.log(curri_id);
		curriMode(curri_id);
	}else if(tag == "cate"){
		cateMode();
	}
}


//카테고리 선택시
function cateMode(){
	/* formClear("#frm_subject"); //폼초기화 */
	$(".cateDiv").show();
	$(".fileDiv").hide();
}

//과목선택시 
function curriMode(curri_id){
	/* formClear("#frm_subject"); //폼초기화 */
	$(".fileDiv").show();
	$(".cateDiv").hide();
	getCurri(curri_id); //커리큘럼정보 가져오기
}


/**** 오른쪽 메뉴 관련 ************************************/
//오른쪽메뉴 클릭이벤트
function onRightClick(event, treeId, treeNode) {
	showRMenu(event.clientX, event.clientY, treeNode);
}

//오른쪽메뉴 보이기
function showRMenu(x, y, treeNode) {
	console.log("오른쪽메뉴afd");
	console.log(treeNode);
	if(treeNode != null){
		rMenuNode = treeNode; //메뉴클릭시 선태된 노드값 전역으로 전달
		
		if (treeNode.tag == "cate") {
			console.log("카테고리 선택");
			if(treeNode.curriCate_id==0 ){
				console.log("루트일때");
				selectNodeById(treeNode.curriCate_id, "cate")
				$("#rMenu_cateTitle").show();
				$("#m_cate_remove").hide();
				$("#m_cate_modify").hide();
				$("#m_cate_add").show();
				$(".rMemu_line").show();
				$("#rMenu_curriTitle").show();
				$("#m_curri_remove").hide();
				$("#m_curri_modify").hide();
				$("#m_curri_add").show();
			}else {
				console.log("루트아닐때");
				selectNodeById(treeNode.curriCate_id, "cate")
				$("#rMenu_cateTitle").show();
				$("#m_cate_remove").show();
				$("#m_cate_modify").show();
				$("#m_cate_add").show();
				$(".rMemu_line").show();
				$("#rMenu_curriTitle").show();
				$("#m_curri_remove").hide();
				$("#m_curri_modify").hide();
				$("#m_curri_add").show();
			}
		}else if(treeNode.tag == "file") {
			selectNodeById(treeNode.curri_id, "file")
			$("#rMenu_cateTitle").hide();
			$("#m_cate_remove").hide();
			$("#m_cate_modify").hide();
			$("#m_cate_add").hide();
			$(".rMemu_line").hide();
			$("#rMenu_curriTitle").show();
			$("#m_curri_remove").show();
			$("#m_curri_modify").show();
			$("#m_curri_add").hide();
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
	addCurriCate(rMenuNode);
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



//오른쪽메뉴 > 커리큘럼 추가
$("#m_curri_add").on("click", function(event){
	hideRMenu();
	addCurri(rMenuNode);
});

//오른쪽메뉴 > 컬리큘럼 이름바꾸기
$("#m_curri_modify").on("click", function(){
	hideRMenu();
	zTreeObj.editName(rMenuNode); //beforeRename(), onRename() 연결됨
});

//오른쪽메뉴 > 커리큘럼 삭제
$("#m_curri_remove").on("click", function(){
	hideRMenu();
	zTreeObj.removeNode(rMenuNode, true); //beforeRemove(), onRemove() 연결됨
});



/**** 이름변경 관련(카테고리, 커리큘럼 둘다) ************************************/
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
		modifyCurriName(treeNode);
	}else if(tag == "cate"){
		console.log("카테고리이름변경");
		modifyCurriCateName(treeNode);
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
			alert("빈 카테고리가 아닙니다.")
			return false;
		}
	}else if(tag == "file"){
		//하위(커리스탭)가 있는지는 통신 후 판단
		console.log("커리삭제시작======================================");
		var subjectCnt = getCntCurriStepByCurri_id(treeNode);
		console.log(subjectCnt);
		
		if(subjectCnt > 0){
			alert("커리큘럼에 사용되고 있어 삭제 할 수 없습니다."+ subjectCnt);
			return false;
		}else {
			return confirm("["+treeNode.name + "]  커리큘럼을 정말로 삭제 하시겠습니까?");
		}
	}
} 

//카테고리 삭제완료
function onRemove(event, treeId, treeNode, isCancel) {
	var tag = treeNode.tag;
	if(tag == "cate"){
		removeCurriCate(treeNode); //삭제 후 루트 디렉토리 선택
	}else if(tag == "file"){
		removeCurri(treeNode);
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
		moveCurri(treeNodes, targetNode);
	}else if(tag == "cate"){
		moveCurriCate(treeNodes, targetNode);
	}
};



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

//카테고리 추가
function addCurriCate(treeNode){  
	var parent_id = treeNode.curriCate_id;
	var curriCateVo = {
		cateName: "카테고리명을 작성하세요",
		parent_id: parent_id
	}
	$.ajax({
    	url: "${pageContext.request.contextPath }/curri/addCurriCate",
     	type: "POST",
      	data: curriCateVo,
      	dataType: "json",
      	success: function(response) {
    		var curriCate_id = response.data.curriCate_id;
    	  	if(curriCate_id != null){
    			getCateAndCurriList(curriCate_id, "cate");
    		  	cateMode();
    	  	}
      	},
      	error: function(XHR, status, error) {
        	console.error(status + " : " + error);
      	}
 	});
}

//카테고리 이름만 수정한다.
function modifyCurriCateName(treeNode){
	var curriCate_id = treeNode.curriCate_id;
	var cateName = treeNode.name;
	
	var curriCateVo = {
		curriCate_id: curriCate_id,
		cateName: cateName
	}
	
	$.ajax({
  		url: "${pageContext.request.contextPath }/curri/modifyCurriCateName",
  		type: "POST",
 	 	data: curriCateVo,
  		dataType: "json",
  		success: function(response) {
  			var modifyCnt = response.data;
  			if(modifyCnt >= 1){
  				getCateAndCurriList(curriCate_id, "cate");
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
function removeCurriCate(treeNode){
	var curriCate_id = treeNode.curriCate_id;
	
	var curriCateVo = {
		curriCate_id: curriCate_id
	}
	
	$.ajax({
      url: "${pageContext.request.contextPath }/curri/removeCurriCate",
      type: "POST",
      data: curriCateVo,
      /* async: false, */
      dataType: "json",
      success: function(response) {
      	var removeCnt = response.data;
      	if(removeCnt >= 1){
      		getCateAndCurriList(0, "cate");
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
function moveCurriCate(treeNodes, targetNode){
	var parent_id = targetNode.curriCate_id;
	var curriCate_id = treeNodes[0].curriCate_id;
	
	var curriCateVo = {
		curriCate_id: curriCate_id,
		parent_id: parent_id
	}
	$.ajax({
	    url: "${pageContext.request.contextPath }/curri/moveCurriCate",
	    type: "POST",
	    data: curriCateVo,
	    dataType: "json",
	    success: function(response) {
	    	var modifyCnt = response.data;
    		if(modifyCnt >= 1){
    			getCateAndCurriList(curriCate_id, "cate");
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
/* 커리큘럼 통신관련
/***************************************************************/
//커리큘럼 저장한다.
function addCurri(treeNode){
	console.log("커리큘럼추가");
	console.log(treeNode);
	var curriCate_id = treeNode.curriCate_id;
	var curriVo = {
		curriCate_id: curriCate_id,
		curriName: "커리큘럼제목을 입력하세요"
	}
	console.log(curriVo);
	$.ajax({
	    url: "${pageContext.request.contextPath }/curri/addCurri",
	    type: "POST",
	    data: curriVo,
	    dataType: "json",
	    success: function(response) {
	    	var curri_id = response.data.curri_id;
	    	if(curri_id != null){
	    		getCateAndCurriList(curri_id, "file");
	    		curriMode(curri_id);
	    	}else {
	    		alert("커리큘럼등록실패");
	    	}
	    },
	    error: function(request, status, error) {
	    	 console.error(status + " : " + error);
	    }
	});
}

//커리큘럼 제목만 수정
function modifyCurriName(treeNode){
	var curriName = treeNode.name;
	var curri_id = treeNode.curri_id;
	
	var curriVo = {
		curriName: curriName,
		curri_id: curri_id
	}
	
	$.ajax({
	    url: "${pageContext.request.contextPath }/curri/modifyCurriName",
	    type: "POST",
	    data: curriVo,
	    dataType: "json",
	    success: function(response) {
	    	var modifyCnt = response.data;
	    	if(modifyCnt == 1){
	    		getCateAndCurriList(curri_id, "file");
	    		curriMode(curri_id);
	    	}else {
	    		alert("커리큘럼수정실패");
	    	}
	    },
	    error: function(XHR, status, error) {
	        console.error(status + " : " + error);
	    }
	});
}


//사용된 스탭(단계) 갯수 조회 (커리큘럼 삭제시 사용)
function getCntCurriStepByCurri_id(treeNode){
	var curri_id = treeNode.curri_id;
	var CurriInfoVo = {
		curri_id: curri_id
	}
	console.log("======>");
	console.log(CurriInfoVo);
	var curriStepCnt ;
	
	$.ajax({
	    url: "${pageContext.request.contextPath }/curri/getCntCurriStepByCurri_id",
	    type: "POST",
	    data: CurriInfoVo,
	    async: false,
	    dataType: "json",
	    success: function(response) {
	    	curriStepCnt = response.data;
	    },
	    error: function(request, status, error) {
	    	 console.error(status + " : " + error);
	    }
	}); 
	
	return curriStepCnt;

}


//커리큘럼 삭제(사용 되었는지 검사)
function removeCurri(treeNode){
	var curri_id = treeNode.curri_id;
	var curriVo = {
		curri_id: curri_id
	}
	
	$.ajax({
	    url: "${pageContext.request.contextPath }/curri/removeCurri",
	    type: "POST",
	    data: curriVo,
	    dataType: "json",
	    success: function(response) {
	    	var removeCnt = response.data;
	    	if(removeCnt >= 0){
	    		getCateAndCurriList(0, "cate");
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

//커리큘럼을 이동 드레그드롭(이동)
function moveCurri(treeNodes, targetNode){
	var curri_id = treeNodes[0].curri_id;
	var curriCate_id = targetNode.curriCate_id;
	var curriVo = {
		curri_id: curri_id,
		curriCate_id: curriCate_id
	}
	$.ajax({
	    url: "${pageContext.request.contextPath }/curri/moveCurri",
	    type: "POST",
	    data: curriVo,
	    dataType: "json",
	    success: function(response) {
	    	var modifyCnt = response.data;
    		if(modifyCnt >= 1){
    			getCateAndCurriList(curri_id, "file");
    			curriMode(curri_id);
    		}else {
    			alert("이동실패");
    		}
	    },
	    error: function(request, status, error) {
	    	 console.error(status + " : " + error);
	    }
	});
	
}


//커리큘럼 상세정보 가져오기
function getCurri(curri_id){
	console.log(curri_id);
	$.ajax({
	    url: "${pageContext.request.contextPath }/curri/getCurri",
	    type: "POST",
	    data: {curri_id: curri_id},
	    dataType: "json",
	    success: function(response) {
	    	console.log(response);
	    	var curroVo = response.data;
    		if(curroVo != null){
    			curriRender(curroVo);
    			/* curriMode(curri_id); */
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
/* 커리큘럼+카테고리 관련 랜더링
/***************************************************************/
//메인에 카테고리 + 커리큘럼 리스트를 출력한다.zTree
function cateAndCurriRender(cateAndCurriList){
	var curriCateList = cateAndCurriList.curriCateList;
	var curriList = cateAndCurriList.curriList;
	cncNodes = []; //비우기
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
		cncNodes.push(node);
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
		cncNodes.push(node);
	}
	
	$.fn.zTree.init($("#ztree_cnc"), cncSetting, cncNodes);
	zTreeObj = $.fn.zTree.getZTreeObj("ztree_cnc");
}



/***************************************************************/
/* 커리큘럼 관련 랜더링---------------------------------------------->작업중
/***************************************************************/
//커리큘럼(기본정보+과목들 조합 모두)
function curriRender(curriVo){
	console.log("curriRender(curriVo)");
	console.log(curriVo);
	/* 초기화 */	
	$('#tbl_curriSubject').empty();
	
	/* 공통정보 */	
	$("#frm_curri #text_cateName").text(curriVo.cateName); //카테고리명
	$("#frm_curri #text_curriName").text(curriVo.curriName); //커리큘럼명
	$("#frm_curri input[name='totalTime']").val(curriVo.totalTime); //총시간
	
	/* 탭1 */
	$("#frm_curri textarea[name='goal']").val(curriVo.goal); //목적 및 목표
	$("#frm_curri textarea[name='content']").val(curriVo.content); //주요내용
	$("#frm_curri textarea[name='target']").val(curriVo.target); //대상요건
	
	/* 탭2 :핸들바*/
 	var source = $("#curriSubject_html").html(); //핸들바 템플릿 가져오기
	var template = Handlebars.compile(source); //핸들바 템플릿 컴파일
	var html = template(curriVo);//핸들바 템플릿에 데이터를 바인딩해서 HTML 생성
	$('#tbl_curriSubject').append(html);//생성된 HTML을 DOM에 주입
 	
	/* 히든 */
	$("#frm_curri input[name='curriCate_id']").val(curriVo.curriCate_id); //curriCate_id
	$("#frm_curri input[name='curri_id']").val(curriVo.curri_id); //curri_id
	
	/* 토탈시간 */
	calculateTotalTime();
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

//저장메세지
function messageBox(){
	var html = "div style='po'"
}
	
	
	

</script>
