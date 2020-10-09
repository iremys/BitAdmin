<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script type="text/javascript">
//코드 에디터(코드미러) 세팅
var textarea = document.getElementById('contentHtml');
var mixedMode = {
	name: "htmlmixed",
    scriptTypes: [{matches: /\/x-handlebars-template|\/x-mustache/i, mode: null},
        		  {matches: /(text|application)\/(x-)?vb(a|script)/i, mode: "vbscript"}]
};

var config = {                  
	lineNumbers: true,
	lineWrapping: true,
	mode: mixedMode
};

var editor = CodeMirror.fromTextArea(textarea, config );
editor.setSize(null, 450);

/***************************************************************/
/** 로딩될때 */
/***************************************************************/
$(document).ready(function(){
	
	
	getHContentFileList();
});




/***************************************************************/
/** 이벤트 */
/***************************************************************/
//첨부파일 버튼 클릭할때
$("#btn_fileUpload_open").on("click", function(){
	$("#contentFile").trigger("click");
	fileUpload();
});

//첨부파일 삭제 버튼 클릭할때
$("#fileList").on("click", ".btn_hConentFile_remove", function(){
	if(confirm("첨부파일을 삭제하시겠습니까?")){
		$thisDom = $(this)
		removeHContentFile($thisDom)
	}else{
		return;
	}
});

//컨텐츠 수정(저장) 버튼 클릭 할때
$("#btn_subject_modify").on("click", function(){
	console.log("버튼 클릭");
	modifyHContent();
});


/***************************************************************/
/* 통신관련
/***************************************************************/
//첨부파일 전부 가져오기
function getHContentFileList(){
	var parent_id = $("#frm_content input[name='hContent_id']").val();
	$.ajax({
		url: "${pageContext.request.contextPath }/hPage/getHContentFileList",
		data: {parent_id: parent_id},
		type: 'POST',
		success: function(response){
			console.log(response.data);
			var fileList = response.data;
			fileRender(fileList);
		},
	 	error: function(XHR, status, error) {
            console.error(status + " : " + error);
        }
	});
}


//첨부파일 등록
function fileUpload(){
	var formData = new FormData();
	formData.append("file", $("#contentFile")[0].files[0]);
	formData.append("hContent_id", $("#frm_content input[name='hContent_id']").val());
	$.ajax({
		url: "${pageContext.request.contextPath }/hPage/fileUpload",
		processData: false,
		contentType: false,
		data: formData,
		type: 'POST',
		success: function(response){
			console.log(response.data);
			var addCnt = response.data;
			if(addCnt == 1){
				getHContentFileList()
			}else {
				console.log("등록오류");
			}
			
		},
	 	error: function(XHR, status, error) {
            console.error(status + " : " + error);
        }
	});
}


//첨부파일 삭제하기
function removeHContentFile($thisDom){
	console.log($thisDom);
	var file_id = $thisDom.closest(".filebox").data("hcontentfile_id");
	
	$.ajax({
		url: "${pageContext.request.contextPath }/hPage/removeHContentFile",
		data: {file_id: file_id},
		type: 'POST',
		success: function(response){
			console.log(response.data);
			var removeCnt = response.data;
			if(removeCnt == 1){
				getHContentFileList()
			}else {
				console.log("삭제오류");
			}
			getHContentFileList();
		},
	 	error: function(XHR, status, error) {
            console.error(status + " : " + error);
        }
	}); 
}


//컨텐츠를 수정(저장)
function modifyHContent(){
	var hCate_id = $("#frm_content input[name='hCate_id']").val();
	var title = $("#frm_content input[name='title']").val();
	var aside_id = $("#frm_content select[name='aside_id']").val();
	var contentHtml = editor.getValue()
	var hContent_id = $("#frm_content input[name='hContent_id']").val();
	
	
	var hContentVo = {
		hCate_id: hCate_id,
		title: title,
		aside_id: aside_id,
		contentHtml: contentHtml,
		hContent_id: hContent_id
	}
	console.log("hContentVo-->", hContentVo)
	
	$.ajax({
		url: "${pageContext.request.contextPath }/hPage/modifyHContent",
		data: hContentVo,
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
			getHContentFileList();
		},
	 	error: function(XHR, status, error) {
            console.error(status + " : " + error);
        }
	});
}

/***************************************************************/
/* 랜더링
/***************************************************************/
function fileRender(fileList){
	$("#fileList").empty();
	for(var i in fileList){
		var html ="";
		html += "<div class='filebox' data-hcontentfile_id='"+fileList[i].file_id+"'>";
		html += "	<a href='${pageContext.request.contextPath }/upload/"+fileList[i].filePath+"'>";
		html +=			fileList[i].orgName 
		html += "	</a>";
		html += "	<span class='label label-danger mouse btn_hConentFile_remove pull-right'>X</span>";
		/* html += "	<span class='label label-primary mouse pull-right'>주소복사</span>"; */
		$("#fileList").append(html);
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

</script>
