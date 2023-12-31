const apikey = "AIzaSyCSNiWe_-oP1a3hDT0Y8wImEyLxVOQL1sU";
let username;
function ViewM() {
	let keyword = "PL4fGSI1pDJn6jXS_Tv_N9B8Z0HTRVJE0m";
	$.ajax({
		url: "https://youtube.googleapis.com/youtube/v3/playlistItems",	//	요청경로
		type: "get",	//	요청방식
		dataType: "json",	//	서버 반환 데이터 타입
		data: { part: 'snippet', key: apikey, playlistId: keyword, maxResults: 10 },
		success: testView, //	result : 서버에서 반환해준 데이터
		error: function() {
			alert("통신실패");
		}
	})
}

function testView(data) {
	var result = "<table class='table table-bordered table-hover' style='table-layout:fixed'>";
	result += "<tbody style='text-align:center;'><tr>";
	result += "<td style='width:140px;'></td>";
	result += "<td style='width:55%;'>제목</td>";
	result += "<td>작성자</td>";
	result += "<td style='width:100px;'>작성일</td>";
	result += "<td style='width:80px;'></td>";
	result += "</tr>";
	$.each(data.items, (i, item) => {
		console.log(data)
		var videoId = item.snippet.resourceId.videoId;
		var tnail = item.snippet.thumbnails.default.url;
		var title = item.snippet.title;
		var ctitle = item.snippet.videoOwnerChannelTitle;
		var pbTime = item.snippet.publishedAt.substr(0, 10);
		result += "<tr>";
		result += "<td id='tn" + i + "' name='" + tnail + "'style='vertical-align:middle'><img src='" + tnail + "'></img></td>";
		result += "<td id='tt" + i + "' name='" + title + "'>" + title + "</td>";
		result += "<td id='ct" + i + "' name='" + ctitle + "'>" + ctitle + "</td>";
		result += "<td id='pb" + i + "' name='" + pbTime + "'>" + pbTime + "</td>";
		result += "<td id='vi" + i + "' name='" + videoId + "'><button class='btn btn-default' id='pl_btn' onclick='addPlaylist(" + i + ")'>추가</button></td>";
		result += "</tr>";
	})
	result += "</tbody></table>";
	$("#list").html(result)
}

function SearchM() {
	var name = $('#search').val();
	let keyword = name;
	$.ajax({
		url: "https://www.googleapis.com/youtube/v3/search",	//	요청경로
		type: "get",
		dataType: "json",
		data: { part: 'snippet', key: apikey, q: keyword, maxResults: 10, type: "video", videoEmbeddable: 'true' },
		success: htmlView,
		error: function() {
			alert("통신실패");
		}
	})
}

function htmlView(data) {
	var result = "<table class='table table-bordered table-hover' style='table-layout:fixed'>";
	result += "<tbody style='text-align:center;'><tr>";
	result += "<td style='width:140px;'></td>";
	result += "<td style='width:55%;'>제목</td>";
	result += "<td>작성자</td>";
	result += "<td style='width:100px;'>작성일</td>";
	result += "<td style='width:80px;'></td>";
	result += "</tr>";
	$.each(data.items, (i, item) => {
		var videoId = item.id.videoId;
		var tnail = item.snippet.thumbnails.default.url;
		var title = item.snippet.title;
		var ctitle = item.snippet.channelTitle;
		var pbTime = item.snippet.publishTime.substr(0, 10);
		result += "<tr>";
		result += "<td id='tn" + i + "' name='" + tnail + "'style='vertical-align:middle'><img src='" + tnail + "'></img></td>";
		result += "<td id='tt" + i + "' name='" + title + "'>" + title + "</td>";
		result += "<td id='ct" + i + "' name='" + ctitle + "'>" + ctitle + "</td>";
		result += "<td id='pb" + i + "' name='" + pbTime + "'>" + pbTime + "</td>";
		result += "<td id='vi" + i + "' name='" + videoId + "'><button class='btn btn-default' id='pl_btn' onclick='addPlaylist(" + i + ")'>추가</button></td>";
		result += "</tr>";
	})
	result += "</tbody></table>";
	$("#list").html(result)
}

function addPlaylist(i) {
	var vi = $("#vi" + i).attr('name'), tn = $("#tn" + i).attr('name'), tt = $("#tt" + i).attr('name'),
		ct = $("#ct" + i).attr('name'), pb = $("#pb" + i).attr('name');

	if (username != "null") {
		if (window.confirm("재생목록에 추가 하시겠습니까?")) {
			$.ajax({
				url: "api/adpl",
				type: "post",
				data: { "videoId": vi, "title": tt, "thumbnail": tn, "channelTitle": ct, "publishTime": pb, "user": username },
				success: function() {
					alert("성공")
				},
				error: function() {
					alert("실패")
				}
			})
			console.log("성공");
		} else {
			console.log("취소. 변화 없음");
		}
	} else {
		if (window.confirm("로그인이 필요한 서비스입니다. 로그인 하시겠습니까?")) location.href = '/music/login';
	}
}