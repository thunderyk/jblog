<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
		
		<div id="header" class="clearfix">
			<h1><a href="${pageContext.request.contextPath}/${sessionScope.blogVo.id}">${sessionScope.blogVo.blogTitle}</a></h1>
			
			<ul class="clearfix">
				<!-- 로그인 전 메뉴 -->
				
				<c:choose>
					<c:when test="${sessionScope.authMember == null}">
						<li><a class="btn_s" href="${pageContext.request.contextPath}/usr/loginForm">로그인</a></li>
					</c:when>
					<c:otherwise>
						<li><a class="btn_s" href="${pageContext.request.contextPath}/usr/logout">로그아웃</a></li>
						<c:if test="${sessionScope.authMember.id == sessionScope.blogVo.id}">
							<li><a class="btn_s" href="${pageContext.request.contextPath}/${sessionScope.authMember.id}/blog-admin-basic">내블로그 관리</a></li>
						</c:if>
					</c:otherwise>
				</c:choose>
				
			</ul>
		</div>		