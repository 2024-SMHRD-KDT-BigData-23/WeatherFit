 package com.smhrd.model;

public class LikeVO {
	
	private int likeIdx;
	private int postIdx;
	private String userNick;
	private int likeCheck;
	
	public int getLikeIdx() {
		return likeIdx;
	}
	public void setLikeIdx(int likeIdx) {
		this.likeIdx = likeIdx;
	}
	public int getPostIdx() {
		return postIdx;
	}
	public void setPostIdx(int postIdx) {
		this.postIdx = postIdx;
	}
	public String getUserNick() {
		return userNick;
	}
	public void setUserNick(String userNick) {
		this.userNick = userNick;
	}
	public int getLikeCheck() {
		return likeCheck;
	}
	public void setLikeCheck(int likeCheck) {
		this.likeCheck = likeCheck;
	}
	
	public LikeVO(int likeIdx, int postIdx, String userNick, int likeCheck) {
		this.likeIdx = likeIdx;
		this.postIdx = postIdx;
		this.userNick = userNick;
		this.likeCheck = likeCheck;
	}
	
	public LikeVO() {
		
	}
	
	
	
}
