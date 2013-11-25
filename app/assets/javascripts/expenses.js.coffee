# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
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