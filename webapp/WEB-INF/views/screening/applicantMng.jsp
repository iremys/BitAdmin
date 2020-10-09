<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<title>TCOMS ver2</title>
<!-- Tell the browser to be responsive to screen width -->
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">

<!-- 공통css -->
<c:import url="/WEB-INF/views/includes/link.jsp"></c:import>

<!-- 자신의 css사용시 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/zTreeStyle.css" type="text/css">
<link rel="stylesheet" href="/assets/css/jquery.datepicker.css">

<!-- 그리드 사용시 주석풀어 사용 -->


</head>

<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">

		<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
		<c:import url="/WEB-INF/views/includes/aside.jsp"></c:import>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					지원자관리 <small>it all starts here</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li><a href="#">전형업무관리</a></li>
					<li class="active">지원자관리</li>
				</ol>
			</section>
			<!-- /.Content Header (Page header) -->

			<!-- Main content -->
			<section class="content">
				<!-- style="padding-top:10px;padding-bottom:10px;" -->

				<!-- 상단 -->
				<div class="row">
					<div class="col-xs-12">

						<div class="box box-body">
							<div class="row">
								<div class="col-xs-12">
									<div class="row">
										<div class="col-xs-5">
											<div class="sub-box">
												<%-- <form class="search-form" method="post" action="${pageContext.request.contextPath}/api/cm/search"> --%>
												<!-- sub_title -->
												<div class="sub-title">지원자검색</div>
												<!-- sub_title -->

												<div class="sub-body">
													<table class="table table-condensed">
														<colgroup>
															<col width="13%" />
															<col width="30%" />
															<col width="13%"" />
															<col width="" />
														</colgroup>

														<tr>
															<th>업무구분</th>
															<td>
																<select name="cateNameSelect" class="form-control" id="cateNameSelect">
																	<option value="0">= 전체 =</option>
																	<c:forEach items="${curriCateList}" var="curriCateList">
																		<option value="${curriCateList.curriculumCate_no}">${curriCateList.cateName}||${curriCateList.curriculumCate_no}</option>
																	</c:forEach>
																</select>
															</td>
															<th>과정상태</th>
															<td>
																<label class="radiobox">
																	<input class="" type="radio" name="curriState" value="2" checked>모집중과정만
																</label>
																<label class="radiobox">
																	<input class="" type="radio" name="curriState" value="2">모든과정
																</label>
															</td>
														</tr>
														<tr>
															<th>과정명</th>
															<td colspan="3">
																<select name="cateNameSelect" class="form-control" id="cateNameSelect">
																	<option value="0">= 전체 =</option>
																	<c:forEach items="${curriCateList}" var="curriCateList">
																		<option value="${curriCateList.curriculumCate_no}">${curriCateList.cateName}||${curriCateList.curriculumCate_no}</option>
																	</c:forEach>
																</select>
															</td>
														</tr>
														<tr>
															<th>지원종류</th>
															<td>
																<select name="cateNameSelect" class="form-control" id="cateNameSelect">
																	<option value="0">= 전체 =</option>
																	<c:forEach items="${curriCateList}" var="curriCateList">
																		<option value="${curriCateList.curriculumCate_no}">${curriCateList.cateName}||${curriCateList.curriculumCate_no}</option>
																	</c:forEach>
																</select>
															</td>
															<th>지원일</th>
															<td>
																<div class="form-inline">
																	<div class="input-group border-inputcolor w100 pull-left">
																		<input class="input-datepicker form-control border-none" name="date1" id="date33" data-select="datepicker" data-toggle="datepicker" placeholder="YYYY-MM-DD">
																		<span class="input-group-btn"><button type="button" class="btn btn-date border-none" data-toggle="datepicker"><i class="fa fa-calendar"></i></button></span>
																	</div>
																	<div class="pull-left"> &nbsp;&nbsp; - &nbsp;&nbsp;</div>
																	<div class="input-group border-inputcolor w100 pull-left">
																		<input class="input-datepicker form-control border-none" name="date1" id="date22" data-select="datepicker" data-toggle="datepicker" placeholder="YYYY-MM-DD">
																		<span class="input-group-btn"><button type="button" class="btn btn-date border-none" data-toggle="datepicker"><i class="fa fa-calendar"></i></button></span>
																	</div>
																</div>
															</td>
														</tr>
													</table>
												</div>
												<!-- /.sub-body -->
												<div class="sub-toolbox text-center">
													<button type="button" class="btn btn-primary" id="applySearch">조회</button>
												</div>
												<!-- </form> -->
											</div>
											<!-- sub-box -->
											
											<div class="sub-box">
												<%-- <form class="search-form" method="post" action="${pageContext.request.contextPath}/api/cm/search"> --%>
												<!-- sub_title -->
												<div class="sub-title">회원정보검색</div>
												<!-- sub_title -->

												<div class="sub-body">
													<table class="table table-condensed">
														<colgroup>
															<col width="13%" />
															<col width="" />
															<col width="" />
														</colgroup>

														<tr>
															<th>회원정보</th>
															<td class="form-inline">
																<label class="radiobox">
																	<input class="" type="radio" name="curriState" value="2" checked>이름
																</label>
																<label class="radiobox">
																	<input class="" type="radio" name="curriState" value="2">주민번호
																</label>
																<label class="radiobox">
																	<input class="" type="radio" name="curriState" value="2">아이디
																</label>
																<input class="form-control w140" type="text" name="depositAmount" id="amountCalcul_1">
																<button class="btn btn-primary btn-h25 pull-right" id="btn_studentModal" type="button">조회</button>
															</td>
														</tr>
													</table>
												</div>
												<!-- /.sub-body -->
												
												<!-- </form> -->
											</div>
											<!-- sub-box -->

										</div>
										<!-- /.col-xs-4 -->
										
										
										<div class="col-xs-7">
											<div class="sub-box">
												<!-- sub_title -->
												<div class="sub-title">기본정보</div>
												<!-- /.sub_title -->
												<!-- sub_body -->
												<div class="sub-body" id="companyTableDiv">

													<table class="table table-condensed">
														<colgroup>
															<col width="55px" />
															<col width="" />
															<col width="55px" />
															<col width="" />
															<col width="55px" />
															<col width="" />
															<col width="55px" />
															<col width="" />
														</colgroup>

														<tbody>
															<tr>
																<th>회원ID</th>
																<td>
																	
																</td>
																<th>과정명</th>
																<td colspan="5">
																	
																</td>
															</tr>
															<tr>
																<th>성명</th>
																<td>
																	
																</td>
																<th>핸드폰</th>
																<td>
																	
																</td>
																<th>E-mail</th>
																<td colspan="3">
																	
																</td>
															</tr>
															<tr>
																<th>현주소</th>
																<td colspan="7">
																	
																</td>
															</tr>
															<tr>
																<th>주민번호</th>
																<td>
																	
																</td>
																<th>전화</th>
																<td>
																	
																</td>
																<th>성별</th>
																<td>
																	
																</td>
																<th>나이</th>
																<td>
																	
																</td>
															</tr>
															<tr>
																<th>지원종류</th>
																<td>
																	
																</td>
																<th>전형일시</th>
																<td>
																	
																</td>
																<th>지원일자</th>
																<td>
																	
																</td>
																<th>지원방법</th>
																<td>
																	
																</td>
															</tr>
															<tr>
																<th>메모</th>
																<td colspan="7">
																	
																</td>
															</tr>
														</tbody>
													</table>

												</div>
												<!-- /.sub_body -->
											</div>
											<!-- /.sub-box -->
										</div>
										<!-- /.col-xs-8 -->
									</div>
									<!-- /.row -->

								</div>
								<!-- /.col-xs-12 -->

							</div>
							<!-- /.row -->
						</div>
						<!-- /.box -->

					</div>
					<!-- /.col-xs-12 -->
				</div>
				<!-- /.row 상단-->

				<!-- 하단 -->
				<div class="row">
					<div class="col-xs-12">
						<div class="box box-body">

							<div class="row">
								<div class="col-xs-12">
									<div class="sub-box">
										<!-- sub_title -->
										<div class="sub-title">지원자리스트</div>

										<!-- sub_body -->
										<div class="sub-body" style="height: 350px;">
											<!-- 지원자 그리드 -->
											<table id="jqGrid" class="mouse">
											</table>

											<!-- 페이징 -->
											<div id="jqGridPager"></div>
										</div>
										<!-- /.sub-body -->

									</div>
									<!-- /.sub-box -->
								</div>
								<!-- /.col-xs-12 -->
							</div>
							<!-- /.row -->

						</div>
						<!-- /.box -->
					</div>
					<!-- /.col-xs-12 -->
				</div>
				<!-- /.row 하단-->

			</section>
			<!-- /.Main content -->



		</div>
		<!-- /.content-wrapper -->

		<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
		<c:import url="/WEB-INF/views/includes/jqgridscript.jsp"></c:import>
		<div class="control-sidebar-bg"></div>



	</div>
	<!-- ./wrapper -->


	<script type="text/javascript">
		/************************************************/
		/* 메인영역 
		 /************************************************/

		/* 화면 처음 로딩될때 */
		$(document).ready(function() {
			gridExec();
		});

		/** 카테고리(업무구분)셀렉트박스 선택시 커리큘럼가져오기  */
		$("#cateNameSelect").on("change", function() {
			console.log("업무구분 선택/변경");
			getCurriList();
		});

		/** 상단 교육과정명의 radio 선택할때  */
		$("input[name=curriState]").on("change", function() {
			console.log("교육과정 상태 라디오버튼 선택");
			getCurriList();
		});

		/** 검색버튼 클릭할때 지원자리스트 가져옴 */
		$("#applySearch").on("click", function() {
			//업무구분값 선택 체크
			//교육과정명 선택 체크
			gridExec();
		});

		/* 지원자 리스트 출력, 한번클릭(지원자상세정보출력), 두번클릭(프로필호출) */
		function gridExec() {
			var curriculumCate_no = $("#cateNameSelect option:selected").val();
			var curriculum_no = $("#curriSelect option:selected").val();
			var curriState = $("input[name=curriState]:checked").val();

			var postData = {
				"curriculumCate_no" : curriculumCate_no,
				"curriculum_no" : curriculum_no,
				"curriState" : curriState
			}

			console.log("클릭됨" + curriculum_no);
			console.log(postData);
			var cnames = [ 'usr_no', '과정', '이름', '생년월일', '성별', '전형결과', '핸드폰',
					'지원일자', '전형일자', '학교', '전공', '입금여부' ];

			$("#jqGrid")
					.jqGrid(
							{

								url : "${pageContext.request.contextPath}/applicant/getApplicantList",
								mtype : "post",
								postData : postData,
								datatype : "json",

								colNames : cnames,
								colModel : [ {
									name : 'user_no',
									index : 'user_no',
									width : 40, /* hidden : true */
								}, {
									name : 'gisuName',
									index : 'gisuName',
									width : 100,
									align : "center"
								}, {
									name : 'nameHan',
									index : 'nameHan',
									width : 100,
									align : "center"
								}, {
									name : 'studResNum',
									index : 'studResNum',
									width : 100,
									align : "center"
								}, {
									name : 'c_gender',
									index : 'c_gender',
									width : 50,
									align : "center"
								}, {
									name : 'testResult',
									index : 'testResult',
									width : 80,
									align : "center"
								}, {
									name : 'cellphone',
									index : 'cellphone',
									width : 150,
									align : "center"
								}, {
									name : 'applyDate',
									index : 'applyDate',
									width : 100,
									align : "center"
								}, {
									name : 'testDate',
									index : 'testDate',
									width : 100,
									align : "center"
								}, {
									name : 'school',
									index : 'school',
									width : 150,
									align : "center"
								}, {
									name : 'major',
									index : 'major',
									width : 150,
									align : "center"
								}, {
									name : 'deposit',
									index : 'deposit',
									width : 80,
									align : "center"
								} ],
								rowheight : 20,
								height : 300,
								width : 1265,
								rowNum : 100,
								rowList : [ 10, 30, 50, 100, 200, 500 ],
								pager : '#jqGridPager',
								rownumbers : true,
								loadtext : '로딩중',
								sortname : 'applyDate',
								sortorder : "desc",
								gridview : true,
								shrinkToFit : false,
								emptyrecords : '데이터가 없습니다.', //데이터 없을 때

								/* 그리드 한번클릭했을때 --> 지원자정보 상세*/
								onSelectRow : function(rowId, iRow, iCol, e) {

									var rowId = $("#jqGrid").getGridParam(
											"selrow");
									var userNo = $("#jqGrid").getRowData(rowId).user_no; //선택한 줄의 User_no을 가져오는 코드
									console.log(userNo)
									/*  alert("나중에 " + userNo + "") */

									$
											.ajax({
												url : "/api/apply/getAppliedList",
												type : "get",
												data : {
													"user_no" : userNo
												},
												dataType : "json",
												success : function(list) {
													console.log(list);

													$("#appliedTable").empty();
													past_apply_Reset();

													for (var i = 0; i < list.length; i++) {
														renderApplied(list[i])
													}

												},
												error : function(request,
														status, error) {
													alert("code:"
															+ request.status
															+ "\n"
															+ "message:"
															+ request.responseText
															+ "\n" + "error:"
															+ error);
												}

											});

									function renderApplied(list) {
										var str = "";
										str += "<tr id='" + list.curriculum_no+ "' name='" + list.user_no + "' class='past'>";
										str += "<td value='" + list.curriculum_no + "'>"
												+ list.testDate + "</td>";
										str += "<td value='" + list.curriculum_no + "'>"
												+ list.curriName + "</td>";
										str += "</tr>";
										$("#appliedTable").append(str);

									}

								}

							/* viewrecords : true */
							/* caption: "유저 정보" */

							});

			/* 그리드 파라미터값 재설정 */
			$("#jqGrid").setGridParam({
				datatype : "json",
				postData : postData,
				loadComplete : function(data) {
					console.log(data);
				}
			}).trigger("reloadGrid");

		}

		/* 업무구분 코드로 교육과정(커리큘럼)리스트 가져오기 */
		function getCurriList() {
			var curriculumCate_no = $("#cateNameSelect option:selected").val();
			var curriState = $("input[name=curriState]:checked").val();

			$
					.ajax({
						url : "${pageContext.request.contextPath}/applicant/getCurriList",
						type : "post",
						data : {
							"curriculumCate_no" : curriculumCate_no,
							"curriState" : curriState
						},
						dataType : "json",
						success : function(curriList) {
							console.log(curriList);
							curriListRender(curriList);
						},
						error : function(XHR, status, error) {
							console.error(status + " : " + error)
						}
					});

		}

		/** 커리큘럼리스트 랜더 */
		function curriListRender(curriList) {
			var str = "";

			str += "<select name='strcurriName' class='form-control' id='curriSelect'>";
			str += "<option value='5'>=   전체   =</option>"

			for (var i = 0; i < curriList.length; i++) {
				str += "<option value='" + curriList[i].curriculum_no + "'>"
						+ curriList[i].curriName + " || " + curriList[i].state
						+ " || " + curriList[i].curriculum_no + "</option>";
			}

			str += "</select>";

			$("#curriSelect").remove();
			$("#curriTd").append(str);
		}

		/* 과거지원내역에서 수업클릭할때 */
		$("#appliedTable").on("click", "[class=past]", function() {
			console.log("들어왔음");
			var curriculum_no = $(this).attr("id");
			var user_no = $(this).attr("name");
			past_apply(curriculum_no, user_no);

		});

		//지원내역 클릭시 특정 지원내역의 상세정보 가져오기
		function past_apply(curriculum_no, user_no) {

			console.log(curriculum_no);

			$.ajax({
				url : "/api/apply/apply_details",
				type : "get",
				data : {
					"curriculum_no" : curriculum_no,
					"user_no" : user_no
				},
				dataType : "json",
				success : function(applyVo) {
					console.log(applyVo);
					$("input[name='hidden_no']").val(applyVo.user_no)
					$("input[name='hidden_currino']")
							.val(applyVo.curriculum_no)
					$("input[name='cateName']").val(applyVo.cateName)
					$("input[name='curriName']").val(applyVo.curriName)
					$("[name='applyType']").val(applyVo.applyType)
					$("[name='testLang']").val(applyVo.testLang)
					$("input[name='testScore']").val(applyVo.testScore)
					$("[name='testResult']").val(applyVo.testResult)
					$("input[name='date1']").val(applyVo.depositDate)
					$("input[name='date2']").val(applyVo.cardPayDate)
					$("input[name='depositAmount']").val(applyVo.depositAmount)
					$("input[name='cardPayAmount']").val(applyVo.cardPayAmount)
					$("[name='deposit']").val(applyVo.deposit)

					$("input[name='totalPay']").val(applyVo.totalPay)
					$("[name='consult']").val(applyVo.consultContent)

				},
				error : function(request, status, error) {
					alert("code:" + request.status + "\n" + "message:"
							+ request.responseText + "\n" + "error:" + error);
				}
			});

		}

		//지원내역 상세에서 계좌입금액,카드결제액 자동계산
		$("#amountCalcul_1, #amountCalcul_2").change(function() {
			calc();
			var cost = $(this).val();
			cost = cost.replace(/[^0-9]/g, "");
			$(this).val(cost);
		});
		/* 지원내역 상세에서 계좌입금액,카드결제액 자동계산 END*/
		function calc() {
			$("#amountResult").val(
					Number($("#amountCalcul_1").val())
							+ Number($("#amountCalcul_2").val()));

		}

		//수정버튼 누를때
		$("#update").on("click", function() {

			report = {
				user_no : $("input[name='hidden_no']").val(),
				curriculum_no : $("input[name='hidden_currino']").val(),
				applyType : $("#applyType").val(),
				testLang : $("#testLang").val(),
				testScore : $("#testScore").val(),
				testResult : $("#testResult").val(),
				depositDate : $("#date1").val(),
				depositAmount : $("#amountCalcul_1").val(),
				cardPayDate : $("#date2").val(),
				cardPayAmount : $("#amountCalcul_2").val(),
				deposit : $("#deposit").val(),
				totalPay : $("#amountResult").val(),
				consultContent : $("#consult").val()

			};
			console.log(report);
			$.ajax({
				url : "/api/apply/applyUpdate",
				type : "post",
				contentType : "application/json",
				data : JSON.stringify(report),
				dataType : "json",
				success : function(result) {

					if (result == 1) {
						alert("수정이 완료되었습니다.");
					}
				},
				error : function(XHR, status, error) {
					console.error(status + " : " + error);
				}
			});

		})

		function past_apply_Reset() {

			$("input[name='cateName']").val("")
			$("input[name='curriName']").val("")
			$("input[name='applyType']").val("")
			$("input[name='testLang']").val("")
			var str = "";
			str += "<option><option>";
			$("[name=testLang]").append(str);

			$("input[name='testScore']").val("")
			$("input[name='testResult']").val("")
			$("input[name='date1']").val("")
			$("input[name='date2']").val("")
			$("input[name='depositAmount']").val("")
			$("input[name='cardPayAmount']").val("")
			$("input[name='deposit']").val("")
			$("input[name='totalPay']").val("")
			$("[name='consult']").val("")

		};
	</script>
</body>
</html>


<%-- <c:import url="/WEB-INF/views/screening/applyScript.jsp" /> --%>
