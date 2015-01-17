$(document).ready(function() { 
	function hideShow(buttonID, showItem){
		$(showItem).hide();
		$(buttonID).on('click', function(){
			$(showItem).slideToggle("slow", function(){

			});
		});
	}
	hideShow($('#title'),$('#summary'));
	hideShow($('#comment-recipe-btn'),$('.comment'));
	hideShow($('#stories-recipe-btn'),$(''));
	hideShow($('#hints-btn'),$('#hints'));
	hideShow($('#about-btn'),$('#about'));
	hideShow($('#careers-btn'),$('#careers'));

});