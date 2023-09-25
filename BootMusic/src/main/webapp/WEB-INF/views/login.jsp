<%@page import="com.spring.music.domain.Member"%>
<%@page import="com.spring.music.domain.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="js/main.js"></script>
</head>
<body>
<% String msg = (String)request.getAttribute("msg"); %>
<% String jmsg = (String)request.getAttribute("jmsg"); %>
<% Member joinInfo = (Member)request.getAttribute("joinInfo"); %>
<% String valid_id = (String)request.getAttribute("valid_id"); %>
<% String valid_pw = (String)request.getAttribute("valid_pw"); %>
<% String valid_nick = (String)request.getAttribute("valid_nick"); %>
	<%@include file="/WEB-INF/layouts/header.jsp" %>
	<div class="container" style="position: relative;">
		<div class="col-lg-4"></div>
		<div class="col-lg-4" style="margin:20% 0%">
			<div class="jumbotron" style="padding-top: 20px;">
				<form method="post" action="gologin">
					<h3 style="text-align: center;">로그인 화면</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="아이디"
							name="id">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호"
							name="pw">
					</div>
					<input type="submit" class="btn btn-primary form-control" value="로그인">
				</form>
				<br>
				<div style="text-align:center;">
					<button type="button" class="btn btn-defult btn-sm"
						data-toggle="modal" data-target="#myModal">회원가입</button>
				</div>
			</div>
		</div>

		<div class="modal fade" id="myModal" role="dialog" style="height:600px; margin:15% 0%">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">회원가입</h4>
					</div>
					<div class="modal-body">
						<form method="post" action="gojoin">
						<%if(valid_id == null && valid_pw == null && valid_nick == null){ %>
							<div class="form-group">
								<input type="text" class="form-control" placeholder="아이디" 
									name="id" >
							</div>
							<div class="form-group">
								<input type="password" class="form-control" placeholder="비밀번호"
									name="pw" >
							</div>
							<div class="form-group">
								<input type="text" class="form-control" placeholder="닉네임"
									name="nick" >
							</div>
						<%}else{ %>
								<div class="form-group">
									<input type="text" class="form-control" placeholder="아이디" 
										value="<%=joinInfo.getId() %>" name="id" >
									<%if(valid_id != null){ %>
										<p><%=valid_id %></p>
									<%} %>
								</div>
								<div class="form-group">
									<input type="password" class="form-control" placeholder="비밀번호"
										value="<%=joinInfo.getPw() %>" name="pw" >
									<%if(valid_pw != null){ %>
										<p><%=valid_pw %></p>
									<%} %>
								</div>
								<div class="form-group">
									<input type="text" class="form-control" placeholder="닉네임"
										value="<%=joinInfo.getNick() %>" name="nick" >
									<%if(valid_nick != null){ %>
										<p><%=valid_nick %></p>
									<%} %>
								</div>
							<%} %>
							<input type="submit" class="btn btn-primary form-control"
								value="회원가입">
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script>
		// 페이지가 로드 되자마자 리스트 가져오기
		$(document).ready(()=>{
			if('<%=msg%>' !== 'null') alert('<%=msg%>')
			if('<%=jmsg%>' !== 'null') alert('<%=jmsg%>')
		})
	</script>
	
</body>
</html>