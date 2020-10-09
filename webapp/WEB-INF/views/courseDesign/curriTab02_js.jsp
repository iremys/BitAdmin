<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<script type="text/javascript">
//구성과목탭 > 단계+과목 세트 추가 버튼 클릭시
$("#btn_add_step").on("click", function(){
	console.log("단계추가");
	
	addCurriStep();
	
});

//구성과목탭  > 단계 삭제 버튼 클릭시(하위의 과목 다 삭제된다.)
$("#tbl_curriSubject").on("click", ".btn_step_remove", function(){
	console.log("단계삭제");
	var $this = $(this).closest(".tbl_curriStep");
	console.log($this);
	removeCurriStep($this);
	
	//하위가 있는지 판단 -->서비스에서

	//지우기 로직...
	/* $this.remove(); */
	
});


//구성과목탭  > (과목)추가 버튼 클릭시
$("#tbl_curriSubject").on("click", ".btn_add_curriSubject",  function(){
	console.log("(과목)추가");
	
	var $this = $(this).closest("tr");
	addCurriSubject($this);
});


//구성과목탭  > (과목)삭제 버튼 클릭시
$("#tbl_curriSubject").on("click", ".btn_subject_remove",  function(){
	console.log("(과목)삭제");
	var $this = $(this).closest("tr");
	console.log($this);
	
	removeCurriSubject($this);
	
});




//스탭 --> 순서, 단계명 자동저장
$("#tbl_curriSubject").on("focusout", ".curriStepAuto", function(){
	console.log("스탭저장");
	var curriStep_id = $(this).closest(".tbl_curriStep").data("curristep_id");
	var name = $(this).attr('name');
	var value = $(this).val();
	
	var autoSaveVo= {
		id: curriStep_id,
		key: name,
		value: value
	}
	console.log(autoSaveVo);
	modifyCurriStepAuto(autoSaveVo);
	
	
});


//과목 --> 순서, 시간 자동저장
$("#tbl_curriSubject").on("focusout", ".curriSubjectAuto", function(){
	console.log("과목저장");
	var currisubject_id = $(this).closest(".tr_curri").data("currisubject_id");
	var name = $(this).attr('name');
	var value = $(this).val();
	
	var autoSaveVo= {
		id: currisubject_id,
		key: name,
		value: value
	}
	console.log(autoSaveVo);
	modifyCurriSubjectAuto(autoSaveVo);
});


//시간 입력시 총 시간 계산
$("#tbl_curriSubject").on("keyup", "input[name='subjectTime']", function(){
	calculateTotalTime();
});

function calculateTotalTime(){
	var totalTime = 0;
	$("#tbl_curriSubject input[name='subjectTime']").each(function(){
		totalTime += Number($(this).val());
	});
	$("#text_totalTime").text(totalTime);
	
	return totalTime;
}

/* 과목선택버튼 클릭시-->모달창*/
/* curriModal.jsp */



/***************************************************************/
/* 통신관련
/***************************************************************/
/* 커리큘러테이블 구성과목의 단계추가 단계+과목이 추가된다.*/
function addCurriStep(){
	console.log("단계추가 통신");
	var curri_id = $("#frm_curri input[name='curri_id']").val();
	$.ajax({
	    url: "${pageContext.request.contextPath }/curri/addCurriStep",
	    type: "POST",
	    data: {curri_id: curri_id},
	    dataType: "json",
	    success: function(response) {
	    	console.log(response.data);
	    	var curriSubjectVo = response.data;
	    	console.log(curriSubjectVo);
			//단계+과목 UI을 추가한다.
			/* 탭2 :핸들바*/
		 	var source = $("#step_html").html(); //핸들바 템플릿 가져오기
			var template = Handlebars.compile(source); //핸들바 템플릿 컴파일
			var html = template(curriSubjectVo);//핸들바 템플릿에 데이터를 바인딩해서 HTML 생성
			$("#tbl_curriSubject").append(html); //생성된 HTML을 DOM에 주입 */
	    	
	    },
	    error: function(XHR, status, error) {
	        console.error(status + " : " + error);
	    }
	});
}



/* 커리큘러테이블 구성과목의 단계삭제 */
function removeCurriStep($this){
	console.log("removeCurriSubject()");
	console.log($this);
	
	var curriStep_id = $this.data("curristep_id");
	
	$.ajax({
	    url: "${pageContext.request.contextPath }/curri/removeCurriStep",
	    type: "POST",
	    data: {curriStep_id: curriStep_id},
	    dataType: "json",
	    success: function(response) {
	    	var removeCnt = response.data;
	    	if(removeCnt == -1){
	    		alert("과목을 먼저 삭제해주세요");
	    	}else if(removeCnt > 0) {
	    		($this).remove();
	    	}else {
	    		alert("삭제에 실패했습니다.");
	    	}
	    },
	    error: function(XHR, status, error) {
	        console.error(status + " : " + error);
	    }
	});
}



