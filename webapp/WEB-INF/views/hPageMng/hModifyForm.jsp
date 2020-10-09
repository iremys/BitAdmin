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
	
	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/plugins/codemirror/lib/codemirror.css">
   

<style>
#contentFile {
    display: block;
    visibility: hidden;
    width: 0;
    height: 0;
}

.filebox{
	width:260px;
	float:left;
	margin:5px 35px 5px 5px;
</style>





</head>

<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
	<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
	<c:import url="/WEB-INF/views/includes/aside.jsp"></c:import>
	
	
	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
	
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<h1>컨텐츠작성</h1>
			<ol class="breadcrumb">
				<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
				<li><a href="#">홈페이지관리</a></li>
				<li class="active">컨텐츠작성</li>
			</ol>
		</section>
		
		<!-- Main content -->
		<section class="content">
			<div class="row">
				<!-- 박스 -->
				<div class="col-xs-12" >
					<div class="box box-body">
						<div class="row">
							<form id="frm_content">
								<!-- 컨텐츠 개요 영역 -->
								<div class="col-xs-6">
									<div class="sub-box">
										<div class="sub-toolbox">
											<div class="row">
												<div class="col-xs-12">
													<div class="sub-title">컨텐츠 개요</div>
												</div>
											</div><!-- /.row -->
										</div>
										<!-- /.sub-toolbox -->
		
										<!-- 컨텐츠 작성 폼 -->
										<div class="sub-body " id="">
											<div class="row">
												<div class="col-xs-12">
													<table class="table table-condensed no-border">
														<colgroup>
															<col width=60px />
															<col width='' />
														</colgroup>
														<tbody id=''>
														<tr>
															<th>분류</th>
															<td class="form-inline">
																	&nbsp;
																	<span id="text_cateName" class="w400">${hContentVo.cateName}</span>
																	<input class="form-control" type="hidden" name="hCate_id" value="${hContentVo.hCate_id}">
																	<button class="btn btn-default btn-h25 pull-right" type="button" id="btn_">분류선택</button>
															</td>
														</tr>
														<tr>
															<th>제목</th>
															<td class="">
																	<input class="form-control" type="text" name="title" value="${hContentVo.title}">
															</td>
														</tr>
														<tr>
															<th>url</th>
															<td class="">
																	&nbsp;
																	<a href="/hContent/getHContent?hContent_id=${hContentVo.hContent_id}"  target="_blank">
																		/hContent/getHContent?hContent_id=${hContentVo.hContent_id}
																	</a>
															</td>
														</tr>
														
														<tr>
															<th>서브메뉴</th>
															<td class="">
																	<select class="form-control" name="aside_id" >
																		<option value="" selected>-- 서브메뉴를 선택해주세요 --</option>
																		<c:forEach items="${aSideList}" var="aSideVo">
																			<c:if test="${aSideVo.hInclude_id eq hContentVo.aside_id}">
																				<option value="${aSideVo.hInclude_id}" selected>${aSideVo.hIncludeName}</option>
																			</c:if>
																			<c:if test="${aSideVo.hInclude_id ne hContentVo.aside_id}">
																				<option value="${aSideVo.hInclude_id}" >${aSideVo.hIncludeName}</option>
																			</c:if>
																		</c:forEach>
																	</select>
															</td>
														</tr>
													</table>
												</div><!-- ./col-xs-12 -->
											</div><!-- ./row -->
										</div><!-- /.sub-body -->
									</div><!-- /.sub-box -->
								</div><!-- ./col-xs-6 -->
								<!-- /.컨텐츠 개요 영역 -->
							
								
								<!-- 첨부파일 영역 -->
								<div class="col-xs-6">
									<div class="sub-box">
										<div class="sub-toolbox">
											<div class="row">
												<div class="col-xs-6">
													<div class="sub-title">첨부파일</div>
												</div>
												<div class="col-xs-6">
													<button class="btn btn-default btn-h25 pull-right" id="btn_fileUpload_open" type="button">파일첨부</button>
													<input type="file" name="file" id="contentFile" />
												</div>
											</div><!-- /.row -->
										</div>
										<!-- /.sub-toolbox -->
		
										<!-- 첨부파일 리스트 영역-->
										<div class="sub-body left-nopadding" id="">
											<div class="row">
												<div class="col-xs-12">
													<div id="fileList" class="scroll_y bordered form-inline" style="height: 118px;">
														<!-- 첨부파일 리스트 -->	
													</div>
												</div><!-- ./col-xs-12 -->
											</div><!-- ./row -->
										</div><!-- /.sub-body -->
									</div><!-- /.sub-box -->
								</div><!-- ./col-xs-6 -->
								<!-- /.첨부파일 영역 -->
							
								<div class="col-xs-12">
									<div class="sub-box">
										<div class="sub-body " id="">
											<div class="row">
												<div class="col-xs-12">
													<table class="table table-condensed no-border">
															<tr>
																<th>컨텐츠코드</th>
															</tr>
															<tr>
																<td>
	<textarea id="contentHtml" class="form-control"  name="contentHtml" >${hContentVo.contentHtml}</textarea>	
																</td>
															</tr>
														</table>
												</div><!-- ./col-xs-12 -->
											</div><!-- ./row -->
										</div><!-- /.sub-body -->
												
									</div><!-- /.sub-box -->
								</div><!-- ./col-xs-12 -->
								
								<div class="col-xs-12">
									<!-- sub-toolbox -->
									<div class="sub-toolbox clearfix text-center">
										<div class="row" >
											<div class="col-xs-4">
											</div>
											<div class="col-xs-4">
												<input type="button" id="btn_subject_modify" value="수정" class="btn btn-primary">
											</div>
											<div class="col-xs-4">
												<a class="btn btn-default pull-right" href="${pageContext.request.contextPath }/hPage/list?hCate_id=${hContentVo.hCate_id}">목록</a>
											</div> 
										</div>
									</div>
									<!-- /.sub-toolbox -->
									<input class="form-control" type="text" name="hContent_id" value="${hContentVo.hContent_id}">
								</div>
							</form>
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
	
	
	<div id="notiBox"></div>
</div>
<!-- ./wrapper -->
	

<!-- 공통 자바스트립트 임포트-->
<c:import url="/WEB-INF/views/includes/script.jsp"></c:import>
	
<!-- 해당페이지용 자바스트립트-->
<%-- <script src="${pageContext.request.contextPath }/assets/plugins/taboverride/taboverride.min.js"></script> --%>

<script src="${pageContext.request.contextPath }/assets/plugins/codemirror/lib/codemirror.js"></script>

<script src="${pageContext.request.contextPath }/assets/plugins/codemirror/mode/xml/xml.js"></script>
<script src="${pageContext.request.contextPath }/assets/plugins/codemirror/mode/javascript/javascript.js"></script>
<script src="${pageContext.request.contextPath }/assets/plugins/codemirror/mode/css/css.js"></script>
<script src="${pageContext.request.contextPath }/assets/plugins/codemirror/mode/htmlmixed/htmlmixed.js"></script>


<c:import url="/WEB-INF/views/hPageMng/hModifyForm_js.jsp"></c:import>


</body>



</html>
