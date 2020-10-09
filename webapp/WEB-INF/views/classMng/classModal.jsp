<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- 커리큘럼관리 모달(클래스:반 개설관리 에서 사용) -->
<div class="modal fade" id="modal_curriList">
	<div class="modal-dialog ">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title">커리큘럼관리</h4>
			</div>
			<form id="frm_curri" >
				<div class="modal-body">
					<div class="container-fluid">
						 <div class="row">
						 	<div class="col-xs-12">
						 		<div class="sub-box">
										
									<div class="sub-toolbox">
										<div class="row">
											<div class="col-xs-12">
												<div class="sub-title">커리큘럼카테고리</div>
											</div>
										</div><!-- /.row -->
									</div>
									<!-- /.sub-toolbox -->
	
									<!-- 커리큘럼 메인영역 -->
									<div class="sub-body scroll bordered" id="cateBox">
										<div class="cate-box" style="height: 423px;">
											<div class="" id="">
												<ul id="ztree_cncm" class="ztree">
													<!-- 과목트리 -->
												</ul>
											</div>
										</div>
									</div><!-- /.scroll -->
									<!-- /.카테고리 메인영역 -->
									
								</div><!-- /.sub-box -->
						 	</div>
						 </div>
					</div>
				</div>
				<div class="modal-footer">
					<div class="row">
						<div class="col-xs-4"></div>
						<div class="col-xs-4 text-center">
							<button type="button" class="btn btn-primary" id="btn_curri_choice">선택</button>
						</div>
						<div class="col-xs-4">
							<button type="button" class="btn btn-default pull-right" data-dismiss="modal">취소</button>
						</div>
					</div>
	      		</div>
	      		<input type="text" name="curri_id_modal" value="-1">
      		</form>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->



