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
			
			<!-- 카테고리영역 -->
			<div class="col-xs-3">
          
	          	<!--탭 박스 외곽 -->
				<div class="nav-tabs-custom">
            		
            		<!-- 상단탭영역 -->
            		<ul class="nav nav-tabs">
              			<li class="active"><a href="#tab_1" data-toggle="tab">카테고리</a></li>
              			<li class=""><a href="#tab_2" data-toggle="tab">검색</a></li>
              
            		</ul>
            		<!-- /.상단탭영역 -->
            		<!-- /.탭내용박스 -->
            		<div class="tab-content">
              			<!-- 1번탭내용 -->
              			<div class="tab-pane active" id="tab_1">
                			<b>카테고리</b>
              			</div>
              			<!-- /.1번탭내용 -->
              			
              			<!-- 2번탭내용 -->
              			<div class="tab-pane" id="tab_2">
                			<b>검색결과영역</b>
              			</div>
              			<!-- /.2번탭내용 -->
            		</div>
            		<!-- /.탭내용박스 -->
          		</div><!--/.탭 박스 외곽 -->
        	</div>
        	<!-- /.카테고리영역 -->
          	
          	<!-- 과목정보영역 -->
          	<div class="col-xs-9">
		
				<div class="box box-primary">
            		
            		<!-- box-header -->
            		<div class="box-header with-border">
              			<!-- 서브메뉴 -->
                		<ul class="nav nav-pills">
  							<li class="active"><a href="#">패키지개요</a></li>
  							<li class=""><a href="#">구성과목</a></li>
  							<li class=""><a href="#">회원관리</a></li>
						</ul>
            		</div>
            		<!-- /.box-header -->
            		
            		<!-- box-body -->
            		<div class="box-body">
						<table class="table table-bordered table-condensed table_input">
 							<colgroup>
								<col width="120px" />
								<col width="" />
							</colgroup>
 							
 							<tbody>
 								<tr>
   									<th>패키지사용여부</th>
									<td>
                    					<div class="">
                    					<!-- <input class="" type="radio"><label class="checkbox-inline">진행중</label>
		                   					<input class="" type="radio"><label class="checkbox-inline">진행중</label> -->
		                   					
		                   					<label class="checkbox-inline"><input class="" type="radio" name="state" value="">진행중</label>
		                   					<label class="checkbox-inline"><input class="" type="radio" name="state" value="">진행중</label>
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
              		</div>
              		<!-- /.box-body -->
              		
              		<!-- box-footer -->
              		<div class="box-footer">
	              		<div class="row">
	              			<div class="col-xs-4">
	              			</div>
	              			<div class="col-xs-4 text-center">
	              				<button type="button" class="btn btn-primary btn-sm w100 ">수정</button>
	              			</div>
	              			<div class="col-xs-4">
	              				<button type="button" class="btn btn-default btn-sm w60 pull-right ">삭제</button>
	              			</div>
	              		</div>	
            		</div>
            		<!-- /.box-footer -->
            	</div>
            	
            	
				
				
          	</div>
          	<!-- /.과목정보영역 -->
          
          	
        </div><!-- /.row -->

        
    

	</section>
	<!-- /.content -->
 
 
 
  </div>
  <!-- /.content-wrapper -->

  <c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
