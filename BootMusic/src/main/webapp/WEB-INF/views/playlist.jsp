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
			<button class="btn btn-default" id='test_btn'>테스트버튼</button>
			<div class="panel-body" id="list">
				<table class='table table-bordered table-hover' style='table-layout: fixed'></table>
			</div>
			<div class="panel-footer">footer</div>
		</div>
		
		<button class="btn btn-default" onclick='goView()'>테스트 버튼 2</button>
		<div id = if_view>
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
			
			function goView() {
				if ($("#if_view").css("display") == "none") {
					$("#if_view").slideDown();
				} else {
					$("#if_view").slideUp();
				}
			}
		
		//youtube API 불러오는 부분
		var tag = document.createElement('script'); 
			tag.src = "https://www.youtube.com/iframe_api";
			var firstScriptTag = document.getElementsByTagName('script')[0];
			firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);
		
		var vIdarr = [];
		var idx = 0;

		//플레이어 변수 설정
		var player;
		function onYouTubeIframeAPIReady() {	// 재생목록 배열 생성 후 플레이어 대기
			var tbl_len = $("#pl_tbl >tbody tr").length;
			for(var i = 0; i < tbl_len; i++) vIdarr.push($("#vi"+i).attr('name'));
		  player = new YT.Player('player', {
		    events: {
		      'onReady': onPlayerReady,//로딩중에 이벤트 실행한다
		      'onStateChange': onPlayerStateChange//플레이어 상태 변화 시 이벤트를 실행한다.
		    }
		  });
		} 

		// 클릭시 해당노래 재생
		function onPlayerReady(event) {	
			//로딩된 후에 실행될 동작을 작성한다(소리 크기,동영상 속도를 미리 지정하는 것등등...)
			$('.tbl_tr').on('click', function(){
				idx = parseInt($(this).attr("id"));
				player.loadVideoById(vIdarr[idx]);
				event.target.playVideo();//자동재생
			});
		}
		// 클릭시 해당노래 재생

		// 노래가 끝나면 다음노래 재생 마지막 곡이면 처음으로 돌아감
		var playerState;
		function onPlayerStateChange(event) {
			console.log(idx);
			if (event.data == YT.PlayerState.ENDED) {
				idx += 1;
				//인덱스 초과면 플레이어 처음으로
				if(vIdarr.length <= idx) idx = 0;
				
				//인덱스 미만이면 다음노래 재생
				player.loadVideoById(vIdarr[idx]);
				event.target.playVideo();//자동재생
			}
		}
		// 노래가 끝나면 다음노래 재생 마지막 곡이면 처음으로 돌아감

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
	var tbl_len;
		function PlayListView(data) {
			var result = "<table id='pl_tbl' class='table table-bordered table-hover' style='table-layout:fixed'>";
			result += "<thead style='text-align:center;'><tr>";
			result += "<th style='width:140px;'></th>";
			result += "<th style='width:55%;'>제목</th>";
			result += "<th>작성자</th>";
			result += "<th style='width:100px;'>작성일</th>";
			result += "<th style='width:80px;'></th>";
			result += "</tr></thead><tbody>";
			$.each(data, (i, item) => {
				var videoId = item.videoId;
				var tnail = item.thumbnail;
				var title = item.title;
				var ctitle = item.channelTitle;
				var pbTime = item.publishTime;
				result += "<tr id='"+i+"' class='tbl_tr'>";
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