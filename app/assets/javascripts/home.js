$(document).ready(function(){
  $('#copy-link').on("click", function(){
    var that = this;
    $(this).text(" Copied!");
    navigator.clipboard.writeText(window.location.href)
    setTimeout(function() {
      $(that).text("");
    }, 1500);
  });
})