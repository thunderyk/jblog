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
	<div id="wrap">
		
		<!-- 개인블로그 해더 -->
		<c:import url="/WEB-INF/views/includes/blog-header.jsp"></c:import>

		<div id="content">
			<c:import url="/WEB-INF/views/includes/blog/admin/blog-admin-common.jsp"></c:import>
			<!-- //admin-menu -->
			
			<div id="admin-content">
			
				<table id="admin-cate-list">
					<colgroup>
						<col style="width: 50px;">
						<col style="width: 200px;">
						<col style="width: 100px;">
						<col>
						<col style="width: 50px;">
					</colgroup>
		      		<thead>
			      		<tr>
			      			<th>번호</th>
			      			<th>카테고리명</th>
			      			<th>포스트 수</th>
			      			<th>설명</th>
			      			<th>삭제</th>      			
			      		</tr>
		      		</thead>
		      		
		      		<tbody id="cateList">
		      			<!-- 리스트 영역 -->
		      			
							
						<!-- 리스트 영역 -->
					</tbody>
				</table>
      			
		      	<table id="admin-cate-add" >
		      		<colgroup>
						<col style="width: 100px;">
						<col style="">
					</colgroup>
		      		<tr>
		      			<td class="t">카테고리명</td>
		      			<td><input type="text" name="name" id="inputCateName" value=""></td>
		      		</tr>
		      		<tr>
		      			<td class="t">설명</td>
		      			<td><input type="text" name="desc" id="inputCateDesc"></td>
		      		</tr>
		      	</table> 
			
				<div id="btnArea">
		      		<button id="btnAddCate" class="btn_l" type="submit" >카테고리추가</button>
		      	</div>
			
			</div>
			<!-- //admin-content -->
		</div>	
		<!-- //content -->
		
		
		<!-- 개인블로그 푸터 -->
		<c:import url="/WEB-INF/views/includes/blog-footer.jsp"></c:import>
	
	
	</div>
	<!-- //wrap -->
</body>

<script type="text/javascript">

$("document").ready(function(){
	
	fetchList();
});

function fetchList(){
	$.ajax({
		url : "${pageContext.request.contextPath}/${sessionScope.authMember.id}/admin/cate/list",
		type : "post",
		dataType : "json",
		success : function(categoryList){
			
			for(var i=0;i<categoryList.length;i++){
				render(categoryList[i],"down");
			}
			
		},
		error : function(XHR, status, error){
			console.error(status + " : " + error);
		}
	});
}

function render(cateVo,upDown){
	var str ='';
	
	str+='<tr id="tr'+cateVo.cateNo+'">';
	str+='	<td>'+cateVo.cateNo+'</td>';
	str+='	<td>'+cateVo.cateName+'</td>';
	str+='	<td>'+cateVo.postCount+'</td>';
	str+='	<td>'+cateVo.description+'</td>';
	str+='	<td class="text-center">';
	str+='		<img data-cateno='+cateVo.cateNo+' class="btnCateDel" id="deleteCateBtn'+cateVo.cateNo+'" src="${pageContext.request.contextPath}/assets/images/delete.jpg">';
	str+='	</td>';
	str+='</tr>';
	
	if(upDown == "down"){
		$("#cateList").append(str);	
	}else if(upDown = "up"){
		$("#cateList").prepend(str);
	}
}

$("#cateList").on("click","img",function(){
	
	var cateNo = $(this).data("cateno");
	
	$.ajax({
		url : "${pageContext.request.contextPath}/${sessionScope.authMember.id}/admin/cate/delete",
		type : "post",
		data: {"cateNo": cateNo},
		success : function(cateNo){
			$("#tr"+cateNo).remove();
		},
		error : function(XHR, status, error){
			console.error(status + " : " + error);
		}
	});
});

$("#btnAddCate").on("click",function(){
	
	var cateVo= {
		description: $("#inputCateDesc").val(),
		cateName: $("#inputCateName").val(),
		id: "${sessionScope.authMember.id}"
	}
	
	$.ajax({
		url : "${pageContext.request.contextPath}/${sessionScope.authMember.id}/admin/cate/add",
		type : "post",
		data: cateVo,
		dataType : "json",
		success : function(cateVo){
			render(cateVo,"up")
		},
		error : function(XHR, status, error){
			console.error(status + " : " + error);
		}
	});
	
});

</script>


</html>