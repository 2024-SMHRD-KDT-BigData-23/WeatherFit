(function() {
	$.ajax({
		url: "Posts",
		type: "get",
		dataType: "json",
		success: function(posts) {
			console.log(posts);
		},
		error: function(err) {
			console.log("연결 실패");
		}
	})
}());