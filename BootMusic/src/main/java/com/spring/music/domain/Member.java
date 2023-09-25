package com.spring.music.domain;


import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class Member {
	@NotBlank(message = "아이디는 필수 입력 값입니다")
	private String id;
	
	@NotBlank(message = "비밀번호는 필수 입력 값입니다")
	@Pattern(regexp = "^[ㄱ-ㅎ가-힣a-z0-9-_]{2,8}$", message = "비밀번호는 특수문자를 제외한 2~8자리여야 합니다.")
	private String pw;
	
	@NotBlank(message = "닉네임은 필수 입력 값입니다")
	@Pattern(regexp = "^[ㄱ-ㅎ가-힣a-z0-9-_]{2,6}$", message = "닉네임은 특수문자를 제외한 2~6자리여야 합니다.")
	private String nick;
}
