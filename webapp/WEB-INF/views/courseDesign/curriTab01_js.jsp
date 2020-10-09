<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<script type="text/javascript">

//자동저장 포커스아웃 이벤트
$(".curriAuto").on("focusout", function(){
	console.log("커리정보저장");
	var curri_id = $("#frm_curri input[name='curri_id']").val();
	var name = $(this).attr('name');
	var value = $(this).val();
	
	var autoSaveVo= {
		id: curri_id,
		key: name,
		value: value
	}
	modifyCurriAuto(autoSaveVo);
});



//커리큘럼 기본정보 자동 반영
function modifyCurriAuto(autoSaveVo){
	console.log(autoSaveVo);
	$.ajax({
	    url: "${pageContext.request.contextPath }/curri/modifyCurriAuto",
	    type: "POST",
	    data: autoSaveVo,
	    dataType: "json",
	    success: function(response) {
	     	console.log(response);
	    	var modifyCnt = response.data;
    		if(modifyCnt >= 1){
    			console.log("저장성공");
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