/* 커리큘러테이블 구성과목의 과목삭제 */
function removeCurriSubject($this){
	console.log("removeCurriSubject()");
	console.log($this);
	
	var curriSubject_id = $this.data("currisubject_id");
	
	$.ajax({
	    url: "${pageContext.request.contextPath }/curri/removeCurriSubject",
	    type: "POST",
	    data: {curriSubject_id: curriSubject_id},
	    dataType: "json",
	    success: function(response) {
	    	var removeCnt = response.data;
	    	if(removeCnt == 1){
	    		$this.remove();
	    	}else {
	    		alert("과목삭제실패");
	    	}	    	
	    },
	    error: function(XHR, status, error) {
	        console.error(status + " : " + error);
	    }
	});
}

/* 커리큐럼테이블 구성과목의 과목추가(키값만 생긴다) */
function addCurriSubject($this){
	console.log("addurriSubject($this)");
	console.log($this);
	
	var curriStep_id = $this.closest("table").data("curristep_id");
	console.log(curriStep_id);	
	 $.ajax({
	    url: "${pageContext.request.contextPath }/curri/addCurriSubject",
	    type: "POST",
	    data: {curriStep_id: curriStep_id},
	    dataType: "json",
	    success: function(response) {
	    	var curriSubjectVo = response.data;
	    	if(curriSubjectVo.curriSubject_id > 0){
	    		var source = $("#subject_html").html(); //핸들바 템플릿 가져오기
	    		var template = Handlebars.compile(source); //핸들바 템플릿 컴파일
	    		var html = template(curriSubjectVo);//핸들바 템플릿에 데이터를 바인딩해서 HTML 생성
	    		$this.after(html);//생성된 HTML을 DOM에 주입
	    	}else {
	    		alert("과목등록실패");
	    	}	    	
	    },
	    error: function(XHR, status, error) {
	        console.error(status + " : " + error);
	    }
	}); 
}



//커리큘럼 단계정보 자동 반영
function modifyCurriStepAuto(autoSaveVo){
	console.log(autoSaveVo);
	$.ajax({
	    url: "${pageContext.request.contextPath }/curri/modifyCurriStepAuto",
	    type: "POST",
	    data: autoSaveVo,
	    dataType: "json",
	    success: function(response) {
	     	console.log(response);
	    	var modifyCnt = response.data;
  		if(modifyCnt >= 1){
  			if(autoSaveVo.key == "stepOrder"){
  				console.log("스탭순서 변경");
  				curriMode($("#frm_curri input[name='curri_id']").val())
  			}
  		}else {
  			alert("저장실패");
  		} 
	    },
	    error: function(request, status, error) {
	    	 console.error(status + " : " + error);
	    }
	});
	
}


//커리큘럼에서 과목 정보 자동 반영
function modifyCurriSubjectAuto(autoSaveVo){
	console.log(autoSaveVo);
	$.ajax({
	    url: "${pageContext.request.contextPath }/curri/modifyCurriSubjectAuto",
	    type: "POST",
	    data: autoSaveVo,
	    dataType: "json",
	    success: function(response) {
	     	console.log(response);
	    	var modifyCnt = response.data;
  		if(modifyCnt >= 1){
  			console.log("저장성공");
  			if(autoSaveVo.key == "stepInOrder"){
  				console.log("순서 변경");
  				curriMode($("#frm_curri input[name='curri_id']").val())
  			}
  		}else {
  			alert("저장실패");
  		} 
	    },
	    error: function(request, status, error) {
	    	 console.error(status + " : " + error);
	    }
	});
	
}

//커리큘럼 step max값 가져오기
/* function getMaxCurriStepOrder(curri_id){
	var maxStepOrder;
	$.ajax({
	    url: "${pageContext.request.contextPath }/curri/getMaxCurriStepOrder",
	    type: "POST",
	    data: {curri_id: curri_id},
	    async: false,
	    dataType: "json",
	    success: function(response) {
	    	if(response.data > 0){
	    		maxStepOrder = response.data;
	    	}else {
	    		maxStepOrder = 0;
	    	}
	    },
	    error: function(XHR, status, error) {
	        console.error(status + " : " + error);
	    }
	});
	
	return maxStepOrder;
} */


</script>

<!-- 커리큘럼 단계+과목 값 포함 템플릿 -->
<script id=curriSubject_html type="text/x-handlebars-template">

