<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
<!-- =============================================== -->

<c:import url="/WEB-INF/views/includes/aside.jsp"></c:import>
<!-- =============================================== -->

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>지원자관리
			<small>it all starts here</small>
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
		
		<!-- 상단 -->
		<div class="row">
			<div class="col-xs-12">
			
				<div class="box box-body">
					<div class="row">
						<div class="col-xs-12">
							<div class="sub-box">
								<div class="sub-title">
			              			수강생검색
			            		</div><!-- sub_title -->
								
								<div class="sub-body">
									<table class="table table-condensed">
			 							<colgroup>
											<col width="250px" />
											<col width="" />
											<col width="300px" />
										</colgroup>
			 							
			 							<thead>
			 								<tr>
			 									<th>업무구분</th>
												<th>교육과정명</th>
												<th>상태</th>
			 								</tr>
			 							</thead>	
			 							
			 							<tbody>
			 								<tr>
												<td>
			                    					<select class="form-control input-sm">
			                    						<option>국가기관</option>
			                    						<option>대학캠퍼스</option>
			                  						</select>
			                  					</td>
			                  					<td>
			                    					<select class="form-control input-sm">
			                    						<option>국가기관</option>
			                    						<option>대학캠퍼스</option>
			                  						</select>
			                  					</td>
			                  					<td>
			                    					<label class="form-controll-static"><input class="" type="radio" name="state" value="">전체</label>
		                   							<label class="form-controll-static"><input class="" type="radio" name="state" value="">모집중</label>
			                  					</td>
											</tr>
			  							</tbody>
			  						</table>
			  					</div><!-- /.sub-body -->
		  						<div class="sub-toolbox text-center">
	              					<button type="button" class="btn btn-primary">조회</button>
	              				</div>
							</div><!-- sub-box -->
						</div><!-- /.col-xs-12 -->
					</div><!-- /.row -->
				</div><!-- /.box -->
			
			</div><!-- /.col-xs-12 -->
		</div>
		<!-- /.row 상단-->
	
		<!-- 하단 -->
		<div class="row">
			<div class="col-xs-12">
				<div class="box box-body">

					<div class="row">
						<div class="col-xs-12" >
							<div class="sub-box">
								<div class="sub-title">
			              			지원자리스트
			            		</div><!-- sub_title -->
			            		<div class="sub-body bordered scroll" style="height:300px;">
			            			<table class="table table-hover table-condensed">
			 							<colgroup>
											<col width="" />
											<col width="" />
											<col width="" />
											<col width="" />
											<col width="" />
											<col width="" />
											<col width="" />
											<col width="" />
											<col width="" />
											<col width="" />
											<col width="" />
											<col width="" />
											<col width="" />
											<col width="" />
										</colgroup>
	 							
	 									<thead>
	 										<tr>
			 									<th>업무구분</th>
												<th>업무구분</th>
												<th>업무구분</th>
												<th>업무구분</th>
												<th>업무구분</th>
												<th>업무구분</th>
												<th>업무구분</th>
												<th>업무구분</th>
												<th>업무구분</th>
												<th>업무구분</th>
												<th>업무구분</th>
												<th>업무구분</th>
												<th>업무구분</th>
												<th>업무구분11</th>
	 										</tr>
	 									</thead>	
		 								<tbody>
	 										<c:forEach var="i" begin="1" end="20" step="1">
	 										<tr>
												<td>국가기관</td>
			                  					<td>국가기관</td>
			                  					<td>국가기관</td>
			                  					<td>국가기관</td>
			                  					<td>국가기관</td>
			                  					<td>국가기관</td>
			                  					<td>국가기관</td>
			                  					<td>국가기관</td>
			                  					<td>국가기관</td>
			                  					<td>국가기관</td>
			                  					<td>국가기관</td>
			                  					<td>국가기관</td>
			                  					<td>국가기관</td>
			                  					<td>국가기관1</td>
											</tr>
											</c:forEach>
		  								</tbody>
		  								
	  								</table>
			            		</div><!-- /.sub-body -->	
			            		
							</div><!-- /.sub-box -->
						</div><!-- /.col-xs-12 -->
					</div><!-- /.row -->
					<div class="space"></div>
					<div class="row">
						<div class="col-xs-3">
							<div class="sub-box">
								<div class="sub-title">
			              			과거지원내역
			            		</div><!-- sub_title -->
			            		<div class="sub-body bordered scroll" style="height:150px; ">
			            			<table class="table table-hover table-condensed">
			 							<colgroup>
											<col width="" />
											<col width="" />
										</colgroup>
 							
		 								<thead>
			 								<tr>
			 									<th>전형일자</th>
												<th>과정명</th>
			 								</tr>
		 								</thead>	
		 							
	 									<tbody>
			 								<tr>
												<td>2018-05-01</td>
			                  					<td>라즈베리파이를 이용한 전문</td>
											</tr>
											<tr>
												<td>2018-05-01</td>
			                  					<td>라즈베리파이를 이용한 전문</td>
											</tr>
	  									</tbody>
  									</table>
			            		</div><!-- /.sub-body -->	
							</div><!-- /.sub-box -->
						</div><!-- /.col-xs-3 -->
						<div class="col-xs-9">
							<div class="sub-box">
								<div class="sub-title">
			              			지원내역상세
			            		</div><!-- sub_title -->
			            		<div class="sub-body">
			            			<table class="table table-condensed">
			 							<colgroup>
											<col width="80px" />
											<col width="" />
											<col width="80px" />
											<col width="" />
											<col width="250px" />
										</colgroup>
			 							
			 							<tbody>
			 								<tr>
												<th>업무구분</th>
			                  					<td colspan="3">
			                    					<select class="form-control input-sm">
			                    						<option>국가기관</option>
			                    						<option>대학캠퍼스</option>
			                  						</select>
			                  					</td>
			                  					<td rowspan="5"><textarea class="form-control" rows="9" placeholder="상담내역"></textarea></td>
			                  				</tr>
			                  				
			                  				<tr>
			                  					<th rowspan="2">교육과정명</th>
			                  					<td colspan="3">
			                    					<label class="form-controll-static"><input class="" type="radio" name="state" value="">준비중</label>
		                   							<label class="form-controll-static"><input class="" type="radio" name="state" value="">모집중</label>
		                   							<label class="form-controll-static"><input class="" type="radio" name="state" value="">모집마감</label>
		                   							<label class="form-controll-static"><input class="" type="radio" name="state" value="">수업중</label>
		                   							<label class="form-controll-static"><input class="" type="radio" name="state" value="">종료</label>
			                  					</td>
											</tr>
											<tr>
			                  					<td colspan="3">
			                    					<input class="form-control input-sm" type="text" placeholder="">
			                  					</td>
											</tr>
											
											<tr>
			                  					<th>체크박스</th>
			                  					<td colspan="3">
			                    					<label class="form-controll-static"><input class="" type="checkbox" name="state" value="">준비중</label>
		                   							<label class="form-controll-static"><input class="" type="checkbox" name="state" value="">모집중</label>
		                   							<label class="form-controll-static"><input class="" type="checkbox" name="state" value="">모집마감</label>
		                   							<label class="form-controll-static"><input class="" type="checkbox" name="state" value="">수업중</label>
		                   							<label class="form-controll-static"><input class="" type="checkbox" name="state" value="">종료</label>
			                  					</td>
											</tr>
											
											<tr>
			                  					<th>시작일</th>
			                  					<td>
									                <div class="input-group date">
									                	<div class="input-group-addon input-sm">
									                    	<i class="fa fa-calendar"></i>
									                  	</div>
														<input type="text" class="form-control input-sm pull-right" id="datepicker">									                  	
									                </div>
			                  					</td>
			                  					<th>종료일</th>
			                  					<td>
			                    					<div class="input-group date">
									                	<div class="input-group-addon input-sm">
									                    	<i class="fa fa-calendar"></i>
									                  	</div>
														<input type="text" class="form-control input-sm pull-right" id="datepicker">									                  	
									                </div>
			                  					</td>
											</tr>
											
			  							</tbody>
			  						</table>
			            		</div><!-- /.sub-body -->	
			            		<div class="sub-toolbox text-center">
	              						<button type="button" class="btn btn-primary">저장</button>
	              				</div>
							</div><!-- /.sub-box -->
						</div><!-- /.col-xs-9 -->
					</div><!-- /.row -->
				
				</div><!-- /.box -->
			</div><!-- /.col-xs-12 -->
		</div>
		<!-- /.row 하단-->
	
	</section>
	<!-- /.Main content -->
 
 
 
</div>
<!-- /.content-wrapper -->

<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>