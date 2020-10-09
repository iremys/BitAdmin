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

	<!-- 자신의 css사용시 -->
	
	
	<!-- 자바스트립트 임포트-->
	<c:import url="/WEB-INF/views/includes/script.jsp"></c:import>



</head>

<body class="hold-transition skin-blue sidebar-mini">


<div class="wrapper">
	<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
	<c:import url="/WEB-INF/views/includes/aside.jsp"></c:import>
	
	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
	
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<h1>커리큘럼관리</h1>
			<ol class="breadcrumb">
				<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
				<li><a href="#">과정설계업무</a></li>
				<li class="active">커리큘럼관리</li>
			</ol>
		</section>
		
		<!-- Main content -->
		<section class="content">
			<div class="row">
				<!-- 박스 -->
				<div class="col-xs-12" >
					<div class="box box-body">
						<div class="row">
						
							<!-- 카테고리영역 -->
							<div class="col-xs-4">
								
								<div class="sub-box">
									
									<div class="sub-toolbox">
										<div class="row">
											<div class="col-xs-12">
												<div class="sub-title">커리큘럼카테고리</div>
											</div>
										</div><!-- /.row -->
									</div>
									<!-- /.sub-toolbox -->

									<!-- 카테고리 메인영역 -->
									<div class="sub-body scroll bordered" id="cateBox">
										<div class="cate-box" style="height: 500px;">
											<div class="" id="">
												<ul id="ztree_cnc" class="ztree">
													<!-- 과목트리 -->
												</ul>
											</div>
										</div>
									</div><!-- /.scroll -->
									<!-- /.카테고리 메인영역 -->
									
								</div><!-- /.sub-box -->
								
							</div><!-- /.col-xs-4 -->
							<!-- /.카테고리영역 -->
							
							<!-- 커리큘럼정보상세영역 -->
							<div class="col-xs-8">
								<form id="frm_curri" >
								
									<!-- 카테고리 선택했을때-->
									<div class="sub-box cateDiv" >
										<div class="sub-toolbox">
											
											<div class="row">
												<div class="col-xs-6">
													<span class="sub-title"></span>
												</div>
												<div class="col-xs-6">
												</div>
											</div><!-- /.row -->
											
										</div>
										<!-- /.sub-toolbox -->
										
										<div class="sub-body bordered" style="height: 517px; ">
											<br><br>
											- 새로만들기, 수정, 삭제는 팝업메뉴(오른쪽 마우스클릭)을 이용하세요
											<br><br>
											- 드레그 앤 드롭을 이용하여 카테고리와 커리큘럼을 이동할 수 있습니다.
											<br><br>
											- 커리큘럼이 있는 카테고리는 삭제 할 수 없습니다.
											<br><br>
											- 작성중 커리큘럼(단계+과목이 있는)은 삭제 할 수 없습니다.
											<br><br>
											- 커리큘럼 상세 내용은 작성 즉시(포커스 아웃) 저장됩니다.
										</div><!-- /.sub-body -->
									</div><!-- /.sub-box -->
									<!-- ./카테고리 선택했을때-->
							
							
							
							
									
									<!-- 과목을 선택했을때 -->
									<div class="sub-box fileDiv" style="display: none; ">
										<div class="sub-toolbox">
											
											<div class="row">
												<div class="col-xs-6">
													<span class="sub-title">커리큘럼 보기/수정</span>
												</div>
												<div class="col-xs-6">
												</div>
											</div><!-- /.row -->
											
										</div>
										<!-- /.sub-toolbox -->
										
										<div class="sub-body">
											<!-- 공통부분 -->
											<table class="table table-condensed">
												<colgroup>
													<col width="120px" />
													<col width="420px" />
													<col width="100px" />
													<col width="" />
												</colgroup>
		
												<tbody>
													<tr>
														<th>커리큘럼카테고리</th>
														<td colspan="3">
															<span id="text_cateName"></span>
														</td>
													</tr>
													<tr>
														<th>커리큘럼명</th>
														<td>
															<span id="text_curriName"></span>
														</td>
														<th>총 시간</th>
														<td class="form-inline">&nbsp;&nbsp;
															<span id="text_totalTime" class="w40"> 0 </span> &nbsp;&nbsp;/&nbsp;&nbsp; 
															<input type="text" name="totalTime" class="form-control w60 curriAuto" placeholder=""><span>시간 </span>
														</td>
													</tr>
												</tbody>
											</table>
											
											<!-- ./공통부분 -->
											<br>
											<!--탭 박스 외곽 -->
											<div class="nav-tabs-custom">
									
												<!-- 상단탭영역 -->
												<ul class="nav nav-tabs" id="packageTab">
													<li class=""><a href="#tab_curriInfo" data-toggle="tab">커리큘럼 개요</a></li>
													<li class="active"><a href="#tab_2" data-toggle="tab">구성 과목</a></li>
												</ul>
												<!-- /.상단탭영역 -->
												
												<!-- 탭내용박스 -->
												<div class="tab-content" id="table_curriSubject">
													
													<!--탭01 커리큘럼기본정보  -->
													<c:import url="/WEB-INF/views/courseDesign/curriTab01.jsp"></c:import>
													
													<!--탭02 스탭별과목정보 -->
													<c:import url="/WEB-INF/views/courseDesign/curriTab02.jsp"></c:import>


												</div>
												<!-- ./탭내용박스 -->
												
											</div>
											<!--./탭 박스 외곽 -->
										
										</div>
										<!-- ./sub-body -->
										
									</div>
									<!-- ./sub-box -->
									
									<input type="hidden" name="curriCate_id" value="-1">
									<input type="hidden" name="curri_id" value="-1">
									
									<!-- ./과목을 선택했을때 -->
								</form>
							</div><!-- /.col-xs-8 -->
							<!-- /.커리큘럼정보상세영역 -->
							
							
						</div><!-- /.row -->
					</div><!-- /.box box-body -->
				</div><!-- /.col-xs-12 -->
				<!-- 박스 -->
				
			</div><!-- /.row -->
		</section>
		<!-- /.content -->
	</div>
	<!-- /.content-wrapper -->
	
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
		<div class="rMemu_line" ></div>
		<div class="rMemu_title" id="rMenu_curriTitle">커리큘럼</div>
		<ul>
			<li class="pop_menu" id="m_curri_remove">삭제</li>
			<li class="pop_menu" id="m_curri_modify">이름바꾸기</li>
			<li class="pop_menu" id="m_curri_add">커리큘럼추가</li>
		</ul>
	</div>
	<!-- ********************************************************************************** -->
	
	<!-- 과목선택 모달창 -->	
	<c:import url="/WEB-INF/views/courseDesign/curriModal.jsp"></c:import>
</div>
<!-- ./wrapper -->


	
</body>

<!-- 해당페이지용 자바스트립트-->
<c:import url="/WEB-INF/views/courseDesign/curri_script.jsp"></c:import>
	

</html>
