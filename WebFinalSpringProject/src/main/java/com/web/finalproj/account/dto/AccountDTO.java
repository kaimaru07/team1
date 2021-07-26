package com.web.finalproj.account.dto;

public class AccountDTO {
	private int id;
	private String pwd;
	private String name;
	private String nickname;
	private String email;
	
	public AccountDTO() {}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
	@Override
	public String toString() {
		return "AccountDTO [id=" + id + ", pwd=" + pwd + ", name=" + name +
				", nickname=" + nickname + ", email=" + email + "]";
	}
}
