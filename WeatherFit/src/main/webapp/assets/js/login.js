// 모달창
      // 로그인버튼에 id="btn-login" 추가
      let login = document.getElementById("btn-login");
      login.addEventListener("click", function () {
        showModal(this);
      });

      let body = document.querySelector("body");
      let modal = document.getElementById("modal");
      let modalbody = document.getElementById("modal-body");

      function showModal(target) {
        modal.style.display = "block";
        body.style.overflow = "hidden";

        modalbody.innerHTML += `
          <div class="close" onclick="removeModal()"> x </div>
        `}

      document.addEventListener("mouseup", function (e) {
        if (!modalbody.contains(e.target)) {
          modal.style.display = "none";
          body.style.overflow = "auto";

        }
      });

      function removeModal() {
        modal.style.display = "none";
        body.style.overflow = "auto";
      }