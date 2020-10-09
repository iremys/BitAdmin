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


	<!-- Main content -->
	<section class="content">

		<!-- 상단 검색 영역 -->
		<div class="row">
			
          	<div class="col-xs-12">
		
				<div class="box">
            		
            		<!-- box-body -->
            		<div class="box-body">
						
						<table class="table table-bordered table-condensed table_input">
 							<colgroup>
								<col width="300px" />
								<col width="" />
							</colgroup>
 							
 							<thead>
 								<tr>
 									<th>업무구분</th>
									<th>교육과정 명 
										<span class="pull-right">
											<label class="checkbox-inline"><input class="" type="radio" name="state" value="" >전체</label>
			                   				<label class="checkbox-inline"><input class="" type="radio" name="state" value="">진행중</label>
			                   			</span>
		                   			</th>
 								</tr>
 							</thead>	
 							
 							<tbody>
 								<tr>
									<td>
                    					<select class="form-control input-sm">
                    						<option>국가기관</option>
                    						<option>대학캠퍼스</option>
                    						<option>option 3</option>
                    						<option>option 4</option>
                    						<option>option 5</option>
                  						</select>
                  					</td>
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
  							</tbody>
  						</table>
              		</div>
              		<!-- /.box-body -->
              		
              		<!-- 버튼영역 -->
	              	<div class="row">
              			<div class="col-xs-12 text-center btnArea">
              				<button type="button" class="btn btn-primary btn-sm w100 ">조회</button>
              			</div>
	              	</div><!-- /.버튼영역 -->
            	</div><!-- /.box -->
          	</div><!-- /.col-xs-12-->
        </div><!-- /.row 상단 검색 영역-->


        
        <!-- 하단 컨텐츠 영역 외부 -->
        <div class="row"> 
        	<div class="col-xs-12">
        		<!-- 하단박스 -->
				<div class="box">
					<div class="box-body">
					
						<!-- 지원자 리스트 -->
						<div class="row"> 
		       				<div class="col-xs-12 ">
		       					<div class="sub_title ">
	              					<div class="sub_title">지원자리스트</div>
	            				</div><!-- sub_title -->
	            				<!-- 지원자 검색 결과: 지원자 리스트 -->
		            			<div class="right-box">
		            				<table class="table table-bordered table-condensed a"   >
			 							<colgroup>
											<col width="100px" />
											<col width="100px" />
											<col width="100px" />
											<col width="100px" />
											<col width="100px" />
											<col width="100px" />
											<col width="100px" />
											<col width="100px" />
											<col width="100px" />
											<col width="100px" />
											<col width="100px" />
											<col width="100px" />
											<col width="100px" />
											<col width="100px" />
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
	 										<c:forEach var="i" begin="1" end="10" step="1">
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
		            			
		            			</div><!-- list -->
	            				
		       				</div><!-- /.col-xs-12 지원자 리스트-->
		       				
		       				<div class="col-xs-3">
		       					<div class="sub_title ">
	              					<div class="sub_title">수강지원리스트</div>
	            				</div><!-- sub_title -->
	            				<div class="right-box">
		            				<table class="table table-bordered table-condensed table_input">
			 							<colgroup>
											<col width="1000px" />
											<col width="1000px" />
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
			                  					<td>라즈베리파이를 이용한 전문가과정</td>
											</tr>
											<tr>
												<td>2018-05-01</td>
			                  					<td>라즈베리파이를 이용한 전문가과정</td>
											</tr>
											<tr>
												<td>2018-05-01</td>
			                  					<td>라즈베리파이를 이용한 전문가과정</td>
											</tr>
		  								</tbody>
	  								</table>
	            				</div>
		       				</div>
		       				<div class="col-xs-9">
		       					<div class="sub_title ">
	              					<div class="sub_title">수강지원상세</div>
	            				</div><!-- sub_title -->
	            				<div class="list">
		            				<table class="table table-bordered table-condensed table_input">
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
			                  					<td>라즈베리파이를 이용한 전문가과정</td>
											</tr>
											<tr>
												<td>2018-05-01</td>
			                  					<td>라즈베리파이를 이용한 전문가과정</td>
											</tr>
		  								</tbody>
	  								</table>
	            				</div>
		       				</div>
       					<div><!-- /.row>  	
       					
       					<!-- 지원자 리스트 -->
						<div class="row"> 
		       				
       					</div>
       				
       				</div><!-- box-body -->
       			</div><!-- /.box -->
            </div><!-- /.col-xs-12-->
        </div><!-- /.row 하단 컨텐츠 영역 외부-->  	
          	
          	
          	
				
					<!-- box-body -->
            		<div class="box-body">
            				
            			</div><!-- col-xs-12 -->
          		</div><!-- /.box -->
          	<!-- /.과목정보영역 -->
          	

			
			<!-- 카테고리영역 -->
			<div class="col-xs-3">
          
	          	<div class="box">
            		<!-- box-body -->
            		<div class="box-body right-list">
						
              		
        	</div>
        	<!-- /.카테고리영역 -->
          	
          	<!-- 과목정보영역 -->
          	<div class="col-xs-9">
		
				<div class="box">
            		
            		
            		<!-- box-body -->
            		<div class="box-body">
						<table class="table table-bordered table-condensed table_input">
 							<colgroup>
								<col width="70px" />
								<col width="" />
								<col width="70px" />
								<col width="140" />
							</colgroup>
 							
 							<tbody>
 								<tr>
   									<th>업무구분</th>
									<td>
		                   					<input class="form-control input-sm" type="text" placeholder=""></td>
                  					</td>
                  					<th>과목별명</th>
                  					<td>
		                   					<input class="form-control input-sm" type="text" placeholder=""></td>
                  					</td>
								</tr>
								<tr>
   									<th>업무구분</th>
									<td>
		                   					<input class="form-control input-sm" type="text" placeholder=""></td>
                  					</td>
                  					<th>과목별명</th>
                  					<td>
		                   					<input class="form-control input-sm" type="text" placeholder=""></td>
                  					</td>
								</tr>
								<tr>
   									<th>업무구분</th>
									<td>
		                   					<input class="form-control input-sm" type="text" placeholder=""></td>
                  					</td>
                  					<th>과목별명</th>
                  					<td>
		                   					<input class="form-control input-sm" type="text" placeholder=""></td>
                  					</td>
								</tr>
								<tr>
   									<th>업무구분</th>
									<td>
		                   					<input class="form-control input-sm" type="text" placeholder=""></td>
                  					</td>
                  					<th>과목별명</th>
                  					<td>
		                   					<input class="form-control input-sm" type="text" placeholder=""></td>
                  					</td>
								</tr>
								<tr>
   									<th>업무구분</th>
									<td>
		                   					<input class="form-control input-sm" type="text" placeholder=""></td>
                  					</td>
                  					<th>과목별명</th>
                  					<td>
		                   					<input class="form-control input-sm" type="text" placeholder=""></td>
                  					</td>
								</tr>
  							</tbody>
  						</table>
  						
  						
  						<br>
  						
  						<table class="table table-bordered table-condensed table_input">
 							<colgroup>
								<col width="70px" />
								<col width="" />
								<col width="70px" />
								<col width="140" />
							</colgroup>
 							
 							<tbody>
 								<tr>
   									<th>업무구분</th>
									<td>
		                   					<input class="form-control input-sm" type="text" placeholder=""></td>
                  					</td>
                  					<th>과목별명</th>
                  					<td>
		                   					<input class="form-control input-sm" type="text" placeholder=""></td>
                  					</td>
								</tr>
								<tr>
   									<th>업무구분</th>
									<td>
		                   					<input class="form-control input-sm" type="text" placeholder=""></td>
                  					</td>
                  					<th>과목별명</th>
                  					<td>
		                   					<input class="form-control input-sm" type="text" placeholder=""></td>
                  					</td>
								</tr>
								<tr>
   									<th>업무구분</th>
									<td>
		                   					<input class="form-control input-sm" type="text" placeholder=""></td>
                  					</td>
                  					<th>과목별명</th>
                  					<td>
		                   					<input class="form-control input-sm" type="text" placeholder=""></td>
                  					</td>
								</tr>
								<tr>
   									<th>업무구분</th>
									<td>
		                   					<input class="form-control input-sm" type="text" placeholder=""></td>
                  					</td>
                  					<th>과목별명</th>
                  					<td>
		                   					<input class="form-control input-sm" type="text" placeholder=""></td>
                  					</td>
								</tr>
								<tr>
   									<th>업무구분</th>
									<td>
		                   					<input class="form-control input-sm" type="text" placeholder=""></td>
                  					</td>
                  					<th>과목별명</th>
                  					<td>
		                   					<input class="form-control input-sm" type="text" placeholder=""></td>
                  					</td>
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
          
          	

    

	</section>
	<!-- /.content -->
 
 
 
  </div>
  <!-- /.content-wrapper -->

  <c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
