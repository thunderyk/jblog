<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
		<!-- 메인 로고 이미지를 링크하세요 logo.jpg -->
	 	<a href="${pageContext.request.contextPath}">
			<img class="logo" src="${pageContext.request.contextPath}/assets/images/logo.jpg">	
		</a>
		<ul class="menu">
			<!-- 로그인 전 메뉴 -->
			<c:choose>
				<c:when test="${sessionScope.authMember == null}">
					<li><a href="${pageContext.request.contextPath}/usr/loginForm">로그인</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="${pageContext.request.contextPath}/usr/logout">로그아웃</a></li>
				</c:otherwise>
			</c:choose>
			<li><a href="${pageContext.request.contextPath}/usr/joinForm">회원가입</a></li>
 			
 		</ul>