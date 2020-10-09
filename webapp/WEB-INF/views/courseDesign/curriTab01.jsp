<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- 코스기본정보 -->
<div class="tab-pane " id="tab_curriInfo">
	<table class="table table-condensed">
		<colgroup>
			<col width="120px" />
			<col width="480px" />
		</colgroup>
		<tbody>
			<tr>
				<th>목적 및 목표</th>
				<td>
					<textarea name="goal" class="form-control curriAuto" rows="10" placeholder=""></textarea>
				</td>
			</tr>
			<tr>
				<th>주요내용</th>
				<td> 
					<textarea name="content" class="form-control curriAuto" rows="10" placeholder=""></textarea>
				</td>
			</tr>
			<tr>
				<th>대상요건</th>
				<td>
					<textarea name="target" class="form-control curriAuto" rows="10" placeholder=""></textarea>
				</td>
			</tr>
		</tbody>
	</table>
</div>

