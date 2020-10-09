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
			<h1>과정상세페이지관리</h1>
			<ol class="breadcrumb">
				<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
				<li><a href="#">홈페이지관리</a></li>
				<li class="active">과정상세페이지관리</li>
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
												<div class="sub-title">과정카테고리</div>
											</div>
										</div><!-- /.row -->
									</div>
									<!-- /.sub-toolbox -->

									<!-- 카테고리 메인영역 -->
									<div class="sub-body scroll bordered" id="cateBox">
										<div class="cate-box" style="height: 500px;">
											<div class="" id="">
												<ul id="ztree_hc" class="ztree">
													<!-- 과목트리 -->
												</ul>
											</div>
										</div>
									</div><!-- /.scroll -->
									<!-- /.카테고리 메인영역 -->
									
								</div><!-- /.sub-box -->
								
							</div><!-- /.col-xs-4 -->
							<!-- /.카테고리영역 -->
						
						
						
							<!-- 카테고리영역 -->
							<div class="col-xs-8">
								
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
								
								
								<!-- 마지막 카테고리 선택했을때-->
								<div class="sub-box fileDiv" style="display: none; ">
									
									<div class="sub-toolbox">
										<div class="row">
											<div class="col-xs-6">
												<span class="sub-title">컨텐츠리스트</span>
											</div>
											<div class="col-xs-6">
												<button type="button" id="btn_contentTitle_modal_open" class="btn btn-default btn-h25 pull-right" data-toggle="modal" data-target="#modal_contnetTitle">컨텐츠 추가</button>
														
												
												<%-- <a class="btn btn-default btn-h25 pull-right" href="${pageContext.request.contextPath }/hPage/writeForm" id="btn_hWriteForm_open" >컨텐츠 추가</a> --%>
											</div>
										</div><!-- /.row -->
									</div>
									<!-- /.sub-toolbox -->

									<!-- 컨텐츠 메인영역 -->
									<div class="sub-body" id="tbl_content">
										<div id="hContentListArea">
											
										</div>
										
									</div><!-- /.sub-body-->
									<!-- /.컨텐츠 메인영역 -->
									
									
								</div><!-- /.sub-box -->
								<!-- ./마지막 카테고리 선택했을때 -->
							
							</div><!-- /.col-xs-8 -->
							<!-- /.카테고리영역 -->
						</div><!-- /.row -->
					</div><!-- /.box box-body -->
				</div><!-- /.col-xs-12 -->
				<!-- 박스 -->
				
				
				
				
			</div><!-- /.row -->
		</section>
		<!-- /.content -->
		
	
	</div>
	
<!-- ------------------------------------------------------------------------ -->	
<!-- 컨텐츠 제목입력 모달창 -->
<div class="modal fade" id="modal_contnetTitle">
	<div class="modal-dialog ">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title">컨텐츠 제목입력</h4>
			</div>
			<form action="${pageContext.request.contextPath }/hPage/writeTitle" method="POST" >
				<div class="modal-body">
					<div class="container-fluid">
						 <div class="row">
						 	<div class="col-xs-12">
						 		<div class="sub-box">
										
									<div class="sub-toolbox">
										<div class="row">
											<div class="col-xs-12">
												<div class="sub-title">컨텐츠제목을 입력해주세요</div>
											</div>
										</div><!-- /.row -->
									</div>
									<!-- /.sub-toolbox -->
	
									<!-- 입력 메인영역 -->
									<div class="sub-body" id="">
										<input class="form-control" type="text" name="title" value="">
									</div><!-- /.scroll -->
									<!-- /.입력 메인영역 -->
									
								</div><!-- /.sub-box -->
						 	</div>
						 </div>
					</div>
				</div>
				<input type="text" name="hCate_id" value="-1">
				<div class="modal-footer">
					<div class="row">
						<div class="col-xs-4"></div>
						<div class="col-xs-4 text-center">
							<button type="submit" class="btn btn-primary" id="btn_contentTile_save">저장</button>
						</div>
						<div class="col-xs-4">
							<button type="button" class="btn btn-default pull-right" data-dismiss="modal">취소</button>
						</div>
					</div>
	      		</div>
      		</form>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- ------------------------------------------------------------------------ -->	
	
	
	
	
	<!-- /.content-wrapper -->
	<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
	<div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->
	

<!-- 공통 자바스트립트 임포트-->
<c:import url="/WEB-INF/views/includes/script.jsp"></c:import>
	
<!-- 해당페이지용 자바스트립트-->
<c:import url="/WEB-INF/views/hPageMng/hList_js.jsp"></c:import>



</body>


</html>

