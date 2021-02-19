<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

		<ul id="admin-menu" class="clearfix">
			<li class="tabbtn selected"><a href="${pageContext.request.contextPath}/${sessionScope.authMember.id}/admin/basic">기본설정</a></li>
			<li class="tabbtn"><a href="${pageContext.request.contextPath}/${sessionScope.authMember.id}/admin/cate">카테고리</a></li>
			<li class="tabbtn"><a href="${pageContext.request.contextPath}/${sessionScope.authMember.id}/admin/writeForm">글작성</a></li>
		</ul>