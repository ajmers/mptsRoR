// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

$(window).scroll(function() {
	console.log('scrolling');
	var $toptitle = $('#toptitle');
    if ($(this).scrollTop()>150)
     {
        $toptitle.fadeIn();
     }
    else
     {
      $toptitle.fadeOut();
     }
 });
