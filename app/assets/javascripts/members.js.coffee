# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

Member=
  validationList: { name: false, age: false, eua: false }

  validName: (name) ->
    #a valid name must have at least first and last name separated by whitespace
    #a valid name might include hyphens
    return false if name.match(/[^A-Za-z -]+/) isnt null
    return false if name.match(/\s\w/) is null
    @validationList["name"] = true

  validAge: (age) ->
    return false if parseInt(age) is NaN
    @validationList["age"] = 1 <= age <= 100

  validFavoriteFood: (food) ->
    return food.length isnt 0

  validEUA: (eua) ->
    @validationList["eua"] = eua

  validForm: ->
    console.log(@validationList)
    return @validationList["name"] and @validationList["age"] and @validationList["eua"]

jQuery ->
  $(document).ready ->
    $("#member_accepted_eua_error").text("To use this site you must agree to the EUA!")
    $("#member_name_error").text("*")
    $("#member_age_error").text("*")
    $(".enableOnValidatedData").prop("disabled", true)

  $("#member_name").blur ->
    if Member.validName(@value)
      $("#member_name_error").text("")
    else
      $("#member_name_error").text("First and Last Name - letters, hyphens, and spaces only")

  $("#member_age").blur ->
    if Member.validAge(@value)
      $("#member_age_error").text("")
    else
      $("#member_age_error").text("1 - 100")

  $("#member_favorite_food").blur ->
    if Member.validFavoriteFood(@value)
      $("#member_favorite_food_error").text("")
    else
      $("#member_favorite_food_error").text("Nothing? not even jibberish?")

  $("#member_accepted_eua").click ->
    if Member.validEUA(@checked)
      $("#member_accepted_eua_error").text("")
      if Member.validForm()
        $(".enableOnValidatedData").prop("disabled", false)
    else
      $("#member_accepted_eua_error").text("To use this site you must agree to the EUA!")
      $(".enableOnValidatedData").prop("disabled", true)

