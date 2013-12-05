# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
# Show spinner while saving:
toggleSpinner = -> $("#spinner").toggle()
$ ->
     $("#new_expense").validate
          rules:
               "expense[expense_category_id]":
                    required: true
               "expense[job_id]":
                    required: true
               "expense[expense_type_id]":
                    required: true
               "expense[expense_invoice]":
                    required: true
               "expense[total]":
                    required: true
          highlight: (element) ->
               $(element).closest('.control-group').children('label').removeClass('valid')
               $(element).closest('.control-group').removeClass('success').addClass('error');
          success: (element) ->
               element
                    .closest('.control-group').removeClass('error').addClass('success')
                    .closest('.control-group').children('label').addClass('valid')
          ignore: ':hidden'
          submitHandler: (form)-> 
               form.submit();
     $("#expenses_filter_form")
     .bind('ajax:before', toggleSpinner)
     .bind('ajax:complete', toggleSpinner)
     .bind('ajax:success', (event, data, status, xhr) ->
          $("#response").html("<i class='icon-ok' style='color: green; font-size: 14pt;'>").show().fadeOut("slow")
          $elem = $('body')
          $('html, body').animate({scrollTop: $elem.height()}, 800);
          )
     .bind('ajax:error', (xhr, status, error) -> )