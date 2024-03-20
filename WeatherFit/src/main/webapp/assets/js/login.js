// 모달창
let body = document.querySelector("body");
let modal = document.getElementById("modal");
let modalbody = document.getElementById("modal-body");

function showModal(target) {
	modal.style.display = "block";
	body.style.overflow = "hidden";

	modalbody.innerHTML += `
          <div class="close" onclick="removeModal()"> x </div>
        `}

document.addEventListener("mouseup", function(e) {
	if (!modalbody.contains(e.target)) {
		modal.style.display = "none";
		body.style.overflow = "auto";

	}
});

document.addEventListener("DOMContentLoaded", function() {
	let login = document.getElementById("btn-login");
	login.addEventListener("click",()=>{
	showModal(login);
	});
	
	
});



let logout = document.getElementById("btn-logout");
logout.addEventListener("click", function() {
	location.href = 'Logout.do'
});



function removeModal() {
	modal.style.display = "none";
	body.style.overflow = "auto";
}
