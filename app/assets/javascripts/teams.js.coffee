submitFormToAddUser = ->
  $("#submit_team").on "click", ->
    $(this).parents(".add_user_form").submit()


$ ->
  submitFormToAddUser()