function showModal(target) {
	modal.style.display = "block";
	body.style.overflow = "hidden";

	modalbody.innerHTML += `
          <div class="close" onclick="removeModal()"> x </div>
        `}

function removeModal() {
	modal.style.display = "none";
	body.style.overflow = "auto";
}

let body = document.querySelector("body");
let modal = document.getElementById("modal");
let modalbody = document.getElementById("modal-body");

document.addEventListener("mouseup", function(e) {
	if (!modalbody.contains(e.target)) {
		modal.style.display = "none";
		body.style.overflow = "auto";
	}
});


$("#btn-login").click(function() {


		let login = document.getElementById("btn-login");

		showModal(login);
})
