jQuery ->

	$(".no-touch .lxrck, .lxrck-box").on
	  mouseenter: ->
	    $(".bottom").show()
	    $(".lxrck-box").show()

	  mouseleave: ->
	    $(".bottom").hide()
	    $(".lxrck-box").hide()


	$(".no-touch .dots, .dots-box").on
	  mouseenter: ->
	    $(".bottom").show()
	    $(".dots-box").show()

	  mouseleave: ->
	    $(".bottom").hide()
	    $(".dots-box").hide()

	$(".touch .lxrck").click ->
		$(".lxrck-box").toggle()
		$(".bottom").show()
		$(".dots-box").hide()

	$(".touch .dots").click ->
		$(".dots-box").toggle()
		$(".bottom").show()
		$(".lxrck-box").hide()

	$(".title a").hover (->
	  	$("body").addClass "hover"
	), ->
	  	$("body").removeClass "hover"

	$('textarea').autosize()
