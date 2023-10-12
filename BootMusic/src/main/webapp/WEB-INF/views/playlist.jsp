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
<%@include file="/WEB-INF/layouts/header.jsp" %>
	<div class="container">
		<div class="panel panel-default">
			<nav class="navbar navbar-inverse">
			  <div class="container-fluid">
			    <ul id="searchbar" class="nav navbar-nav" >
			      <li><input type="text" class="form-control" placeholder="검색" id="search"></li>
			      <li><button class="btn btn-default btn-sm form-control"><i class="bi bi-search"></i></button></li>
			    </ul>
			  </div>
			</nav>
			<div class="panel-body" id="list">
				<table class='table table-bordered table-hover' style='table-layout: fixed'></table>
			</div>
			<div class="panel-footer">footer</div>
		</div>
		
		<div id="player"></div>

		<script>
		//youtube API 불러오는 부분
		var tag = document.createElement('script');
		tag.src = "https://www.youtube.com/iframe_api";
		var firstScriptTag = document.getElementsByTagName('script')[0];
		firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

		//플레이어 변수 설정
		var player;
		var videoId = 'DdF-u3fe5pg';
		console.log("시작"+videoId);
		function onYouTubeIframeAPIReady() {
		  player = new YT.Player('player', {
		    //width&height를 설정할 수 있으나, 따로 css영역으로 뺐다.
		    videoId: videoId,
		    events: {
		      'onReady': onPlayerReady,//로딩중에 이벤트 실행한다
		      'onStateChange': onPlayerStateChange//플레이어 상태 변화 시 이벤트를 실행한다.
		    }
		  });
		}

		function onPlayerReady(event) {
		 //로딩된 후에 실행될 동작을 작성한다(소리 크기,동영상 속도를 미리 지정하는 것등등...)
		  event.target.playVideo();//자동재생
		 
		}

		var playerState;
		function onPlayerStateChange(event) {
			if (event.data == YT.PlayerState.ENDED) {
				player.loadVideoById('_Hu4GYtye5U');
				event.target.playVideo();//자동재생
			}
			/* playerState = event.data == YT.PlayerState.ENDED ? '종료됨' :
					event.data == YT.PlayerState.PLAYING ? '재생 중' :
					event.data == YT.PlayerState.PAUSED ? '일시중지 됨' :
					event.data == YT.PlayerState.BUFFERING ? '버퍼링 중' :
					event.data == YT.PlayerState.CUED ? '재생준비 완료됨' :
					event.data == -1 ? '시작되지 않음' : '예외';

			console.log('onPlayerStateChange 실행: ' + playerState); */
		}
		</script>
		
	</div>
	
	<script>
		$(document).ready(()=>{
			if("<%=id%>" != "null") {
				loadPlayList('<%=id%>');
			}else{
				var result = "<div class='alert alert-warning'>로그인 후 이용하세요.</div>";
				$("#list").html(result)
			}
		})
	</script>
	
	<script>
		function loadPlayList(user) {
			$.ajax({
				url: "api/loadList",	//	요청경로
				type: "post",	//	요청방식
				data: {"user":user},
				dataType: "json",	//	서버 반환 데이터 타입
				success: PlayListView,	//	result : 서버에서 반환해준 데이터
				error: function() {
					alert("통신실패");
				}
			})
		}
	
		function PlayListView(data) {
			var result = "<table class='table table-bordered table-hover' style='table-layout:fixed'>";
			result += "<tbody style='text-align:center;'><tr>";
			result += "<td style='width:140px;'></td>";
			result += "<td style='width:55%;'>제목</td>";
			result += "<td>작성자</td>";
			result += "<td style='width:100px;'>작성일</td>";
			result += "<td style='width:80px;'></td>";
			result += "</tr>";
			$.each(data, (i, item) => {
				var videoId = item.videoId;
				var tnail = item.thumbnail;
				var title = item.title;
				var ctitle = item.channelTitle;
				var pbTime = item.publishTime;
				result += "<tr>";
				result += "<td id='tn"+i+"' name='"+tnail+"'style='vertical-align:middle'><img src='"+tnail+"'></img></td>";
				result += "<td id='tt"+i+"' name='"+title+"'>"+title+"</td>";
				result += "<td id='ct"+i+"' name='"+ctitle+"'>"+ctitle+"</td>";
				result += "<td id='pb"+i+"' name='"+pbTime+"'>"+pbTime+"</td>";
				result += "<td id='vi"+i+"' name='"+videoId+"' hidden></td>";
				result += "<td><button class='btn btn-default' id='pl_btn' onclick='addPlaylist("+i+")'>삭제</button></td>";
				result += "</tr>"; 
			})
			result += "</tbody></table>";
			$("#list").html(result)
		}
	</script>

</body>
</html>