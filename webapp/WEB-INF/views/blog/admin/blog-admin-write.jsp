<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JBlog</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/jblog.css">

</head>

<body>
	<div id="wrap">
		
		<!-- 개인블로그 해더 -->
		<c:import url="/WEB-INF/views/includes/blog-header.jsp"></c:import>

		<div id="content">
			<c:import url="/WEB-INF/views/includes/blog/admin/blog-admin-common.jsp"></c:import>
			<!-- //admin-menu -->
			
			<div id="admin-content">
				<form action="${pageContext.request.contextPath}/${sessionScope.authMember.id}/admin/write" method="post">
			      	<table id="admin-write">
			      		<colgroup>
							<col style="width: 100px;">
							<col style="">
							<col style="">
						</colgroup>
			      		<tr>
			      			<td class="t">포스트 제목</td>
			      			<td >
			      				<input type="text" name="postTitle">
				      		</td>
				      		<td>
				      			<select name="cateNo">
				      				<!-- 카테고리 리스트 영역 -->
				      				<c:forEach items="${requestScope.categoryList}" var="vo">
				      					<option value="${vo.cateNo}">${vo.cateName}</option>
				      				</c:forEach>
				      			</select>
				      		</td>
			      		</tr>
			      		<tr>
			      			<td>내용</td>
			      			<td colspan="2"><textarea name="postContent"></textarea></td>
			      		</tr>
			      	</table>
			      	<div id="btnArea">
			      		<button class="btn_l" type="submit" >포스트하기</button>
			      	</div>
				</form>
			
			</div>
			<!-- //admin-content -->
		</div>	
		<!-- //content -->
		
		<!-- 개인블로그 푸터 -->
		<c:import url="/WEB-INF/views/includes/blog-footer.jsp"></c:import>
	
	</div>
	<!-- //wrap -->
</body>
</html>
