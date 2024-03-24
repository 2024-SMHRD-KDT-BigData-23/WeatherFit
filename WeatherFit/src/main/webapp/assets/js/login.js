// 로그인 버튼 클릭시 로그인 모달창 띄우기


document.addEventListener("DOMContentLoaded", function() {
	document.getElementById("btn-login").addEventListener("click", function() {
		showLoginModal();
	});

	function showLoginModal() {
		//
		document.getElementById("modal").style.display = "block";
		document.querySelector("body").style.overflow = "hidden";
		document.getElementById("modal-body-login").style.display = "block";
		document.getElementById("modal-body-join").style.display = "none";
		// 닫기버튼 클릭시 닫힘
		document.getElementsByClassName("btn-close")[0].addEventListener("click", function() {
			removeModal();
		})
	}

	function removeModal() {
		document.getElementById("modal").style.display = "none";
		document.querySelector("body").style.overflow = "auto";
	}

});
