$(document).ready(
	function(){
		$("a#like_button, a#dislike_button").bind("ajax:success",
			function(evt, data, status, xhr){
				if (data != null) {
					$(".jokecontent").text(data.content);
					$("#like_button").attr("href","/jokes/like/" + data.id);
					$("#dislike_button").attr("href","/jokes/dislike/" + data.id);
				}
				else {
					var noJokeMessage = "<h4 class=\"noJokeMessage\">That's all the jokes for today! Come back another day!</h4>";
					$("#contentArea").empty().append(noJokeMessage);
				}
			}).bind("ajax:error", function(evt, data, status, xhr){
                    //do something with the error here	
                    console.log(data);
                });
			});