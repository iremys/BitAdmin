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
			<h1>과목관리</h1>
			<ol class="breadcrumb">
				<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
				<li><a href="#">과정설계업무</a></li>
				<li class="active">과목관리</li>
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
												<div class="sub-title">과목카테고리</div>
											</div>
										</div><!-- /.row -->
									</div>
									<!-- /.sub-toolbox -->

									<!-- 카테고리 메인영역 -->
									<div class="sub-body scroll bordered" id="cateBox">
										<div class="cate-box" style="height: 500px;">
											<div class="" id="">
												<ul id="ztree_cns" class="ztree">
													<!-- 과목트리 -->
												</ul>
											</div>
										</div>
									</div><!-- /.scroll -->
									<!-- /.카테고리 메인영역 -->
									
								</div><!-- /.sub-box -->
								
							</div><!-- /.col-xs-4 -->
							<!-- /.카테고리영역 -->
							
							<!-- 과목정보상세영역 -->
							<div class="col-xs-4">
								<form id="frm_subject" >
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
											- 드레그 앤 드롭을 이용하여 카테고리와 과목을 이동할 수 있습니다.
											<br><br>
											- 과목이 있는 카테고리는 삭제 할 수 없습니다.
											<br><br>
											- 커리큘럼 작성에 사용된 과목은 삭제 할 수 없습니다.
										</div><!-- /.sub-body -->
									</div><!-- /.sub-box -->
									<!-- ./카테고리 선택했을때-->
									
									
									
									
									
									<!-- 과목을 선택했을때 -->
									<div class="sub-box fileDiv" style="display: none; ">
										
										<div class="sub-toolbox">
											
											<div class="row">
												<div class="col-xs-6">
													<span class="sub-title">과목정보 보기/수정</span>
												</div>
												<div class="col-xs-6">
												</div>
											</div><!-- /.row -->
											
										</div>
										<!-- /.sub-toolbox -->
										
										<div class="sub-body">
											<table class="table table-condensed">
												<colgroup>
													<col width="90px" />
													<col width="" />
												</colgroup>
												<tbody>
													<tr>
														<th>과목 카테고리</th>
														<td >
															<span id="text_cateName"></span>
														</td>
													</tr>
													<tr>
														<th>과목 명</th>
														<td><span id="text_subjectName"></span></td>
													</tr>
													<tr>
														<th>과목 개요</th>
														<td>
															<textarea name="subjectDesc" class="form-control" placeholder="" style="height:422px;">
															</textarea>
														</td>
													</tr>
												</tbody>
											</table>
										</div><!-- /.sub-body -->
										
										
										<div class="sub-toolbox clearfix text-center">
											<div class="row" >
												<div class="col-xs-4">
												</div>
												<div class="col-xs-4">
													<input type="button" id="btn_subject_modify" value="수정" class="btn btn-primary">
												</div>
												<div class="col-xs-4">
												</div>
											</div>
										</div>
										<input type="hidden" name="subjectCate_id" value="-1">
										<input type="hidden" name="subject_id" value="-1">
										
									</div><!-- /.sub-box -->
									<!-- ./과목을 선택했을때 -->
									
								</form>
								
							</div><!-- /.col-xs-4 -->
							<!-- /.과목정보영역 -->
							
							
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
		<div class="rMemu_title" id="rMenu_subjectTitle">과목</div>
		<ul>
			<li class="pop_menu" id="m_subject_remove">삭제</li>
			<li class="pop_menu" id="m_subject_modify">이름바꾸기</li>
			<li class="pop_menu" id="m_subject_add">과목추가</li>
		</ul>
	</div>
	<!-- ********************************************************************************** -->
	

</div>
<!-- ./wrapper -->



<!-- 공통 자바스트립트 임포트-->
<c:import url="/WEB-INF/views/includes/script.jsp"></c:import>
	
<!-- 해당페이지용 자바스트립트-->
<c:import url="/WEB-INF/views/courseDesign/subject_js.jsp"></c:import>
		
</body>



</html>
