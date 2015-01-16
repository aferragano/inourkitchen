$(document).ready(function() { 
	function hideShow(buttonID, showItem){
		$(showItem).hide();
		$(buttonID).on('click', function(){
			$(showItem).toggle("fast", function(){

			});
		});
	}
	hideShow($('#title'),$('#summary'));


});