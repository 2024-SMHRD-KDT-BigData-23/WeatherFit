// 회원가입 모달창 js


// 회원가입 버튼에 클릭 이벤트리스너 추가
// : 첫화면이 아닌, 로그인 클릭하면 나오는 모달창에 있기 때문에 
document.addEventListener("DOMContentLoaded", function () {
    document.addEventListener("click", function (e) {
        if (e.target.id == "div-jointxt") {
            showJoinModal();
        }
    })

    function showJoinModal() {
        // 회원가입 모달창 띄우기
        document.getElementById("modal").style.display = "block";
        document.getElementById("modal-body-join").style.overflow = "hidden";
        // 로그인 모달창 없애기
        document.getElementById("modal-body-login").style.display = "none";
        // 회원가입 폼 띄우기
        document.getElementById("modal-body-join").style.display = "block";
        // 닫기버튼
        document.getElementsByClassName("btn-close")[1].addEventListener("click", function () {
            removeModal();
        })
    }

    // 모달 닫기
    function removeModal() {
        document.getElementById("modal").style.display = "none";
        document.querySelector("body").style.overflow = "auto";
    }

    // 바깥 영역 클릭하면 닫히게
    document.addEventListener("mouseup", function (e) {
        if (!document.getElementById("modal-body-login").contains(e.target) && !document.getElementById("modal-body-join").contains(e.target)) {
            removeModal();
        }
    });

});