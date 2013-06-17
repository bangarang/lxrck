$('a').click(function() {
  console.log($(this).data('href') || $(this).attr('href'));
});