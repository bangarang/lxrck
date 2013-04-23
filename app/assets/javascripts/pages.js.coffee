jQuery ->
	$(".no-touch .top, .bottom").hover ->
		$($(this).data("coupling")).toggle()

	$(".touch .lxrck").click ->
		$(".lxrck-box").toggle()
		$(".dots-box").hide()

	$(".touch .dots").click ->
		$(".dots-box").toggle()
		$(".lxrck-box").hide()

	$(".title").hover (->
	  	$("body").addClass "hover"
	), ->
	  	$("body").removeClass "hover"