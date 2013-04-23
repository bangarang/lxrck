jQuery ->
	$(".no-touch .top, .no-touch .bottom").hover ->
	  $($(this).data("coupling")).toggle()
	$(".touch .lxrck").click ->
	  $(".lxrck-box").toggle()
	  $(".dots-box").hide()
	$(".touch .dots").click ->
	  $(".dots-box").toggle()
	  $(".lxrck-box").hide()