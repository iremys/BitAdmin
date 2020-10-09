<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script type="text/javascript">
/***************************************************************/
/** 로딩될때 */
/***************************************************************/
$(document).ready(function(){
	getCateAndClassList(0, "cate");
	/* cateMode(); */
	/* classMode(); */
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
/* 클래스(반)+카테고리 영역
/***************************************************************/

/**** 카테고리 or 노드 클릭시 ************************************/
//zTree에서 노드클릭시 상세정보 가져오기 ----------------------------------->
function beforeClick(treeId, treeNode, clickFlag){
	var tag = treeNode.tag;
	var class_id = treeNode.class_id;
	console.log("==============================");
	console.log(class_id);
	if(tag == "file"){
		classMode(class_id);
	}else if(tag == "cate"){
		cateMode();
	}
}

//카테고리 선택시
function cateMode(){
	$(".cateDiv").show();
	$(".fileDiv").hide();
	/* formClear("#frm_subject"); */ //폼초기화
}


//클래스(반) 선택시 
function classMode(class_id){
	$(".fileDiv").show();
	$(".cateDiv").hide();
	/* formClear("#frm_subject"); //폼초기화*/
	getClass(class_id); //과목정보 가져오기
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
			if(treeNode.classCate_id==0 ){
				console.log("루트일때");
				selectNodeById(treeNode.classCate_id, "cate")
				$("#rMenu_cateTitle").show();
				$("#m_cate_remove").hide();
				$("#m_cate_modify").hide();
				$("#m_cate_add").show();
				$(".rMemu_line").show();
				$("#rMenu_classTitle").show();
				$("#m_class_remove").hide();
				$("#m_class_modify").hide();
				$("#m_class_add").show();
			}else{
				console.log("루트아닐때");
				selectNodeById(treeNode.classCate_id, "cate")
				$("#rMenu_cateTitle").show();
				$("#m_cate_remove").show();
				$("#m_cate_modify").show();
				$("#m_cate_add").show();
				$(".rMemu_line").show();
				$("#rMenu_classTitle").show();
				$("#m_class_remove").hide();
				$("#m_class_modify").hide();
				$("#m_class_add").show();
			}
		}else if(treeNode.tag == "file") {
			selectNodeById(treeNode.class_id, "file")
			$("#rMenu_cateTitle").hide();
			$("#m_cate_remove").hide();
			$("#m_cate_modify").hide();
			$("#m_cate_add").hide();
			$(".rMemu_line").hide();
			$("#rMenu_classTitle").show();
			$("#m_class_remove").show();
			$("#m_class_modify").show();
			$("#m_class_add").hide();
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
	addClassCate(rMenuNode);
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
$("#m_class_add").on("click", function(event){
	hideRMenu();
	addClass(rMenuNode);
});

//오른쪽메뉴 > 과목 이름바꾸기
$("#m_class_modify").on("click", function(){
	hideRMenu();
	zTreeObj.editName(rMenuNode); //beforeRename(), onRename() 연결됨
});

//오른쪽메뉴 > 과목 삭제
$("#m_class_remove").on("click", function(){
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
		modifyClassName(treeNode);
	}else if(tag == "cate"){
		console.log("카테고리이름변경");
		modifyClassCateName(treeNode);
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
		//하위가 있는지는 통신 후 판단  --> 지원자가 있으면 삭제안됨
		console.log("클래스(반) 삭제 시작=======>");
		/* var subjectCnt = getCntCurriSubjectBySubject_id(treeNode); 지원자 확인 로직*/
		var applicant = 0;
		if(applicant > 0){
			alert("지원자가 있어 삭제 할 수 없습니다."+ subjectCnt);
			return false;
		}else {
			return confirm("["+treeNode.name + "]  클래스(반)을 정말로 삭제 하시겠습니까?");
		}
	}
} 

//카테고리 삭제완료
function onRemove(event, treeId, treeNode, isCancel) {
	var tag = treeNode.tag;
	if(tag == "cate"){
		removeClassCate(treeNode); //삭제 후 루트 디렉토리 선택
	}else if(tag == "file"){
		removeClass(treeNode);
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
	 	moveClass(treeNodes, targetNode); 
	}else if(tag == "cate"){
		moveClassCate(treeNodes, targetNode);
	}
};


/***************************************************************/
/* 카테고리 통신관련
/***************************************************************/
//카테+과목 리스트 가져온다.
function getCateAndClassList(id, tag){  
	$.ajax({
        url: "${pageContext.request.contextPath }/class/getCateAndClassList",
        type: "POST",
        /* data: data, */
        /* async: false, */
        dataType: "json",
        success: function(response) {
        	var cateAndClassList = response.data;
        	cateAndClassRender(cateAndClassList);
        	selectNodeById(id, tag);
        },
        error: function(XHR, status, error) {
            console.error(status + " : " + error);
        }
    });
	
}


//카테고리 추가
function addClassCate(treeNode){  
	var parent_id = treeNode.classCate_id;
	var classCateVo = {
		cateName: "카테고리명을 작성하세요",
		parent_id: parent_id
	}
	$.ajax({
      url: "${pageContext.request.contextPath }/class/addClassCate",
      type: "POST",
      data: classCateVo,
      dataType: "json",
      success: function(response) {
    	  var classCate_id = response.data.classCate_id;
    	  if(classCate_id != null){
    		  getCateAndClassList(classCate_id, "cate");
    		  cateMode();
    	  }
      },
      error: function(XHR, status, error) {
          console.error(status + " : " + error);
      }
  });
	
}


//카테고리 이름만 수정한다.
function modifyClassCateName(treeNode){
	var classCate_id = treeNode.classCate_id;
	var cateName = treeNode.name;
	
	var classCateVo = {
		classCate_id: classCate_id,
		cateName: cateName
	}
	
	$.ajax({
  	url: "${pageContext.request.contextPath }/class/modifyClassCateName",
  	type: "POST",
 	 	data: classCateVo,
  	dataType: "json",
  	success: function(response) {
  		var modifyCnt = response.data;
  		if(modifyCnt >= 1){
  			getCateAndClassList(classCate_id, "cate");
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
function removeClassCate(treeNode){
	var classCate_id = treeNode.classCate_id;
	
	var classCateVo = {
		classCate_id: classCate_id
	}
	
	$.ajax({
        url: "${pageContext.request.contextPath }/class/removeClassCate",
        type: "POST",
        data: classCateVo,
        /* async: false, */
        dataType: "json",
        success: function(response) {
        	var removeCnt = response.data;
        	if(removeCnt >= 1){
        		getCateAndClassList(0, "cate");
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
function moveClassCate(treeNodes, targetNode){
	var parent_id = targetNode.classCate_id;
	var classCate_id = treeNodes[0].classCate_id;
	
	var classCateVo = {
		classCate_id: classCate_id,
		parent_id: parent_id
	}
	$.ajax({
	    url: "${pageContext.request.contextPath }/class/moveClassCate",
	    type: "POST",
	    data: classCateVo,
	    dataType: "json",
	    success: function(response) {
	    	var modifyCnt = response.data;
  		if(modifyCnt >= 1){
  			getCateAndClassList(classCate_id, "cate");
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
/* 클래스(반) 통신관련
/***************************************************************/
//클래스(반) 저장한다.
function addClass(treeNode){
	var classCate_id = treeNode.classCate_id;
	var classVo = {
		classCate_id: classCate_id,
		className: "클래스(반)제목을 입력하세요"
	}
	$.ajax({
	    url: "${pageContext.request.contextPath }/class/addClass",
	    type: "POST",
	    data: classVo,
	    dataType: "json",
	    success: function(response) {
	    	var class_id = response.data.class_id;
	    	if(class_id != null){
	    		getCateAndClassList(class_id, "file");
	    		classMode(class_id);
	    	}else {
	    		alert("클래스등록실패");
	    	}
	    },
	    error: function(request, status, error) {
	    	 console.error(status + " : " + error);
	    }
	});
}


//클래스(반) 제목만 수정
function modifyClassName(treeNode){
	var className = treeNode.name;
	var class_id = treeNode.class_id;
	
	var classVo = {
		className: className,
		class_id: class_id
	}
	
	$.ajax({
	    url: "${pageContext.request.contextPath }/class/modifyClassName",
	    type: "POST",
	    data: classVo,
	    dataType: "json",
	    success: function(response) {
	    	var modifyCnt = response.data;
	    	if(modifyCnt == 1){
	    		getCateAndClassList(class_id, "file");
	    		classMode(class_id);
	    	}else {
	    		alert("클래스(반) 수정실패");
	    	}
	    },
	    error: function(XHR, status, error) {
	        console.error(status + " : " + error);
	    }
	});
}


//지원자 수 조회 (클래스(반) 삭제시 사용)


//클래스(반) 삭제
function removeClass(treeNode){
	var class_id = treeNode.class_id;
	var classVo = {
		class_id: class_id
	}
	
	$.ajax({
	    url: "${pageContext.request.contextPath }/class/removeClass",
	    type: "POST",
	    data: classVo,
	   /*  async: false, */
	    dataType: "json",
	    success: function(response) {
	    	var removeCnt = response.data;
	    	if(removeCnt > 0){
	    		getCateAndClassList(0, "cate");
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


//클래스(반) 상세정보를 가져온다.
function getClass(class_id){
	console.log(class_id);
	$.ajax({
	    url: "${pageContext.request.contextPath }/class/getClass",
	    type: "POST",
	    data: {class_id: class_id},
	    dataType: "json",
	    success: function(response) {
	    	console.log(response);
	    	var classVo = response.data;
    		if(classVo != null){
    			console.log(classVo);
    			classRender(classVo);
    			/* classRender(classVo); */
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





//클래스(반) 을 수정한다.

//클래스(반)을 이동 드레그드롭(이동)
function moveClass(treeNodes, targetNode){
	var class_id = treeNodes[0].class_id;
	var classCate_id = targetNode.classCate_id;
	var classVo = {
		class_id: class_id,
		classCate_id: classCate_id
	}
	$.ajax({
	    url: "${pageContext.request.contextPath }/class/moveClass",
	    type: "POST",
	    data: classVo,
	    dataType: "json",
	    success: function(response) {
	    	var modifyCnt = response.data;
  		if(modifyCnt >= 1){
  			getCateAndClassList(class_id, "file");
  			classMode(class_id);
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
function cateAndClassRender(cateAndClassList){
	var classCateList = cateAndClassList.classCateList;
	var classList = cateAndClassList.classList;
	cncNodes = []; //비우기
	for(var i in classCateList){
		var node = {
			id: "c_" + classCateList[i].classCate_id, 
			pId: "c_" + classCateList[i].parent_id, 
			name: classCateList[i].cateName, 
			open: open,
			icon: i_cate_open, 
			iconClose: i_cate_close,
			classCate_id: classCateList[i].classCate_id,
			parent_id: classCateList[i].parent_id,
			tag:"cate"
		}
		cncNodes.push(node);
	}
	for(var i in classList){
		var node = {
			id: "f_" + classList[i].class_id, 
			pId: "c_" + classList[i].classCate_id, 
			name: classList[i].className, 
			open: open,
			drop: false,
			icon: i_item, 
			iconClose: i_item,
			class_id: classList[i].class_id,
			tag:"file"
		}
		cncNodes.push(node);
	}
	
	$.fn.zTree.init($("#ztree_cnc"), cncSetting, cncNodes);
	zTreeObj = $.fn.zTree.getZTreeObj("ztree_cnc");
}

/***************************************************************/
/* 클래스(반) 관련 랜더링
/***************************************************************/
//클래스(반) 상세정보출력
function classRender(classVo){
	console.log("classRender()");
	console.log(classVo);
	formClear("#frm_class");
	$("#frm_class #text_classCateName").text(classVo.cateName); //카테고리명(업무구분)
	$("#frm_class #text_curriName").text(classVo.curriName); //사용한 커리큘럼명
	$("#frm_class #text_className").text(classVo.className); //클래스(반) 이름
	$("#frm_class input[name='classCode']").val(classVo.classCode); //클래스(반) 관리코드
	$("#frm_class input[name='startDate']").val(classVo.startDate); //시작일
	$("#frm_class input[name='endDate']").val(classVo.endDate);//종료일
	$("#frm_class input[name='maxCnt']").val(classVo.maxCnt);//정원
	
	if(classVo.testDateList[0]     != null){
		$("#frm_class input[name='testDate']").val(classVo.testDateList[0].testDate);//전형일
		$("#frm_class select[name='testTime']").val(classVo.testDateList[0].testTime).prop("selected", "selected");//전형시간
		$("#frm_class input[name='testDate_id']").val(classVo.testDateList[0].testDate_id);
	}
	console.log("----------");
	$("#frm_class input[name='testDate_id']").val();
	console.log("----------");
	$("#frm_class input[name='lectureTime']").val(classVo.lectureTime);//강의시간
	$("#frm_class input[name='price']").val(classVo.price);//교육비용
	$("#frm_class select[name='support']").val(classVo.support).prop("selected", "selected");//교육비지원
	$("#frm_class input[name='managerInfo']").val(classVo.managerInfo);//문의(담당자)
	$("#frm_class input[name='pageURL']").val(classVo.pageURL);//상세페이지링크
	$("#frm_class #pageURL").prop("href", classVo.pageURL);//바로가기링크
	$("#frm_class input:radio[name='operState'][value="+classVo.operState+"]").prop("checked", true);//운영상태
	$("#frm_class input[name='gisuName']").val(classVo.gisuName);//기수명
	
	//히든
	$("#frm_class input[name='classCate_id']").val(classVo.classCate_id);//카테고리코드
	$("#frm_class input[name='class_id']").val(classVo.class_id);//클래스(반)코드
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


//알림 박스
function notiBox(){
	$("#notiBox").fadeIn();
	setTimeout(function(){
		//$("#notiBox").css('display','none');
		$("#notiBox").fadeOut();
	},2000);
}

/* -------------------------------------------------------------------------------------------------- */

/***************************************************************/
/* 클래스(반) 상세정보
/***************************************************************/
//자동저장 포커스아웃 이벤트
$(".classAuto").on("focusout", function(){
	console.log("클래스(반) 정보 저장");
	var class_id = $("#frm_class input[name='class_id']").val();
	var name = $(this).attr('name');
	var value = $(this).val();
	
	var autoSaveVo= {
		id: class_id,
		key: name,
		value: value
	}
	modifyClassAuto(autoSaveVo);
});


//url 입력시 바로가기 적용
$("#frm_class input[name='pageURL']").on("keyup", function(){
	var crtUrl = $("#frm_class input[name='pageURL']").val();
	$("#frm_class #pageURL").prop("href", crtUrl);
});


//전형일자 포커스아웃 이벤트
$(".testDateAuto").on("focusout", function(){
	console.log("전형일자 정보 저장");
	
	//저장과 수정을 구분
	var testDate_id = $("input[name='testDate_id'").val();
	if(testDate_id == -1){
		console.log("저장");
		$this = $(this);
		var id = $("input[name='class_id']").val();
		var name = $this.attr('name');
		var value = $this.val();
		
		var autoSaveVo= {
			id: id,
			key: name,
			value: value
		}
		console.log(autoSaveVo);
		addTestDateAuto(autoSaveVo);
	}else{
		console.log("수정");
		$this = $(this);
		var name = $this.attr('name');
		var value = $this.val();
		var id = $this.closest("div").children("input[name='testDate_id']").val();

		var autoSaveVo= {
			id: id,
			key: name,
			value: value
		}
		console.log(autoSaveVo);
		modifyTestDateAuto(autoSaveVo);
	}
});



$("#btn_curri_remove").on("click", function(){
	var class_id = $("input[name='class_id']").val();
	removeCurriAtClass(class_id);
	
	
});


/***************************************************************/
/* 클래스(반) 상세정보 통신
/***************************************************************/
//클래스(반) 기본정보 자동 반영
function modifyClassAuto(autoSaveVo){
	console.log(autoSaveVo);
	$.ajax({
	    url: "${pageContext.request.contextPath }/class/modifyClassAuto",
	    type: "POST",
	    data: autoSaveVo,
	    dataType: "json",
	    success: function(response) {
	     	console.log(response);
	    	var modifyCnt = response.data;
    		if(modifyCnt == 1){
    			console.log("저장성공");
    			notiBox();
    		}else {
    			alert("저장실패");
    		} 
	    },
	    error: function(request, status, error) {
	    	 console.error(status + " : " + error);
	    }
	});
	
}





//전형일자 자동 반영: 클래스(반)
function modifyTestDateAuto(autoSaveVo){
	console.log(autoSaveVo);
	$.ajax({
	    url: "${pageContext.request.contextPath }/class/modifyTestDateAuto",
	    type: "POST",
	    data: autoSaveVo,
	    dataType: "json",
	    success: function(response) {
	     	console.log(response);
	    	var modifyCnt = response.data;
  		if(modifyCnt == 1){
  			console.log("저장성공");
  			notiBox();
  		}else {
  			alert("저장실패");
  		} 
	    },
	    error: function(request, status, error) {
	    	 console.error(status + " : " + error);
	    }
	});
	
}


//커리큘럼 삭제(클래스info 테이블 정보수정)
function removeCurriAtClass(class_id){
	console.log(class_id);
	$.ajax({
	    url: "${pageContext.request.contextPath }/class/removeCurriAtClass",
	    type: "POST",
	    data: {class_id: class_id},
	    dataType: "json",
	    success: function(response) {
	     	console.log(response);
	    	var modifyCnt = response.data;
	  		if(modifyCnt == 1){
	  			console.log("수정성공");
	  			$("#text_curriName").text("");
	  		}else {
	  			alert("저장실패");
	  		} 
	    },
	    error: function(request, status, error) {
	    	 console.error(status + " : " + error);
	    }
	});
	
}



//전형일자 자동 반영: 클래스(반)  --> 저장 수정 구분해야함
function addTestDateAuto(autoSaveVo){
	console.log(autoSaveVo);
	$.ajax({
	    url: "${pageContext.request.contextPath }/class/addTestDateAuto",
	    type: "POST",
	    data: autoSaveVo,
	    dataType: "json",
	    success: function(response) {
	     	console.log(response);
	    	var modifyCnt = response.data;
		if(modifyCnt == 1){
			console.log("저장성공");
			notiBox();
		}else {
			alert("저장실패");
		} 
	    },
	    error: function(request, status, error) {
	    	 console.error(status + " : " + error);
	    }
	});
	
}

</script>














