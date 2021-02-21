<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JBlog</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/jblog.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.12.4.js"></script>
</head>

<body>
	<div id="wrap">

		<!-- 개인블로그 해더 -->
		<c:import url="/WEB-INF/views/includes/blog-header.jsp"></c:import>
		
		<div id="content" class="clearfix">
			<div id="profilecate_area">
				<div id="profile">
					<c:choose>
						<c:when test="${sessionScope.blogVo.logoFile==null}">
							<img id="proImg" src="${pageContext.request.contextPath}/assets/images/spring-logo.jpg">	
						</c:when>
						<c:otherwise>
							<img id="proImg" src="${pageContext.request.contextPath}/upload/${sessionScope.blogVo.logoFile}">
						</c:otherwise>
					</c:choose>
					
					<div id="nick">${sessionScope.blogVo.userName}(${sessionScope.blogVo.id})님</div>
				</div>
				
				<div id="cate">
					<div class="text-left">
						<strong>카테고리</strong>
					</div>
					<ul id="cateList" class="text-left">
						<c:forEach items="${requestScope.map.categoryList}" var="vo">
							<li><a href="${pageContext.request.contextPath}/${sessionScope.blogVo.id}?cateNo=${vo.cateNo}">${vo.cateName}</a></li>
						</c:forEach>
					</ul>
				</div>
			</div>
			
			<!-- profilecate_area -->
			<div id="post_area">
				<c:choose>
					<c:when test="${requestScope.map.postVo == null}">
						<div id="postBox" class="clearfix">
								<div id="postTitle" class="text-left"><strong>등록된 글이 없습니다.</strong></div>
								<div id="postDate" class="text-left"><strong></strong></div>
								<div id="postNick"></div>
						</div>
				    
						<div id="post" >
						</div>
					</c:when>
					<c:otherwise>
						<div id="postBox" class="clearfix">
							<div id="postTitle" class="text-left"><strong>${requestScope.map.postVo.postTitle}</strong></div>
							<div id="postDate" class="text-left"><strong>${requestScope.map.postVo.regDate}</strong></div>
							<div id="postNick">${sessionScope.blogVo.userName}(${sessionScope.blogVo.id})님</div>
						</div>
						
						<div id="post" >
							${requestScope.map.postVo.postContent}
						</div>
					</c:otherwise>
				</c:choose>		
				
				<c:if test="${sessionScope.authMember != null }">
					
					<div id="commentDiv">
						<span class="spComment">${sessionScope.authMember.userName}</span>
						<input type="text" value="" id="txtComment">
						<input type="button" value="저장" id="btnComment">
					</div>
					
					<div class="clear"></div>
						
					<div id="commentsListArea">
						<table>
							<colgroup>
								<col style="width: 76px;">
								<col style="width: 620px;">
								<col style="width: 80px;">
								<col style="width: 20px;">
							</colgroup>
							<tbody id="comment-list">
								
			      			</tbody>
						</table>
						
						<br>
					</div>
				</c:if>
				
				<div class="clear"></div>
				
				<div id="list">
					<div id="listTitle" class="text-left"><strong>카테고리의 글</strong></div>
					<table>
						<colgroup>
							<col style="">
							<col style="width: 20%;">
						</colgroup>
						
						<c:forEach items="${requestScope.map.postList}" var="vo">
							<tr>
								<td class="text-left"><a href="${pageContext.request.contextPath}/${sessionScope.blogVo.id}?postNo=${vo.postNo}">${vo.postTitle}</a></td>
								<td class="text-right">${vo.regDate}</td>
							</tr>									
						</c:forEach>
					</table>
					
					<div class="clear"></div>
					
					<div id="paging">
						<ul>
							<c:if test="${map.prev == true }">
								<li><a href="${pageContext.request.contextPath}/${sessionScope.blogVo.id}?crtPageOfPost=${map.startPageBtnNo-1}">◀</a></li>
							</c:if>
							
							<c:forEach begin="${map.startPageBtnNo}" end = "${map.endPageBtnNo}" step="1" var="page">
								<li><a href="${pageContext.request.contextPath}/${sessionScope.blogVo.id}?crtPageOfPost=${page}">${page}</a>
							</c:forEach>
							
							<c:if test="${map.next == true }">
								<li><a href="${pageContext.request.contextPath}/${sessionScope.blogVo.id}?crtPageOfPost=${map.endPageBtnNo+1}">▶</a></li>
							</c:if>
						</ul>
					</div>
					
				</div>
				<!-- //list -->
			</div>
			<!-- //post_area -->
			
			
			
		</div>	
		<!-- //content -->
		<div class=></div>
		<c:import url="/WEB-INF/views/includes/blog-footer.jsp"></c:import>
	
	</div>
	<!-- //wrap -->
</body>

<script type="text/javascript">

$("document").ready(function(){
	if(${sessionScope.authMember != null}){
		fetchList();	
	}
});

function fetchList(){
	
	var postNo =  "${requestScope.map.postVo.postNo}";

	$.ajax({
		url : "${pageContext.request.contextPath}/${sessionScope.authMember.id}/list",
		type : "post",
		data : {"postNo" : postNo},
		dataType : "json",
		success : function(commentList){

			for(var i=0;i<commentList.length;i++){
				render(commentList[i],"down");
			}
			
		},
		error : function(XHR, status, error){
			console.error(status + " : " + error);
		}
	});
}

$("#btnComment").on("click",function(){
	
	var commentVo = {
			cmtContent: $("#txtComment").val(),
			postNo: "${requestScope.map.postVo.postNo}",
			userNo: "${sessionScope.authMember.userNo}"
		};
		
		$.ajax({
			url : "${pageContext.request.contextPath}/${sessionScope.authMember.id}/comment",
			type : "post",
			data: commentVo,
			dataType : "json",
			success : function(commentVo){
				render(commentVo,"up");
			},
			error : function(XHR, status, error){
				console.error(status + " : " + error);
			}
		});
});

$("#comment-list").on("click", "img", function(){
	
	var cmtNo =  $(this).data("cmtno");
	
	$.ajax({
		url : "${pageContext.request.contextPath}/${sessionScope.authMember.id}/deleteComment",
		type : "post",
		data : {"cmtNo" : cmtNo},
		dataType : "json",
		success : function(result){
			$("#comments"+result).remove();
			
		},
		error : function(XHR, status, error){
			console.error(status + " : " + error);
		}
	});
});

function render(cmtVo,upDown){
	var str ='';
	
	str+='<tr id="comments'+cmtVo.cmtNo+'">';
	str+='	<td>'+cmtVo.userName+'</td>';
	str+='	<td>'+cmtVo.cmtContent+'</td>';
	str+='	<td>'+cmtVo.regDate+'</td>';
	
	if(cmtVo.userNo == ${sessionScope.authMember.userNo}){
		str+='	<td><img data-cmtno='+cmtVo.cmtNo+' src="${pageContext.request.contextPath}/assets/images/delete.jpg"></td>';
	}
	str+='</tr>';
	
	if(upDown == "down"){
		$("#comment-list").append(str);	
	}else if(upDown = "up"){
		$("#comment-list").prepend(str);
	}
}


</script>

</html>