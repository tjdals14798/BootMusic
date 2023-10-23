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
var player;		//플레이어 변수 설정
function onYouTubeIframeAPIReady() {	// 재생목록 배열 생성 후 플레이어 대기
	var tbl_len = $("#pl_tbl >tbody tr").length;
	for (var i = 0; i < tbl_len; i++) vIdarr.push($("#vi" + i).attr('name'));
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
	$('.tbl_tr').on('click', function() {
		idx = parseInt($(this).attr("id"));
		player.loadVideoById(vIdarr[idx]);
		event.target.playVideo();//자동재생
	});
}
// 클릭시 해당노래 재생

// 노래가 끝나면 다음노래 재생 마지막 곡이면 처음으로 돌아감
var playerState;
function onPlayerStateChange(event) {

	if (event.data == YT.PlayerState.PLAYING) {	//배너 만들어보기
		var title = $("#" + idx).children('td:eq(1)').attr('name');
		$("#playing_tt").text(title);
	}

	if (event.data == YT.PlayerState.ENDED) {
		idx += 1;
		//인덱스 초과면 플레이어 처음으로
		if (vIdarr.length <= idx) idx = 0;

		//인덱스 미만이면 다음노래 재생
		player.loadVideoById(vIdarr[idx]);
		event.target.playVideo();//자동재생
	}
}
// 노래가 끝나면 다음노래 재생 마지막 곡이면 처음으로 돌아감

// 음악 일시정지
function pauseMusic() {
	if (player.getPlayerState() == 1) {
		$("#li_play_btn").html("<span class='glyphicon glyphicon-play'></span>");
		player.pauseVideo();
	} else if (player.getPlayerState() == 2) {
		$("#li_play_btn").html("<span class='glyphicon glyphicon-stop'></span>");
		player.playVideo();
	}
}
// 음악 일시정지

//음악 음소거
function muteMusic() {
	if (player.isMuted()) {
		$("#li_mute_btn").html("<span class='glyphicon glyphicon-volume-off'>");
		player.unMute();
	} else {
		$("#li_mute_btn").html("<span class='glyphicon glyphicon-volume-up'>");
		player.mute();
	}
}
//음악 음소거

//음악 볼륨
function soundMusic() {
	var sound = $("#li_sound_bar").val() * 5;
	player.setVolume(sound);
}
//음악 볼륨

function loadPlayList(user) {
	console.log(user);
	$.ajax({
		url: "api/loadList",	//	요청경로				
		type: "post",	//	요청방식
		data: { "user": user },
		dataType: "json",	//	서버 반환 데이터 타입
		success: PlayListView,	//	result : 서버에서 반환해준 데이터
		error: function() {
			alert("통신실패");
		}
	})
}

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
		result += "<tr id='" + i + "' class='tbl_tr'>";
		result += "<td id='tn" + i + "' name='" + tnail + "'style='vertical-align:middle'><img src='" + tnail + "'></img></td>";
		result += "<td id='tt" + i + "' name='" + title + "'>" + title + "</td>";
		result += "<td id='ct" + i + "' name='" + ctitle + "'>" + ctitle + "</td>";
		result += "<td id='pb" + i + "' name='" + pbTime + "'>" + pbTime + "</td>";
		result += "<td id='vi" + i + "' name='" + videoId + "'><button class='btn btn-default' onclick='del_PlayList(" + i + ")'>삭제</button></td>";
		result += "</tr>";
	})
	result += "</tbody></table>";
	$("#list").html(result)
}

function del_PlayList(idx) {
	var videoId = $("#vi" + idx).attr('name');
	if(window.confirm("재생목록에서 삭제 하시겠습니까?")) {
		$.ajax({
			url: "api/delContent",	//	요청경로
			data: { "videoId": videoId },
			type: "post",	//	요청방식
			success: function() {
				window.location.reload()
			}, error: function() {
				alert("통신실패");
			}
		})		
	}
}