# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

MemberName = 
  validName: (name) ->
   return false

jQuery ->
  $().blur ->
    if MemberName.validName(@value)
      $().text("")
    else
      $().text("Only letters and spaces please"
