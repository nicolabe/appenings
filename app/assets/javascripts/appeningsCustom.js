$(document).ready(function() {

	//le toggle for appening list if i can ever get it to work
	$(".appeningList").find("li").each(function(i) {
		$(this).append(" BAM! " + i);
	});

});