# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery(document).ready ($) ->
  $('h3.fold').next('ol').hide()
  $('h3.fold').click (e) ->
    e.preventDefault()
    $(this).toggleClass('open')
    $(this).next('ol').toggle()