{{#each curriStepList}} 
<table class="table table-condensed tbl_curriStep" data-curristep_id="{{curriStep_id}}" data-steporder="{{stepOrder}}">
	 <colgroup>
		<col width="8%">
		<col width="6%">
		<col width="20%">
		<col width="50%">
		<col width="10%">
		<col width="6%">
	</colgroup>
	<tbody>
		<tr>
			<th class="form-inline" width="8%">
				<input type="text" name="stepOrder" class="form-control w30 curriStepAuto" placeholder="" value="{{stepOrder}}">				
				<span>단계</span>
			</th>
			<th colspan="4" width="84%">
				<input type="text" name="stepName" class="form-control curriStepAuto" placeholder="" value="{{stepName}}">
			</th>
			<th class="text-center" width="6%">
				<span class="label label-danger mouse btn_step_remove">X</span>
			</th>
		</tr>
		
		{{#each curriSubjectList}} 
		<tr class="tr_curri" data-currisubject_id="{{curriSubject_id}}" >
			<th class="form-inline" width="8%">
				순서
				<input type="text" name="stepInOrder" class="form-control w30 curriSubjectAuto" placeholder="" value="{{stepInOrder}}">
			</th>
			<td class="form-inline" width="6%">
				<button class="btn btn-default btn-h25 btn_subjectList_modal_open" type="button">선택</button>
			</td>
			<td class="form-inline" width="20%">
				<div class="div_subjectName">{{subjectName}}</div>
			</td>
			<td width="50%">
				<textarea readonly class="div_subjectDesc readOnly">{{subjectDesc}}</textarea>
			</td>
			<td class="form-inline" width="10%">
				<input type="text" name="subjectTime" class="form-control w30 curriSubjectAuto" placeholder="" value="{{subjectTime}}">&nbsp;시간
			</td>
			<td class="text-center" width="6%">
				<div class="div_up">
					<button class="btn btn-default btn-h25 btn_add_div_up btn_add_curriSubject" type="button" >추가</button>
				</div>
				<div class="div_down">
					<div class="label label-danger mouse v_bottom btn_subject_remove">X</div>
				</div>
			</td>
		</tr>
		{{/each}} 

	</tbody>
</table>
{{/each}} 

</script>




<!-- 스텝테이블 그리기 (스탭+1개과목) -->
<script id=step_html type="text/x-handlebars-template">
<table class="table table-condensed tbl_curriStep" data-curristep_id="{{curriStep_id}}" data-steporder="{{stepOrder}}">
 	<colgroup>
		<col width="8%">
		<col width="6%">
		<col width="20%">
		<col width="50%">
		<col width="10%">
		<col width="6%">
	</colgroup>
	<tbody>
		<tr>
			<th class="form-inline" width="8%">
				<input type="text" name="stepOrder" class="form-control w30 curriStepAuto" placeholder="" value="{{stepOrder}}">				
				<span>단계</span>
			</th>
			<th colspan="4" width="84%">
				<input type="text" name="stepName" class="form-control curriStepAuto" placeholder="" value="{{stepName}}">
			</th>
			<th class="text-center" width="6%">
				<span class="label label-danger mouse btn_step_remove">X</span>
			</th>
		</tr>
		
		<tr class="tr_curri" data-currisubject_id="{{curriSubject_id}}" >
			<th class="form-inline" width="8%">
				순서
				<input type="text" name="stepInOrder" class="form-control w30 curriSubjectAuto" placeholder="" value="{{stepInOrder}}">
			</th>
			<td class="form-inline" width="6%">
				<button class="btn btn-default btn-h25 btn_subjectList_modal_open" type="button">선택</button>
			</td>
			<td class="form-inline" width="20%">
				<div class="div_subjectName">{{subjectName}}</div>
			</td>
			<td width="50%">
				<textarea readonly class="div_subjectDesc readOnly">{{subjectDesc}}</textarea>
			</td>
			<td class="form-inline" width="10%">
				<input type="text" name="subjectTime" class="form-control w30 curriSubjectAuto" placeholder="" value="{{subjectTime}}">&nbsp;시간
			</td>
			<td class="text-center" width="6%">
				<div class="div_up">
					<button class="btn btn-default btn-h25 btn_add_div_up  btn_add_curriSubject" type="button" >추가</button>
				</div>
				<div class="div_down">
					<div class="label label-danger mouse v_bottom btn_subject_remove">X</div>
				</div>
			</td>
		</tr>

	</tbody>
</table>

</script>


<!-- 과목테이블 그리기 (1개과목) -->
<script id="subject_html" type="text/x-handlebars-template">
		<tr class="tr_curri" data-currisubject_id="{{curriSubject_id}}" >
			<th class="form-inline" width="8%">
				순서
				<input type="text" name="stepInOrder" class="form-control w30 curriSubjectAuto" placeholder="" value="{{stepInOrder}}">
			</th>
			<td class="form-inline" width="6%">
				<button class="btn btn-default btn-h25 btn_subjectList_modal_open" type="button">선택</button>
			</td>
			<td class="form-inline" width="20%">
				<div class="div_subjectName">{{subjectName}}</div>
			</td>
			<td width="50%">
				<textarea readonly class="div_subjectDesc readOnly">{{subjectDesc}}</textarea>
			</td>
			<td class="form-inline" width="10%">
				<input type="text" name="subjectTime" class="form-control w30 curriSubjectAuto" placeholder="" value="{{subjectTime}}">&nbsp;시간
			</td>
			<td class="text-center" width="6%">
				<div class="div_up">
					<button class="btn btn-default btn-h25 btn_add_div_up btn_add_curriSubject" type="button" >추가</button>
				</div>
				<div class="div_down">
					<div class="label label-danger mouse v_bottom btn_subject_remove">X</div>
				</div>
			</td>
		</tr>
</script>



