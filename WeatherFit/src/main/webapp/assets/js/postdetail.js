// 메인화면에서 게시글 클릭하면 게시글 상세확인 페이지로
// let cards = document.getElementsByClassName("card");

// for (let i = 0; i < cards.length; i++)
//     cards[i].addEventListener("click", function () {
//         window.location.href = 'gopostdetail.do'
//     });

$("document").on("click", ".card", function() {
	location.href = "gopostdetail.do";
});

// 채팅 버튼 클릭시 채팅페이지로 
document.getElementById("message-wrap").addEventListener("click", function () {
    window.location.href = 'gochat.do'
});




// 좋아요 하트 활성화
let like = document.getElementById("like-heart");

like.addEventListener("click", function () {
    like.classList.toggle("active")
});

