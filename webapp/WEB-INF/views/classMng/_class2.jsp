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
<c:import url="/WEB-INF/views/includes/css.jsp"></c:import>

	
</head>

<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

	<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
	<c:import url="/WEB-INF/views/includes/aside.jsp"></c:import>


	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">

		<!-- Content Header (Page header) -->
		<section class="content-header">
			<h1>클래스(반)개설관리</h1>
			<ol class="breadcrumb">
				<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
				<li><a href="#">전형관리업무</a></li>
				<li><a href="#">클래스(반)개설관리</a></li>
			</ol>
		</section>

		<!-- Main content -->
		<section class="content">
			<div class="row">
				<div class="col-xs-12">
					<div class="box box-body">
						<div class="row">

							<!-- 카테고리영역 -->
							<div class="col-xs-4">

								<div class="sub-box">

									<div class="sub-toolbox">
										<div class="row">
											<div class="col-xs-12">
												<div class="sub-title">과목카테고리</div>
											</div>
										</div>
										<!-- /.row -->
									</div>
									<!-- /.sub-toolbox -->

									<!-- 카테고리 메인영역 -->
									<div class="sub-body scroll bordered" id="cateBox">
										<div class="cate-box" style="height: 500px;">
											<div class="" id="">
												<ul id="ztree_cnc" class="ztree">
													<!-- 클래스(반)트리 -->
												</ul>
											</div>
										</div>
									</div>
									<!-- /.scroll -->
									<!-- /.카테고리 메인영역 -->

								</div>
								<!-- /.sub-box -->

							</div>
							<!-- /.col-xs-4 -->
							<!-- /.카테고리영역 -->




							<!-- 클래스(반) 정보 영역 시작-->
							<div class="col-xs-8">
							<form id="frm_class">	
								
								<!-- 카테고리 선택했을때-->
								<div class="sub-box cateDiv">
									<div class="sub-toolbox">

										<div class="row">
											<div class="col-xs-6">
												<span class="sub-title"></span>
											</div>
											<div class="col-xs-6"></div>
										</div>
										<!-- /.row -->

									</div>
									<!-- /.sub-toolbox -->

									<div class="sub-body bordered" style="height: 517px;">
										<br> <br> - 새로만들기, 수정, 삭제는 팝업메뉴(오른쪽 마우스클릭)을 이용하세요 <br> <br> - 드레그 앤 드롭을 이용하여 카테고리와 과목을 이동할 수 있습니다. <br> <br> - 과목이 있는 카테고리는 삭제 할 수 없습니다. <br> <br> - 커리큘럼 작성에 사용된 과목은 삭제
										할 수 없습니다.
									</div>
									<!-- /.sub-body -->
								</div>
								<!-- /.sub-box -->
								<!-- ./카테고리 선택했을때-->
								
								<!-- 클래스(반)을 선택했을때 -->
								<div class="sub-box fileDiv" style="display: none;">
									<div class="sub-toolbox">
										<div class="row">
											<div class="col-xs-6">
												<span class="sub-title">클래스(반) 기본정보</span>
											</div>
										</div>
										<!-- /.row -->
									</div>
									<!-- /.sub-toolbox -->		
									
									<div class="sub-body">
										<!-- 공통부분 -->
										<table class="table table-condensed ">
											<colgroup>
												<col width="14%" />
												<col width="20%" />
												<col width="13%" />
												<col width="20%" />
												<col width="13%" />
												<col width="20%" />
											</colgroup>

											<tbody>
												<tr>
													<th>업무구분</th>
													<td>
														<span id="text_classCateName"></span>
													</td>
													<th>커리큘럼</th>
													<td colspan="3" class="form-inline">
														<span class="text_middle" id="text_curriName"></span>
														<button type="button" id="btn_curri_modal_open" class="btn btn-default btn-h25 pull-right" data-toggle="modal" data-target="#packageViewModal">커리큘럼선택</button>
														<span class="label label-danger mouse" id="btn_curri_remove">X</span>
													</td>
												</tr>
												<tr>
													<th>교육과정명</th>
													<td colspan="3">
														<span class="text_middle" id="text_className">ㅁㅁㅁㅁㅁ</span>
														
														
														
													</td>
													<th>운영코드</th>
													<td>
														<input type="text" class="form-control classAuto" name="classCode">
													</td>
												</tr>
												
												
												<tr>
													<th>시작일</th>
													<td>
														<div class="input-group border-inputcolor w180">
  																<input type="text" class="input-sm form-control border-none classAuto" name="startDate" id="startDate" data-select="datepicker" data-toggle="datepicker" placeholder="YYYY-MM-DD">
  																<span class="input-group-btn"><button type="button" class="btn btn-date border-none" data-toggle="datepicker"><i class="fa fa-calendar"></i></button></span>
														</div>
													</td>
													<th>종료일</th>
													<td >		
														<div class="input-group border-inputcolor w180">
  																<input type="text" class="input-sm form-control border-none classAuto" name="endDate" id="endDate" data-select="datepicker" data-toggle="datepicker" placeholder="YYYY-MM-DD">
  																<span class="input-group-btn"><button type="button" class="btn btn-date border-none" data-toggle="datepicker"><i class="fa fa-calendar"></i></button></span>
														</div>
													</td>												
													
													<th>정원</th>
													<td class="form-inline">
														<input type="text" class="form-control w60 classAuto" name="maxCnt"> 명
													</td>
												</tr>
												
												
												<tr id="tr_testDate">
													<th class="form-inline">전형일시
														<!-- <button class="btn btn-default btn-h25" id="btn_add_testDate" type="button">&nbsp;+&nbsp;</button> -->
													</th>
													
													<td colspan="5" id="testTimeTd">
														<%-- <c:forEach begin="0" end="2" step="1"> --%>
															<div class="pull-left form-inline w240">
																<span class="input-group border-inputcolor w120"> 
																	<input type="text" name="testDate" class="form-control border-none testDateAuto"  data-select="datepicker" data-toggle="datepicker"  placeholder="YYYY-MM-DD">
																	<span class="input-group-btn">
																		<button type="button" class="btn btn-date border-none" data-toggle="datepicker">
																			<i class="fa fa-calendar"></i>
																		</button>
																	</span>
																</span> 
																<span> 
																	<select class="form-control w80 testDateAuto" name="testTime" >
																		<option value="" selected>--:--</option>
																		<option value="08:00">08:00</option>
																		<option value="09:00">09:00</option>
																		<option value="10:00">10:00</option>
																		<option value="11:00">11:00</option>
																		<option value="12:00">12:00</option>
																		<option value="13:00">13:00</option>
																		<option value="14:00">14:00</option>
																		<option value="15:00">15:00</option>
																		<option value="16:00">16:00</option>
																		<option value="17:00">17:00</option>
																		<option value="18:00">18:00</option>
																		<option value="19:00">19:00</option>
																		<option value="20:00">20:00</option>
																		<option value="21:00">21:00</option>
																		<option value="22:00">22:00</option>
																		<option value="23:00">23:00</option>
																	</select>
																</span>
																<input type="text" name="testDate_id" value="-1">
																<!-- <span class="label label-danger mouse btn_testDate_remove">X</span> -->
															</div>
														<%-- </c:forEach> --%>
													</td>
												</tr>

												<tr>
													<th>강의시간</th>
													<td>
														<input type="text" class="form-control classAuto" name="lectureTime">
													</td>
													<th>교육비용</th>
													<td>
														<input type="text" class="form-control classAuto" name="price">
													</td>
													<th>교육비지원</th>
													<td>
														<select class="form-control classAuto" name="support">
															<option value="" selected>선택하세요</option>
															<option value="1">근로자향</option>
															<option value="2">내일배움카드제</option>
															<option value="3">노동부(납입)</option>
															<option value="4">노동부(미납입)</option>
															<option value="5">노동부지원</option>
															<option value="6">사업주훈</option>
															<option value="7">위탁(유급휴식)</option>
															<option value="8">일반지원</option>
															<option value="9">재직자환급지원</option>
															<option value="10">정통부지원</option>
														</select>
													</td>
												</tr>
												<tr>
													<th>문의(담당자)</th>
													<td>
														<input type="text" class="form-control classAuto" name="managerInfo">
													</td>
													<th>상세URL</th>
													<td colspan="3" class="form-inline">
														<input type="text" class="form-control w400 classAuto" name="pageURL"> 
														<span><a href=""  target="_blank" id="pageURL">바로가기</a></span>
													</td>
												</tr>
												<tr>
													<th>상태</th>
													<td colspan="3">
														<div class="radio-group">
															<label class="radiobox">
																<input class="state classAuto" type="radio" name="operState" value="1" checked>준비중
															</label>
															<label class="radiobox">
																<input class="state classAuto" type="radio" name="operState" value="2">모집중
															</label>
															<label class="radiobox">
																<input class="state classAuto" type="radio" name="operState" value="3">모집마감
															</label>
															<label class="radiobox">
																<input class="state classAuto" type="radio" name="operState" value="4">수업중
															</label>
															<label class="radiobox">
																<input class="state classAuto" type="radio" name="operState" value="5">종료
															</label>
														</div>
													</td>
													<th>기수</th>
													<td>
														<input type="text" class="form-control classAuto" name="gisuName">
													</td>
												</tr>

											</tbody>
										</table>
										<!-- ./공통부분 -->
									</div>
									<!-- /.sub-body -->
									<br>
									<div class="sub-body">
										<!--탭 박스 외곽 -->
										<div class="nav-tabs-custom">
								
											<!-- 상단탭영역 -->
											<ul class="nav nav-tabs" id="packageTab">
												<li class=""><a href="#tab_curriInfo" data-toggle="tab">지원자관리</a></li>
												<li class="active"><a href="#tab_2" data-toggle="tab">강사/강의실 배치(이후추가)</a></li>
											</ul>
											<!-- /.상단탭영역 -->
									
											<!-- 탭내용박스 -->
											<div class="tab-content" id="table_curriSubject">
												
												<!--탭01 커리큘럼기본정보  -->
												<%-- <c:import url="/WEB-INF/views/courseDesign/curriTab01.jsp"></c:import> --%>
												
												<!--탭02 스탭별과목정보 -->
												<%-- <c:import url="/WEB-INF/views/courseDesign/curriTab02.jsp"></c:import> --%>
			
				
											</div>
											<!-- ./탭내용박스 -->
										</div>
										<!--./탭 박스 외곽 -->
										
										
									</div>
									<!-- /.sub-body -->
									
															
								</div>
								<!-- ./클래스(반)을 선택했을때 -->
								
								<input type="text" name="classCate_id" value="-1">
								<input type="text" name="class_id" value="-1">
									
							</form>
							</div>
							<!-- col-xs-8 -->
							<!-- /.교육과정 정보 영역 끝 -->
						</div>
						<!-- /.row -->
					</div>
					<!-- /.box -->
				</div>
			</div>
			<!-- /.row -->
		</section>
		<!-- /.content -->

	</div>
	<!-- content-wrapper -->

	<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
	<div class="control-sidebar-bg"></div>

	<!-- ********************************************************************************** -->
	<!-- 오른쪽 메뉴 -->
	<div id="rMenu">
		<div class="rMemu_title" id="rMenu_cateTitle">카테고리</div>
		<ul>
			<li class="pop_menu" id="m_cate_remove">삭제</li>
			<li class="pop_menu" id="m_cate_modify">이름바꾸기</li>
			<li class="pop_menu" id="m_cate_add">카테고리추가</li>
		</ul>
		<div class="rMemu_line"></div>
		<div class="rMemu_title" id="rMenu_classTitle">클래스(반)</div>
		<ul>
			<li class="pop_menu" id="m_class_remove">삭제</li>
			<li class="pop_menu" id="m_class_modify">이름바꾸기</li>
			<li class="pop_menu" id="m_class_add">클래스(반)추가</li>
		</ul>
	</div>
	<!-- ********************************************************************************** -->


	<!-- 해당페이지용 jsp 임포트-->
	<c:import url="/WEB-INF/views/classMng/classModal.jsp"></c:import>
	
</div>

<!-- ./wrapper -->
	
	
	
<!-- 공통 자바스트립트 임포트-->
<c:import url="/WEB-INF/views/includes/script.jsp"></c:import>

<!-- 해당페이지용 자바스트립트-->
<c:import url="/WEB-INF/views/classMng/class_js.jsp"></c:import>
<c:import url="/WEB-INF/views/classMng/classModal_js.jsp"></c:import>

</body>



</html>
