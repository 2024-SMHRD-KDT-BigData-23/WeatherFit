// 유효성 검사
window.addEventListener("load", function () {
  const forms = document.getElementsByClassName("validation-form");

  Array.prototype.filter.call(forms, (form) => {
    form.addEventListener("submit", function (e) {
      if (form.checkValidity() === false) {
        e.preventDefault();
        e.stopPropagation();
      }

      form.classList.add("was-validated");
    }, false);
  });
}, false);

/**
 * 
 */