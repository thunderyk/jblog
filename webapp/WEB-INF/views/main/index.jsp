<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JBlog</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/jblog.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.12.4.js"></script>

</head>
<body>
	<div id="center-content">
		
		<!--메인 해더 자리 -->
		<c:import url="/WEB-INF/views/includes/main-header.jsp"></c:import>
		
		<form id="search-form" >
			<fieldset>
				<input type="text" name="keyword" >
				<button id="btnSearch" type="submit" >검색</button>
			</fieldset>
			
			<fieldset>
				<label for="rdo-title">블로그 제목</label> 
				<input id="rdo-title" type="radio" name="kwdOpt" value="optTitle" checked="checked"> 
				
				<label for="rdo-userName">블로거 이름</label> 
				<input id="rdo-userName" type="radio" name="kwdOpt" value="optName" > 
			</fieldset>
		</form>
		
		<c:if test="${requestScope.map != null}">
		<div id="resultList">
			<table border="1">
				<colgroup>
					<col style="width: 125px;">
					<col style="width: 600px;">
					<col style="width: 150px;">
					<col style="width: 100px;">
				</colgroup>
				<c:forEach items="${requestScope.map.BlogList}" var="vo">
					<tr>
						<c:choose>
							<c:when test="${vo.logoFile != null }">
								<td>
									<img id="srhImg" src="${pageContext.request.contextPath}/upload/${vo.logoFile}">
								</td>
							</c:when>
							<c:otherwise>
								<td>
									<img id="srhImg" src="${pageContext.request.contextPath}/assets/images/spring-logo.jpg">
								</td>
							</c:otherwise>
						</c:choose>
		 				
		 				<td><a href="${pageContext.request.contextPath}/${vo.id}">${vo.blogTitle}</a></td>
		 				<td>${vo.userName}(${vo.id})</td>
						<td>${vo.joinDate}</td>
					</tr>
				</c:forEach>
			</table>
			
			<div class="clear"></div>				
				<div id="paging">
					<ul>
						<c:if test="${map.prev == true }">
							<li><a href="${pageContext.request.contextPath}/?keyword=${param.keyword}&kwdOpt=${param.kwdOpt}&crtPage=${map.startPageBtnNo-1}">◀</a></li>
						</c:if>
					
						<c:forEach begin="${map.startPageBtnNo}" end = "${map.endPageBtnNo}" step="1" var="page">
							<li><a href="${pageContext.request.contextPath}/?keyword=${param.keyword}&kwdOpt=${param.kwdOpt}&crtPage=${page}">${page}</a>
						</c:forEach>
							
						<c:if test="${map.next == true }">
							<li><a href="${pageContext.request.contextPath}/?keyword=${param.keyword}&kwdOpt=${param.kwdOpt}&crtPage=${map.endPageBtnNo+1}">▶</a></li>
						</c:if>
					</ul>
				</div>
			</div>
			</c:if>
		
		<!-- 메인 푸터  자리-->
		<c:import url="/WEB-INF/views/includes/main-footer.jsp"></c:import>
	
	</div>
	<!-- //center-content -->
</body>

<script type="text/javascript">

$("#btnSearch").on("submit",function(){
	var kwdOpt = $("input[name=kwdOpt]:checked").val();
	var keyword = $("input[name=keyword]").val();
	
	alert(searchWay);
	
	$.ajax({
		url : "${pageContext.request.contextPath}/",
		type : "post",
		data: {keyword: keyword,
			   kwdOpt: kwdOpt},
		error : function(XHR, status, error){
			console.error(status + " : " + error);
		}
	});
	
});



</script>

</html>