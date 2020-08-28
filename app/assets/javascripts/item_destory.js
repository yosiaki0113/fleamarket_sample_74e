document.addEventListener(
  "DOMContentLoaded", e => {
    let modal_open = document.getElementById("modal-open-btn");
    modal_open.onclick = function () {
      $('#overlay1').fadeIn();
      
      document.getElementById('modal-close-btn').onclick = function () {
        $('#overlay1').fadeOut();
      };
      document.getElementById("delete-comformation-btn").onclick = function () {
        $('#overlay2').fadeIn();
        document.getElementById("item-delete-btn").click();
      };
    };
  },
  false
);