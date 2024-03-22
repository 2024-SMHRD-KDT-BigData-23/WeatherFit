package com.smhrd.model;

public class LikeVO {
	private int likeId;
	private String userNick;
	private int postIdx;

	// 생성자
	public LikeVO() {
	}

	// Getter 및 Setter 메서드
	public int getLikeId() {
		return likeId;
	}

	public void setLikeId(int likeId) {
		this.likeId = likeId;
	}

	public String getUserNick() {
		return userNick;
	}

	public void setUserNick(String userNick) {
		this.userNick = userNick;
	}

	public int getPostIdx() {
		return postIdx;
	}

	public void setPostIdx(int postIdx) {
		this.postIdx = postIdx;
	}
}
