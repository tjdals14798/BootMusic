package com.spring.music.domain;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class Content {
	
	private String videoId;
	private String title;
	private String thumbnail;
	private String channelTitle;
	private String publishTime;
	private String user;
}
