// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require jquery3
//= require popper
//= require bootstrap
//= require select2
//= require_tree .

function toasterRemove(){
	for(let i = 0; i < document.getElementsByClassName('toast').length; i++){
	  let toast = document.getElementsByClassName('toast')[i]
	  toast.classList.remove('d-flex')
	}
}

if(document.getElementsByClassName('toast')){
	setTimeout(toasterRemove, 3000)
}

clearTimeout(toasterRemove)