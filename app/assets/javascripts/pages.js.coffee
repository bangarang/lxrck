jQuery ->

	$(".lxrck").click ->
		$(".lxrck-box").toggleClass("active")
		$(".dots-box").removeClass("active")

	$(".dots").click ->
		$(".dots-box").toggleClass("active")
		$(".lxrck-box").removeClass("active")

	$(".close").click ->
		$(".dots-box").removeClass("active")
		$(".lxrck-box").removeClass("active")

	$(".title a").hover (->
	  	$("body").addClass "hover"
	), ->
	  	$("body").removeClass "hover"

	$('textarea').autosize()
