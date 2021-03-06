$(document).ready(function() {


/** 
Expand an appening to show further details.
toggle expanded appenings when expanding a new one.
*/
$('[id^="appening_"]').click(function() {
	var $details = $(this).siblings('.appeningDetails');
	$(this).children('i').toggleClass( 'icon-chevron-up icon-chevron-down');
	$details.slideToggle('fast');

	if(!$details.hasClass('open')){

		//if there is an open appening, toggle it
		if($('.open').length > 0 ){
			var $open = $('.open');
			$open.slideToggle('fast');
			$open.removeClass('open');
		}

		$details.addClass('open');

	} else {
		$details.removeClass('open');
	}

});


//show new appening field if hidden, if  not visible scroll to field
$('.newAppeningButton').click(function() {
	if(!$('#newAppening').is(":visible")){
		$('#newAppening').show('drop', function() {
			$('.submit').on('click', function(){
				$(this).closest("form").submit();
			});
		});
	} else {
		//scroll to top
		$('html, body').animate({
			scrollTop: $(".appeningList").offset().top
		}, 300);

	}
});


//keep headers on top of topbar. using the waypoints plugin
$('.appeningHeader').waypoint('sticky');

//remove alerts after x ms
var x = 2000;
$('.notice').delay(x).fadeOut();
$('.alert').delay(x).fadeOut();

});