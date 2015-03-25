# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  button = $("#send-response")

  button.click (event) ->
    
    console.log "send-response clicked"
    content = $("#response-input").val()
    id = button.data('id')
    $.ajax
      type: "POST"
      url: "#{id}/responses.json"
      data: { content: content }
      dataType: "json"
      success: (data) ->
        console.log ('reload me')
        window.location.reload(true)
      error: (e) ->
        console.log e
