# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
	$(".top, .bottom").hover ->
	  $($(this).data("coupling")).toggle()
	$(".lxrck").click ->
	  $(".lxrck-box").toggle()
	  $(".dots-box").hide()
	$(".dots").click ->
	  $(".dots-box").toggle()
	  $(".lxrck-box").hide()