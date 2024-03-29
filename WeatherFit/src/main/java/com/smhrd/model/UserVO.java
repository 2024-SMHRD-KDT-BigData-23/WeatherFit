package com.smhrd.model;

//회원 
public class UserVO {

   // 회원 아이디
   private String userId;

   // 회원 비밀번호
   private String userPw;

   // 회원 이름
   private String userName;

   // 회원 성별
   private int userGender;

   // 회원 닉네임
   private String userNick;

   // 회원 지역
   private String userRegion;

   // 회원 가입일자
   private int joinedAt;

   // 회원 키
   private Double userHeight;

   // 회원 몸무게
   private Double userWeight;

   // 회원 프로필이미지
   private String userProfileImg;

   // 회원 프로필소개
   private String userProfileInfo;

   

   
 public UserVO() {

 }
  
 public String getUserId() {
     return userId;
 }
  
 public void setUserId(String userId) {
     this.userId = userId;
 }

 public String getUserPw() {
     return userPw;
 }

 public void setUserPw(String userPw) {
     this.userPw = userPw;
 }

 public String getUserName() {
     return userName;
 }

 public void setUserName(String userName) {
     this.userName = userName;
 }

 public int getUserGender() {
     return userGender;
 }

 public void setUserGender(int userGender) {
     this.userGender = userGender;
 }

 public String getUserNick() {
     return userNick;
 }

 public void setUserNick(String userNick) {
     this.userNick = userNick;
 }

 public String getUserRegion() {
     return userRegion;
 }

 public void setUserRegion(String userRegion) {
     this.userRegion = userRegion;
 }

 public int getJoinedAt() {
     return joinedAt;
 }

 public void setJoinedAt(int joinedAt) {
     this.joinedAt = joinedAt;
 }

 public double getUserHeight() {
     return userHeight;
 }

 public void setUserHeight(double userHeight) {
     this.userHeight = userHeight;
 }

 public double getUserWeight() {
     return userWeight;
 }


   public void setUserWeight(Double userWeight) {
      this.userWeight = userWeight;
   }

   public String getUserProfileImg() {
      return userProfileImg;
   }

   public void setUserProfileImg(String userProfileImg) {
      this.userProfileImg = userProfileImg;
   }

   public String getUserProfileInfo() {
      return userProfileInfo;
   }

   public void setUserProfileInfo(String userProfileInfo) {
      this.userProfileInfo = userProfileInfo;
   }


   

   public UserVO(String userId, String userPw, String userName, int userGender, String userNick, String userRegion,
         Double userHeight, Double userWeight, String userProfileImg, String userProfileInfo) {

      this.userId = userId;
      this.userPw = userPw;
      this.userName = userName;
      this.userGender = userGender;
      this.userNick = userNick;
      this.userRegion = userRegion;
      this.userHeight = userHeight;
      this.userProfileImg = userProfileImg;
      this.userProfileInfo = userProfileInfo;
   }

}