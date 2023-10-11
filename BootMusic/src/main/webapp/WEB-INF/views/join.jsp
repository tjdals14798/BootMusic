<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<link href="css/basic.css" rel="stylesheet" type="text/css">
</head>
<body>
<% String jmsg = (String)request.getAttribute("jmsg"); %>
<% Member joinInfo = (Member)request.getAttribute("joinInfo"); %>
<% String valid_id = (String)request.getAttribute("valid_id"); %>
<% String valid_pw = (String)request.getAttribute("valid_pw"); %>
<% String valid_nick = (String)request.getAttribute("valid_nick"); %>
<%@include file="/WEB-INF/layouts/header.jsp" %>
	<div class="container">
		<div class="login_div">
		<div class="well" id="login_title">BootMusic Join</div>
			<form class="form-horizontal sm" method="post" action="join">
			<%if(valid_id == null && valid_pw == null && valid_nick == null){ %>
				 <div class="form-group form-group-lg" id="id_input">
				    <div>
				      <input type="text" class="form-control" id="eid" placeholder="Enter email" name="id">
				    </div>
				  </div>
				  <div class="form-group form-group-lg" id="pw_input">
				    <div>
				      <input type="password" class="form-control" id="epw" placeholder="Enter password" name="pw">
				    </div>
				  </div>
				  <div class="form-group form-group-lg" id="nick_input">
				    <div>
				      <input type="text" class="form-control" id="eni" placeholder="Enter nickname" name="nick">
				    </div>
				  </div>
			<%}else{ %>
				 <div class="form-group form-group-lg" id="id_input">
				    <div>
				      <input type="text" class="form-control" id="eid" value="<%=joinInfo.getId() %>" name="id">
				      <%if(valid_id != null){ %>
				      	<p><%=valid_id %></p>
				      <%} %>
				    </div>
				  </div>
				  <div class="form-group form-group-lg" id="pw_input">
				    <div>
				      <input type="password" class="form-control" id="epw" value="<%=joinInfo.getPw() %>" name="pw">
				      <%if(valid_pw != null){ %>
				      	<p><%=valid_pw %></p>
				      <%} %>
				    </div>
				  </div>
				  <div class="form-group form-group-lg" id="nick_input">
				    <div>
				      <input type="text" class="form-control" id="eni" value="<%=joinInfo.getNick() %>" name="nick">
				      <%if(valid_nick != null){ %>
				      	<p><%=valid_nick %></p>
				      <%} %>
				    </div>
				  </div>
			<%} %>
				  <div class="form-group" id="sbm_input">
				    <div>
				      <button type="submit" class="btn btn-lg btn-default btn-block">회원가입</button>
				    </div>
				  </div>
			</form>
			</div>
		</div>
		
		<script>
		// 페이지가 로드 되자마자 리스트 가져오기
		$(document).ready(()=>{
			if('<%=jmsg%>' !== 'null') alert('<%=jmsg%>')
		})
	</script>
		
</body>
</html>