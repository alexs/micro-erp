# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


# Show spinner while saving:
toggleSpinner = -> $("#spinner").toggle()

# When the page is ready:
$(->
	$("#refund_filter_form")
	.bind('ajax:before', toggleSpinner)
	.bind('ajax:complete', toggleSpinner)
	.bind('ajax:success', (event, data, status, xhr) ->
		$("#response").html("<i class='icon-ok' style='color: green; font-size: 14pt;'>").show().fadeOut("slow")
		$elem = $('body')
		$('html, body').animate({scrollTop: $elem.height()}, 800);
		)
	.bind('ajax:error', (xhr, status, error) -> )
	)