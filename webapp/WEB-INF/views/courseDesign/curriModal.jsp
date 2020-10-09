<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- 코스커리큘럼 모달 -->
<div class="modal fade" id="modal_subjectList">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title">과목 카테고리 선택</h4>
			</div>
			<div class="modal-body">
				<div class="container-fluid">
					 <div class="row">
					 	<div class="col-xs-6">
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
									<div class="cate-box" style="height: 423px;">
										<div class="" id="">
											<ul id="ztree_cns" class="ztree">
												<!-- 과목트리 -->
											</ul>
										</div>
									</div>
								</div><!-- /.scroll -->
								<!-- /.카테고리 메인영역 -->
								
							</div><!-- /.sub-box -->
					 	</div>
					 	<div class="col-xs-6">
					 		<form id="frm_subject" >
							<!-- 과목을 선택했을때 -->
								<div class="sub-box">
									
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
												<tr style="height:380px;" >
													<th>과목 개요</th>
													<td >
														<textarea readonly id="text_subjectDesc" class="div_subjectDesc readOnly">{{subjectDesc}}</textarea>
													</td>
												</tr>
											</tbody>
										</table>
									</div><!-- /.sub-body -->
									
									<input type="hidden" name="subjectCate_id" value="-1">
									<input type="hidden" name="subject_id" value="-1">
									
								</div><!-- /.sub-box -->
								<!-- ./과목을 선택했을때 -->
							</form>
					 	</div>
					 </div>
				</div>
			</div>
			<div class="modal-footer">
				<div class="row">
					<div class="col-xs-4"></div>
					<div class="col-xs-4 text-center">
						<button type="button" class="btn btn-primary" id="btn_subject_choice">선택</button>
					</div>
					<div class="col-xs-4">
						<button type="button" class="btn btn-default pull-right" data-dismiss="modal">취소</button>
					</div>
				</div>
      		</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->



