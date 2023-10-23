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
<script src="js/playlist.js"></script>
</head>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<body>
<%@include file="/WEB-INF/layouts/header.jsp" %>
	<!-- DB 해결 유저별 플레이리스트 1개 해보기.. 관리자가 DB 업데이트 이후 플리에 저장가능하게? 유저가 추가? 중복값이 너무 많아짐-->
	<div class="container">
		<div class="panel panel-default">
			<nav class="navbar navbar-inverse">
			  <div class="container-fluid row" style="padding-top: 4px; margin-left: 10%;">
			  	<div class="well well-sm col-sm-8" style="margin: auto;"><b id="playing_tt">재생중인 노래 없음</b></div>
			    <ul id="searchbar" class="nav navbar-nav" >
			      <li><button id="li_play_btn" onclick="pauseMusic()"><span class="glyphicon glyphicon-play"></span></button></li>
			      <li><button id="li_mute_btn" onclick="muteMusic()"><span class="glyphicon glyphicon-volume-off"></span></button></li>
			      <li><input style="margin-top:4px; accent-color:white;" type="range" min="0" max="20" id="li_sound_bar" onchange="soundMusic()"></li>
			    </ul>
			  </div>
			</nav>
			<div class="panel-body" id="list">
				<table class='table table-bordered table-hover' style='table-layout: fixed'></table>
			</div>
			<div class="panel-footer" style="text-align: center;"><button class="btn btn-default" onclick='goView()'>영상보기</button></div>
		</div>
		
		<div class="container" id =if_view style="text-align: center;">
			<div id="player"></div>
		</div>
	</div>
			
	<script>
		$(document).ready(()=>{
			$("#if_view").css("display", "none")
			
			if("<%=id%>" != "null") {
				loadPlayList('<%=id%>');
			}else{
				var result = "<div class='alert alert-warning'>로그인 후 이용하세요.</div>";
				$("#list").html(result)
			}
		})
	</script>
</body>
</html>