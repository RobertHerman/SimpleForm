# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

MemberName = 
  validName: (name) ->
   return false

jQuery ->
  $("#member_name").blur ->
    if MemberName.validName(@value)
      $("#member_name_error").text("")
    else
      $("#member_name_error").text("Only letters and spaces please")
