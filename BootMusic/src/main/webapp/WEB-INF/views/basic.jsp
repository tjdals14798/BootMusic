<%@page import="java.util.List"%>
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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<link href="css/basic.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="container">
		<h2>Home</h2>
		<div class="panel panel-default">
		<nav class="navbar navbar-inverse">
		  <div class="container-fluid">
		    <ul class="nav navbar-nav" style="float:right;margin:8px;">
		      <li><input type="text" class="form-control" placeholder="검색" id="search"></li>
		      <li><button class="btn btn-default btn-sm form-control" onclick='SearchM()'><i class="bi bi-search"></i></button></li>
		    </ul>
		  </div>
		</nav>
			<div class="panel-body" id="list">
				<table class='table table-bordered table-hover' style='table-layout: fixed'></table>
			</div>
			<div class="panel-footer">뿌터</div>
		</div>
	</div>
	
	<script>
		function SearchM() {
			var name = $('#search').val();
			let apikey = "AIzaSyCSNiWe_-oP1a3hDT0Y8wImEyLxVOQL1sU";
			let keyword = name;
			$.ajax({
				url: "https://www.googleapis.com/youtube/v3/search",	//	요청경로
				type: "get",	//	요청방식
				dataType: "json",	//	서버 반환 데이터 타입
				data:{part:'snippet', key:apikey, q:keyword, maxResults:20, type:"video", videoEmbeddable:'true'},
				success: htmlView, //	result : 서버에서 반환해준 데이터
				error: function() {
					alert("통신실패");
				}
			}) 
		}
		
		function htmlView(data) {
			var result = "<table class='table table-bordered table-hover' style='table-layout:fixed'>";
			result += "<tbody><tr>";
			result += "<td style='width:140px'></td>";
			result += "<td style='width:50%'>제목</td>";
			result += "<td>작성자</td>";
			result += "<td>작성일</td>";
			result += "</tr>";
			$.each(data.items, (i, item) => {
				result += "<tr>";
				result += "<td style='vertical-align:middle'><img src='"+item.snippet.thumbnails.default.url+"'></img></td>";
				result += "<td id='t" + i + "'>"+ item.snippet.title+"</td>";
				result += "<td id='w" + i + "'>" + item.snippet.channelTitle + "</td>";
				result += "<td>" + item.snippet.publishTime + "</td>";
				result += "</tr>"; 
			})
			result += "</tbody></table>";
			$("#list").html(result)
		}
	</script>
</body>
</html>