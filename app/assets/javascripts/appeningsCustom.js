$(document).ready(function() {

	//nothing to see here
	// $(".appeningList").find("li").each(function(i) {
	// $(this).append(" BAM! " + i);
	// });

/** 
Expand an appening to show further details.
toggle expanded appenings when expanding a new one.
*/
$('.appening').click(function() {
	var $details = $(this).children('.appeningDetails');
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


//show field if hidden, if visible scroll to field
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
$('.notice').delay(2000).fadeOut();
$('.alert').delay(2000).fadeOut();

});