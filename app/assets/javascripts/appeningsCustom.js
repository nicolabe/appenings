$(document).ready(function() {

	//nothing to see here
	// $(".appeningList").find("li").each(function(i) {
	// $(this).append(" BAM! " + i);
	// });


//toggle inn and out the field for adding an appening
$('.newAppeningButton, #cancelAppening').click(function() {
	$('#newAppening').slideToggle('fast', function() {
		$('.submit').on('click', function(){
			$(this).closest("form").submit();
		});
	});
});

});