// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).ready(function(){
	$(".menu_1woac6s1").hide();
	$(".link_cr2i2a1").click(function(event){
		event.stopPropagation();
		$(".menu_1woac6s1").toggle();
	});

	$(document).click(function(){
    	$('.menu_1woac6s1').hide();
	});
});
$(document).ready(function(){
	$(".menu_1woac6s5").hide();
	$(".link_cr2i2a5").click(function(event){
		event.stopPropagation();
		$(".menu_1woac6s5").toggle();
	});

	$(document).click(function(){
    	$('.menu_1woac6s5').hide();
	});
});

$(document).ready(function(){
	function showSignupContainer(){
		$(".signup_container1").toggle();
	}
	$('.innerContainer_55rzx8').click(function(e){
		target = $(e.target)
		if(!(target === $('.content_u9w7hs') || target.parents('.content_u9w7hs').length > 0)) {
			$(".signup_container1").hide()
		}
	})

	$(".signup_container1").hide();
	$(".link_cr2i2a3").click(function(event){
		event.stopPropagation();
		showSignupContainer()
	});
});

$(document).ready(function(){
	function showLoginContainer(){
		$(".login_container1").toggle();
	}
	$('.innerContainer_55rzx8').click(function(e){
		target = $(e.target)
		if(!(target === $('.content_u9w7hs') || target.parents('.content_u9w7hs').length > 0)) {
			$(".login_container1").hide()
		}
	})
	
	$(".login_container1").hide();
	$(".link_cr2i2a4").click(function(event){
		event.stopPropagation();
		showLoginContainer();
	});
	$(".component_9w5i1l").click(function(event){
		event.stopPropagation();
		event.preventDefault();
		showLoginContainer();
	});
});

