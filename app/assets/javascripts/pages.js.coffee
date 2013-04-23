jQuery ->

	$(".no-touch .lxrck, .lxrck-box").on
	  mouseenter: ->
	    $(".lxrck-box").show()

	  mouseleave: ->
	    $(".lxrck-box").hide()

	$(".no-touch .dots, .dots-box").on
	  mouseenter: ->
	    $(".dots-box").show()
	  mouseleave: ->
	    $(".dots-box").hide()

	$(".touch .lxrck").click ->
		$(".lxrck-box").toggle()
		$(".dots-box").hide()

	$(".touch .dots").click ->
		$(".dots-box").toggle()
		$(".lxrck-box").hide()

	$(".title a").hover (->
	  	$("body").addClass "hover"
	), ->
	  	$("body").removeClass "hover"

	$("a").click ->
  		console.log $(this).data("href") or $(this).attr("href")
