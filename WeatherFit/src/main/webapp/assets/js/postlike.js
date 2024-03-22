$("#btn-like").on("click", function() {
	
	$.ajax({
		url: "PostLike",
		type: "get",
		data: {"userId": "ehdwn123", "postIdx": 1, "likeCheck": 1},
		dataType: "json",
		success: function(res) {
			console.log(res);
		},
		error: function() {
			console.log("통신 실패..");
		}
	});
	
});