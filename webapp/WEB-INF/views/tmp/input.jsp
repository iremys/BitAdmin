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
							
							<form action="${pageContext.request.contextPath}/tmp/insert" method="post">
							<table class="table table-condensed">
								<colgroup>
									<col width="90px" />
									<col width="" />
								</colgroup>
								<tbody>
									<tr>
										<th>구분</th>
										<td >
											<input type="text" name="cate" value="">
										</td>
									</tr>
									<tr>
										<th>과목 개요</th>
										<td>
											<textarea name="content" class="form-control" placeholder="" style="height:422px;">
											</textarea>
										</td>
									</tr>
								</tbody>
							</table>
							<input type="submit" value="저장">
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


</div>
<!-- ./wrapper -->



<!-- 공통 자바스트립트 임포트-->
<c:import url="/WEB-INF/views/includes/script.jsp"></c:import>
	
<%-- <!-- 해당페이지용 자바스트립트-->
<c:import url="/WEB-INF/views/courseDesign/subject_js.jsp"></c:import>
		 --%>
</body>



</html>
