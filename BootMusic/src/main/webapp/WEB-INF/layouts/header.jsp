<%@page import="com.spring.music.domain.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
</head>
<body>
	<%String id = (String)session.getAttribute("id"); %>
	<%String nick = (String)session.getAttribute("nick"); %>
	<div class="container">
		<nav class="navbar navbar-inverse">
		  <div class="container-fluid">
		    <div class="navbar-header">
		      <a class="navbar-brand" href="/music">BootMusic</a>
		    </div>
		    <ul class="nav navbar-nav">
		      <li><a href="/music/playlist">PalyList</a></li>
		    </ul>
		    <ul class="nav navbar-nav navbar-right">
		      <%if(id != null){ %>
		      	<li><a href="/music/logout"><span class="glyphicon glyphicon-log-in"></span> 로그아웃 </a></li>
		      	<li><a href="/music/mypage"><span class="glyphicon glyphicon-user"></span> <%=nick %></a></li>
		      <%}else{ %>
		      	<li><a href="/music/join"><span class="glyphicon glyphicon-user"></span> 가입하기</a></li>
		      	<li><a href="/music/login"><span class="glyphicon glyphicon-log-in"></span> 로그인</a></li>
		      <%} %>
		    </ul>
		  </div>
		</nav>
	</div>
</body>
</html>