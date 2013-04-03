$(document).ready(function() {

	//nothing to see here
	// $(".appeningList").find("li").each(function(i) {
	// $(this).append(" BAM! " + i);
	// });

/** 
expand an appening to show further details.
*/
$('div[id^="appening_"]').click(function() {
	$(this).siblings('.appeningDetails').slideToggle('fast');
});


//toggle inn and out the field for adding an appening
$('.newAppeningButton, #cancelAppening').click(function() {
	$('#newAppening').toggle('drop', function() {
		$('.submit').on('click', function(){
			$(this).closest("form").submit();
		});
	});
});


//keep headers on top of waypoint using the waypoints plugin
$('.appeningHeader').waypoint('sticky');

});