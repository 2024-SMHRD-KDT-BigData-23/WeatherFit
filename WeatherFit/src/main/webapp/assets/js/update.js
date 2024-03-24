// 회원정보수정 모달창 js
document.addEventListener("DOMContentLoaded", function () {
    let update = document.getElementById("btn-update");
    update.addEventListener("click", function () {
      showUpdateModal();
    });

    let body = document.querySelector("body");
    let modal = document.getElementById("modal");
    let modalUpdate = document.getElementById("modal-body-update");

    function showUpdateModal() {
      modal.style.display = "block";
      body.style.overflow = "hidden";


      let close = document.getElementsByClassName("btn-close")[0];
      close.addEventListener("click", function () {
        removeModal();
      })

    }

    function removeModal() {
      modal.style.display = "none";
      body.style.overflow = "auto";


      // 바깥 영역 클릭하면 닫히게
      document.addEventListener("mouseup", function (e) {
        if (!modalUpdate.contains(e.target)) {
          modal.style.display = "none";
          body.style.overflow = "auto";
        }
      });
    }
  });
  // 여기까지 회원정보수정 모달창 js
