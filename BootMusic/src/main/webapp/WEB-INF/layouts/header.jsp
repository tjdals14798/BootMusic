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
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<a class="navbar-brand">Board</a>
		</div>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="/ext/">메인</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<%if(id != null){ %>
					<li><a href="profil?id=<%=id%>"><%=nick%>님</a></li>
					<li><a href="logout">로그아웃</a></li>
				<%}else{ %>
					<li><a href="/ext/login">로그인</a></li>
				<%} %> 
			</ul>
		</div>
	</nav>
</body>
</html>