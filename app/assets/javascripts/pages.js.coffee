jQuery ->
	$(".top, .bottom").hover ->
	  $($(this).data("coupling")).toggle()
	$(".lxrck").click ->
	  $(".lxrck-box").toggle()
	  $(".dots-box").hide()
	$(".dots").click ->
	  $(".dots-box").toggle()
	  $(".lxrck-box").hide()