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
<link href="css/basic.css" rel="stylesheet" type="text/css">
</head>
<body>
	<%@include file="/WEB-INF/layouts/header.jsp"%>
	<div class="container">
		<div id="login_div">
		<div class="well" id="login_title">BootMusic</div>
			<form class="form-horizontal sm" method="post" action="login">
				 <div class="form-group form-group-lg" id="id_input" >
				    <div>
				      <input type="text" class="form-control" id="eid" placeholder="Enter email" name="id">
				    </div>
				  </div>
				  <div class="form-group form-group-lg" id="pw_input">
				    <div>
				      <input type="password" class="form-control" id="epw" placeholder="Enter password" name="pw">
				    </div>
				  </div>
				  <div class="form-group" id="sbm_input">
				    <div>
				      <button type="submit" class="btn btn-lg btn-default btn-block">로그인</button>
				    </div>
				  </div>
			</form>
			</div>
		</div>
</body>
</html>