$(document).ready(function() { 
	function hideShow(buttonID, showItem){
		$(showItem).hide();
		$(buttonID).on('click', function(){
			$(showItem).slideToggle("fast", function(){

			});
		});
	}
	hideShow($('#title'),$('#summary'));


});