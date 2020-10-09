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
	<c:import url="/WEB-INF/views/includes/link.jsp"></c:import>

</head>

<body class="hold-transition skin-blue sidebar-mini">

<div class="wrapper">

<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
<c:import url="/WEB-INF/views/includes/aside.jsp"></c:import>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">

	<section class="content-header">
		<h1>패키지관리
			<small>it all starts here</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
			<li><a href="#">과정설계업무</a></li>
			<li class="active">패키지관리</li>
		</ol>
	</section>


	<!-- Main content -->
	<section class="content">

		<div class="row">


			<div class="col-xs-12">
				<div class="box box-body">

					<div class="row">
						<!-- 카테고리영역 -->
						<div class="col-xs-3">
							<div class="sub-box">
								<div class="cate-title">
									과목카테고리
								</div><!-- sub_title -->

								<div class="cate-outter bordered">
									<div class="cate-toolbox">
										<button type="button" class="btn btn-default btn-cate">추가</button>
										<button type="button" class="btn btn-default btn-cate pull-right">편집</button>
									</div><!-- /.cate-toolbox -->
									<div class="scroll">
										<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
										<br><br><br><br><br><br><br><br><br>
									</div><!-- /.sub-body -->

								</div><!-- /.cate-outter -->

								<div class="cate-toolbox">
									<div class="input-group input-group-sm">
										<input class="form-control" type="text">
										<span class="input-group-btn">
                      							<button class="btn btn-info btn-flat" type="button">Go!</button>
                    						</span>
									</div>
								</div><!-- /.cate-toolbox -->
							</div><!-- /.sub-box -->
						</div><!-- /.col-xs-3 -->
						<!-- /.카테고리영역 -->

						<!-- 과목정보영역 -->
						<div class="col-xs-9">
							<div class="sub-box">
								<div class="sub-title">
									<ul class="nav nav-pills">
										<li class="active"><a href="./13">패키지개요</a></li>
										<li class=""><a href="./14">구성과목</a></li>
										<li class=""><a href="#">회원관리</a></li>
									</ul>
								</div>
								<div class="sub-body">
									<!-- 1번메뉴내용 -->
									<table class="table table-condensed">
										<colgroup>
											<col width="120px" />
											<col width="" />
										</colgroup>

										<tbody>
										<tr>
											<th>패키지사용여부</th>
											<td>
												<div class="">
													<label class="form-controll-static"><input class="" type="radio" name="state" value="">준비중</label>
													<label class="form-controll-static"><input class="" type="radio" name="state" value="">모집중</label>
												</div>
											</td>
										</tr>
										<tr>
											<th>패키지카테고리</th>
											<td>
												<select class="form-control input-sm">
													<option>국가기관</option>
													<option>대학캠퍼스</option>
													<option>option 3</option>
													<option>option 4</option>
													<option>option 5</option>
												</select>
											</td>
										</tr>
										<tr>
											<th>패키지명</th>
											<td><input class="form-control input-sm" type="text" placeholder=""></td>
										</tr>
										<tr>
											<th>훈련목적및목표</th>
											<td><textarea class="form-control" rows="6" placeholder=""></textarea></td>
										</tr>
										<tr>
											<th>주요훈련내용</th>
											<td><textarea class="form-control" rows="6" placeholder=""></textarea></td>
										</tr>
										<tr>
											<th>훈련대상요건</th>
											<td><textarea class="form-control" rows="6" placeholder=""></textarea></td>
										</tr>
										</tbody>
									</table>
									<div class="sub-toolbox text-center">
										<button type="button" class="btn btn-primary">저장</button>
									</div>
								</div>
								<!-- /.1번메뉴내용 -->
							</div>

						</div><!-- /.sub-box -->



					</div><!-- /.col-xs-9 -->
					<!-- /.과목정보영역 -->
				</div><!-- /.row -->


			</div><!-- /.box -->

		</div><!-- /.col-xs-12 -->


<!-- /.row -->




	</section>
	<!-- /.content -->
 
 
 
</div>
<!-- /.content-wrapper -->

<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>

	<div class="control-sidebar-bg"></div>



</div>
<!-- ./wrapper -->


</body>
</html>
