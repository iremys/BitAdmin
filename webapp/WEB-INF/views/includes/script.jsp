<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!-- jQuery 3 -->
<script src="${pageContext.request.contextPath}/assets/bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="${pageContext.request.contextPath}/assets/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- SlimScroll -->
<script src="${pageContext.request.contextPath}/assets/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="${pageContext.request.contextPath}/assets/bower_components/fastclick/lib/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="${pageContext.request.contextPath}/assets/dist/js/adminlte.min.js"></script>


<!-- zTree -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/plugins/ztree/js/jquery.ztree.core.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/plugins/ztree/js/jquery.ztree.excheck.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/plugins/ztree/js/jquery.ztree.exedit.js"></script>

<!-- 달력 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/plugins/datepicker/js/jquery.datepicker.js"></script>


<!-- 핸들바 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/plugins/handlebars/handlebars-v4.0.12.js"></script>

<%-- 
<!-- jqGrid -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/jqGrid/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/jqGrid/js/i18n/grid.locale-kr.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/jqGrid/js/jquery.jqGrid.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/jqGrid/jquery-ui/jquery-ui.js"></script>

 --%>
 
<script type="text/javascript" >
$(document).ajaxStart(function() {
	$("#loading").show();
	console.log("ajaxStart");
})
$(document).ajaxStop(function() {
	$("#loading").hide();
	console.log("ajaxStop");
});

</script>
