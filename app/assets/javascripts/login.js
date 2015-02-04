$(document).ready(function() { 
	function hideShow(buttonID, showItem){
		$(showItem).hide();
		$(buttonID).on('click', function(){
			$(showItem).slideToggle("slow", function(){

			});
		});
	}
	hideShow($('#login-btn'),$('.login-div'));
	hideShow($('#sign-up-btn'),$('.sign-up-div'));
	hideShow($('#user-btn'),$('.user-options'));

 
});