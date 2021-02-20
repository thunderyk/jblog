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
		
		<!-- 메인 해더 -->
		<c:import url="/WEB-INF/views/includes/main-header.jsp"></c:import>

		<div>		
			<form id="joinForm" method="post" action="${pageContext.request.contextPath}/usr/join">
				<table>
			      	<colgroup>
						<col style="width: 100px;">
						<col style="width: 170px;">
						<col style="">
					</colgroup>
		      		<tr>
		      			<td><label for="txtId">아이디</label></td>
		      			<td><input id="txtId" type="text" name="id"></td>
		      			<td><button id="btnIdCheck" type="button">아이디체크</button></td>
		      		</tr>
		      		<tr>
		      			<td></td>
		      			<td id="tdMsg" colspan="2"></td>
		      		</tr> 
		      		<tr>
		      			<td><label for="txtPassword">패스워드</label> </td>
		      			<td><input id="txtPassword" type="password" name="password"  value=""></td>   
		      			<td></td>  			
		      		</tr> 
		      		<tr>
		      			<td><label for="txtUserName">이름</label> </td>
		      			<td><input id="txtUserName" type="text" name="userName"  value=""></td>   
		      			<td></td>  			
		      		</tr>  
		      		<tr>
		      			<td><span>약관동의</span> </td>
		      			<td colspan="3">
		      				<input id="chkAgree" type="checkbox" name="agree">
		      				<label for="chkAgree">서비스 약관에 동의합니다.</label>
		      			</td>   
		      		</tr>   		
		      	</table>
		      	<input type="hidden" value="" id="checkId">
		      	<!-- 체크한 아이디름 담아 놓는 곳 -->
		      	<!-- 한번 체크하고 아이디를 바꿀경우 다시 체크게 하기 위해서 -->
		      	<input type="hidden" value="" id="checkedId">
	      		<div id="btnArea">
					<button id="btnJoin" class="btn" type="submit" >회원가입</button>
				</div>
	      		
			</form>
			
		</div>
		
		
		<!-- 메인 푸터  자리-->
		<c:import url="/WEB-INF/views/includes/main-footer.jsp"></c:import>
		
	</div>

</body>
<script type="text/javascript">

$("#joinForm").on("submit",function(){
	var id = $("#txtId").val();
	var checkID = $("#checkId").val();
	var checkedID = $("#checkedId").val();
	var password = $("#txtPassword").val();
	var name = $("#txtUserName").val();
	var checkAgree = $("#chkAgree").is(":checked");
	
	if(id.length<2){
		alert("아이디를 입력해주세요(최소 2글자 이상)");
		return false;
	}
	if(checkID != "can" || id != checkedID){
		alert("아이디 중복체크를 해주세요.");
		$("#tdMsg").html("");
		return false;
	}
	if(password.length<8){
		alert("패스워드를 입력해주세요(최소 8글자)");
		return false;
	}
	if(name.length<1){
		alert("이름을 입력해주세요");
		return false;
	}
	if(!checkAgree){
		alert("약관에 동의해 주세요.");
		return false;
	}
	
	return true;
});

$("#btnIdCheck").on("click",function(){
	
	var id = $("#txtId").val();
	
	if(id.length<2){
		alert("아이디를 입력해주세요(최소 2글자 이상)");
		$("#tdMsg").html("");
		return false;
	}
	
	$.ajax({
		url: "${pageContext.request.contextPath}/usr/checkId",
		type : "post",
		data : {"id": id},
		dataType : "json",
		success : function(result){
			$("#checkId").val(result.check);
			if(result.check == 'can'){
				$("#tdMsg").html("사용할 수 있는 아이디 입니다.");
				$("#checkedId").val(result.id);
			}else{
				$("#tdMsg").html("사용할 수 없는 아이디 입니다.");
				$("#checkedId").val(result.id);
			}
			
		},
		error : function(XHR, status, error) {
			console.error(status + " : " + error);
		}
	});
	
});

</script>

</html>