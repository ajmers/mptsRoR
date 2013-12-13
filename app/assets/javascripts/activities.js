# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$('input[placeholder]').focus(function(ev){ 
  var $this = $(this);
  if ($this.val() === $this.attr('placeholder')) $this.val('');
}).blur(function(ev){
  var $this = $(this);      
  if ($this.val() === '') $this.val($this.attr('placeholder'));
});